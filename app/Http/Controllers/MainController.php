<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use CRUDBooster;
use Session;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use PDFm;

class MainController extends Controller
{
    public function dashboard(){
        $data = [];

        if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 3 || CRUDBooster::myPrivilegeId() == 1) {
            $data['requestCount'] = DB::table('agreement_request')->get()->count();
            $data['requestRejectCount'] = DB::table('agreement_request')->where('status',0)->get()->count();
            $data['requestDraftApprovedCount'] = DB::table('agreement_request')->where('status',14)->get()->count();
            $data['requestFinalApprovedCount'] = DB::table('agreement_request')->where('status',19)->get()->count();
            $data['requestSignedDoc'] = DB::table('agreement_request')->where('status',16)->get()->count();
            $data['AGCIncharge'] = DB::table('agreement_request')->where('status',7)->get()->count();
            $data['AGCVerifier'] = DB::table('agreement_request')->where('status',9)->get()->count();
            $data['AGCApprover'] = DB::table('agreement_request')->where('status',11)->get()->count();
            $data['docVerifier'] = DB::table('agreement_request')->where('status',1)->get()->count();
            $data['docApprover'] = DB::table('agreement_request')->where('status',3)->get()->count();
            $data['renewal'] = DB::table('agreement_request')->where('renewal_need', 2)->whereBetween('end_date', [date("Y-m-d h:i:s"), date('Y-m-d h:i:s', strtotime("+60 days"))])->orderBy('id', 'desc')->get()->count();
            $data['expired'] = DB::table('agreement_request')->whereNull('renewal_need')->where('end_date', '<', date("Y-m-d h:i:s"))->orderBy('id', 'desc')->get()->count();
        } else {
            $data['requestCount'] = DB::table('agreement_request')->where('user_id',CRUDBooster::myId())->get()->count();
            $data['requestRejectCount'] = DB::table('agreement_request')->where('status',0)->where('user_id',CRUDBooster::myId())->get()->count();
            $data['requestDraftApprovedCount'] = DB::table('agreement_request')->where('status',14)->where('user_id',CRUDBooster::myId())->get()->count();
            $data['requestFinalApprovedCount'] = DB::table('agreement_request')->where('status',19)->where('user_id',CRUDBooster::myId())->get()->count();
            $data['requestSignedDoc'] = DB::table('agreement_request')->where('status',16)->where('user_id',CRUDBooster::myId())->get()->count();
            $data['renewal'] = DB::table('agreement_request')->where('renewal_need', 2)->where('user_id', CRUDBooster::myId())->whereBetween('end_date', [date("Y-m-d h:i:s"), date('Y-m-d h:i:s', strtotime("+60 days"))])->orderBy('id', 'desc')->get()->count();
            $data['expired'] = DB::table('agreement_request')->whereNull('renewal_need')->where('user_id', CRUDBooster::myId())->where('end_date', '<', date("Y-m-d h:i:s"))->orderBy('id', 'desc')->get()->count();
        }
        if($data['renewal']>0){
            DB::table('cms_notifications')
                ->where('id_cms_users', Crudbooster::me()->id)
                ->where('url', "/admin/renewal-list")
                ->update([
                    'is_read' => 1
            ]);
            DB::table('cms_notifications')->insert([
                'id_cms_users' => CRUDBooster::myId(),
                'content' => $data['renewal']. " Agreements to be renewed",
                'url' => "/admin/renewal-list",
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
        }
        $requesterCount = DB::table('cms_users')->where('id_cms_privileges',6)->get()->count();
        $verifierCount = DB::table('cms_users')->where('id_cms_privileges',7)->get()->count();
        $approverCount = DB::table('cms_users')->where('id_cms_privileges',8)->get()->count();
        if (CRUDBooster::isSuperadmin()) {
            $data['userCount'] = DB::table('cms_users')->get()->count();
        } else {
            $data['newRequest'] = DB::table('request')->where('to_user_id', Crudbooster::me()->id)->orderBy('id', 'desc')->where('opened',0)->count();
        }
        //charts
        $agreementType = DB::select("SELECT agreement_id,COUNT(*) as total FROM agreement_request GROUP BY agreement_id");
        $yearWise = DB::select("SELECT YEAR(created_at) AS years,COUNT(*) AS total FROM agreement_request GROUP BY years");
        foreach($agreementType as $res) {
            $agreelabel[] = getAgreementNameByID($res->agreement_id);
            $agreedataRes[] = $res->total;
        }
        foreach($yearWise as $res) {
            $yearlabel[] = $res->years;
            $yeardataRes[] = $res->total;
        }
        ////////
        if($agreementType) {
            $data['agreementschartjs'] = app()->chartjs
        ->name('lineChartTestagreement')
        ->type('line')
        ->size(['width' => 400, 'height' => 200])
        ->labels($agreelabel)
        ->datasets([
            [
                "label" => "Agreements",
                'backgroundColor' => "rgba(38, 185, 154, 0.31)",
                'borderColor' => "rgba(38, 185, 154, 0.7)",
                "pointBorderColor" => "rgba(38, 185, 154, 0.7)",
                "pointBackgroundColor" => "rgba(38, 185, 154, 0.7)",
                "pointHoverBackgroundColor" => "#fff",
                "pointHoverBorderColor" => "rgba(220,220,220,1)",
                'data' => $agreedataRes,
            ]
        ])
        ->options([]);
        }
        if ($yearWise) {
            $data['yearchartjs'] = app()->chartjs
        ->name('lineChartTestyear')
        ->type('line')
        ->size(['width' => 400, 'height' => 200])
        ->labels($yearlabel)
        ->datasets([
            [
                "label" => "Agreements",
                'backgroundColor' => "rgba(38, 185, 154, 0.31)",
                'borderColor' => "rgba(38, 185, 154, 0.7)",
                "pointBorderColor" => "rgba(38, 185, 154, 0.7)",
                "pointBackgroundColor" => "rgba(38, 185, 154, 0.7)",
                "pointHoverBackgroundColor" => "#fff",
                "pointHoverBorderColor" => "rgba(220,220,220,1)",
                'data' => $yeardataRes,
            ]
        ])
        ->options([]);
         }
        return view('pages.dashboard', $data);
    }

    public function userinfo($uid){

        $request_data = request()->all();
        // dd($request_data);

        if($request_data){
            $division_id = $request_data['divisionname'];
            $pcas = $request_data['pcaname'];
            $states = $request_data['statename'];
            if($pcas == ''){
                if(($division_id != '')){
                    $update = DB::table('cms_users')
                    ->where('id', $uid)
                    ->update([
                        'division_id' => implode(",",$division_id),
                    ]);
                }
            }else if($states){
                $update = DB::table('cms_users')
                    ->where('id', $uid)
                    ->update([
                        'division_id' => $division_id,
                        'state_id' => implode(",",$states),
                        'pca_id' => implode(",",$pcas),
                    ]);
            }
        }



        $data = [];

        $roleid = DB::table('cms_users')
        ->where('id',$uid)
        ->value('id_cms_privileges');

        $privilege = DB::table('cms_privileges')
        ->where('id',$roleid)
        ->value('name');

        $userdata = DB::table('cms_users')
        ->where('id',$uid)->get()->first();

        $data['userdata'] = $userdata;
        $data['userid'] = $uid;
        $data['roleid'] = $roleid;
        $data['states'] = DB::table('state')->get()->all();
        $data['division'] = DB::table('division')->get()->all();
        $data['business_unit'] = DB::table('business_unit')->get()->all();
        $data['privilege'] = $privilege;
        if($request_data){
            return CRUDBooster::redirect(CRUDBooster::adminPath('users'), "User details Updated", $type='success');
        }else{
            return view ('forms.userinfo',$data);
        }
    }

    public function inbox() {
        $data = [];
        $inbox = DB::table('request')
        ->where('to_user_id',Crudbooster::me()->id)
        ->whereNull('responded_at')
        ->get()->all();
        $data['inbox'] = $inbox;
        return view ('pages.inbox',$data);
    }

    public function outbox() {
        $data = [];
        $outbox = DB::table('request')
        ->where('from_user_id',Crudbooster::me()->id)
        ->whereNotNull('responded_at')
        ->get()->all();
        $data['outbox'] = $outbox;
        return view ('pages.inbox',$data);
    }

    public function listing() {
        $data = [];
        $data['pageTitle'] = "List of Requested Agreements";
        $geting = DB::table('request')
        ->where('to_user_id',Crudbooster::me()->id)
        ->select('agreement_request_id')
        ->groupBy('agreement_request_id')
        ->get()->all();
        $rid = array();
        foreach ($geting as $g) {
            $rid[] = $g->agreement_request_id;
        }
        rsort($rid);
        $data['requestForm'] = DB::table('agreement_request')->whereIn('id', $rid)->orderBy('id', 'desc')->get()->all();
        return view ('pages.list',$data);
    }

    public function listingStatusWise($status) {
        $data = [];
        $data['pageTitle'] = ($status == 0)?"Rejected List":"Approved List";
        $geting = DB::table('request')
        ->where('to_user_id',Crudbooster::me()->id)
        ->select('agreement_request_id')
        ->groupBy('agreement_request_id')
        ->get()->all();
        $rid = array();
        foreach ($geting as $g) {
            $rid[] = $g->agreement_request_id;
        }
        rsort($rid);
        if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 3 || CRUDBooster::myPrivilegeId() == 1) {
            $data['requestForm'] = DB::table('agreement_request')->where('status',$status)->orderBy('id', 'desc')->get()->all();
        } else {
            $data['requestForm'] = DB::table('agreement_request')->whereIn('id', $rid)->where('status',$status)->orderBy('id', 'desc')->get()->all();
        }

        return view ('pages.list',$data);
    }
    public function generatePDF($id, $copy, $space, $draft) {
        if($copy == "log") {
            $result = DB::table('agreement_copy_log')->where('id', $id)->get()->first();
        } else {
            $result = DB::table('agreement_copy')->where('id', $id)->get()->first();
        }
        $inc = 0;
        if($space == 25){
            $inc = 13;
        } else if($space == 50){
            $inc = 25;
        } else if($space == 75){
            $inc = 38;
        } else {
            $inc = 0;
        }
        $space = "";
        for($i=1; $i<=$inc; $i++) {
            $space .= "<br />";
        }
        /*
        $pdf = PDFm::loadHtml($result->document);
        //$pdf->mpdf->SetWatermarkImage(public_path('images/watermark.png'), 0.15, 'F');
        //$pdf->mpdf->showWatermarkImage = true;
        $pdf->mpdf->SetWatermarkText('DRAFT');
        $pdf->mpdf->showWatermarkText = true;
        return $pdf->download('hdtuto.pdf');
        */
        if($draft=="YES"){
            $footer = array (
                'L' => array (),
                'C' => array (
                    'content' => 'Page {PAGENO} of {nb}'
                ),
                'R' => array (),
                'line' => 0
            );
            $config = ['instanceConfigurator' => function($mpdf) {
                $mpdf->SetWatermarkText('DRAFT');
                $mpdf->showWatermarkText = true;
                $mpdf->defaultfooterline = false;
                $mpdf->setFooter('|Page {PAGENO} of {nb}|');
            }];
            return PDFm::loadHtml($space.$result->document, $config)->download('draftAgreement.pdf');
        } else {
            $config = ['instanceConfigurator' => function($mpdf) {
                $mpdf->defaultfooterline = false;
                $mpdf->setFooter('|Page {PAGENO} of {nb}|');
            }];
            return PDFm::loadHtml($space.$result->document, $config)->download('draftAgreement.pdf');
        }
    }

    public function generateWord($id, $copy, $space) {
        if($copy == "log") {
            $result = DB::table('agreement_copy_log')->where('id', $id)->get()->first();
        } else {
            $result = DB::table('agreement_copy')->where('id', $id)->get()->first();
        }
        $headers = array(
            "Content-type"=>"text/html",
            "Content-Disposition"=>"attachment;Filename=draftAgreement.doc"
        );
        $inc = 0;
        if($space == 25){
            $inc = 5;
        } else if($space == 50){
            $inc = 10;
        } else if($space == 75){
            $inc = 15;
        } else {
            $inc = 0;
        }
        $space = "";
        for($i=1; $i<=$inc; $i++) {
            $space .= "<br />";
        }
        return \Response::make($space.$result->document,200, $headers);
    }
    public function renewalListing() {
        $data = [];
        $data['pageTitle'] = "List of Renewal Agreements";
        $geting = DB::table('request')
        ->where('to_user_id',Crudbooster::me()->id)
        ->select('agreement_request_id')
        ->groupBy('agreement_request_id')
        ->get()->all();
        $rid = array();
        foreach ($geting as $g) {
            $rid[] = $g->agreement_request_id;
        }
        rsort($rid);
        if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1){
            $data['requestForm'] = DB::table('agreement_request')->where('renewal_need', 2)->whereBetween('end_date', [date("Y-m-d h:i:s"), date('Y-m-d h:i:s', strtotime("+60 days"))])->orderBy('id', 'desc')->get()->all();
        }else{
            $data['requestForm'] = DB::table('agreement_request')->where('renewal_need', 2)->where('user_id', Crudbooster::me()->id)->whereBetween('end_date', [date("Y-m-d h:i:s"), date('Y-m-d h:i:s', strtotime("+60 days"))])->orderBy('id', 'desc')->get()->all();
        }

        return view ('pages.renewal',$data);
    }

    public function expiredListing() {
        $data = [];
        $data['pageTitle'] = "List of Expired Agreements";
        $geting = DB::table('request')
        ->where('to_user_id',Crudbooster::me()->id)
        ->select('agreement_request_id')
        ->groupBy('agreement_request_id')
        ->get()->all();
        $rid = array();
        foreach ($geting as $g) {
            $rid[] = $g->agreement_request_id;
        }
        rsort($rid);
        if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1){
            $data['requestForm'] = DB::table('agreement_request')->whereNull('renewal_need')->where('end_date', '<', date("Y-m-d h:i:s"))->orderBy('id', 'desc')->get()->all();
        }else{
            $data['requestForm'] = DB::table('agreement_request')->whereNull('renewal_need')->where('user_id', CRUDBooster::myId())->where('end_date', '<', date("Y-m-d h:i:s"))->orderBy('id', 'desc')->get()->all();
        }

        return view ('pages.expired',$data);
    }
}
