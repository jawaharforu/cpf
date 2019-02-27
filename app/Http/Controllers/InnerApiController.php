<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use CRUDBooster;
use Session;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class InnerApiController extends Controller
{
    public function getPcaList($state_id, $division_id, $user_id)
    {
        $pcaList = DB::table('pca')
        ->whereIn('state_id', explode(',', $state_id))
        ->whereIn('division_id', explode(',', $division_id))
        ->get()->all();
        // dd($pcaList);
        $user = DB::table('cms_users')->where('id', $user_id)->get()->first();
        $html = "";
        foreach ($pcaList as $pca) {
            if (in_array($pca->id, explode(',', $user->pca_id))) {
                $select = "checked";
            } else {
                $select = "";
            }
            $html .= "<p><input class='pcaname' type='checkbox' ".$select." name='pcaname[".$pca->id."]' value='".$pca->id."' />".$pca->pca_code."-".$pca->pca_name."</p>";
        }
        echo $html;
    }

    public function getAttachmentList($agreement_id)
    {
        $agreement = DB::table('agreement')->where('id', $agreement_id)->get()->first();
        $attachmentList = DB::table('attachment')
        ->whereIn('id', explode(',', $agreement->attachment_id))
        ->get()->all();
        $allAttachments = array();
        foreach ($attachmentList as $attachment) {
            $allAttachments[] = array('id'=>$attachment->id, 'name'=>$attachment->attachment_name, 'discription'=>$attachment->discription);
        }
        return json_encode($allAttachments);
    }
    public function getAgreementList($pca_id, $user_id)
    {

        //GET AGREEMENT LIST
        $agreementList = DB::table('pca')
        ->whereIn('id', explode(",", $pca_id))
        ->get()->all();

        //GET AGREEMENT LIST FROM CURRENT USER
        $user = DB::table('cms_users')->where('id', $user_id)->get()->first();

        $html = "";
        $ids = [];

        if ($pca_id == 0) {
            $html = "";
        } else {
            foreach ($agreementList as $agreement) {
                $ids[$agreement->id] = explode(",", $agreement->agreement_id);
            }

            $pcas = call_user_func_array('array_merge', $ids);
            $pcafinallist = array_unique($pcas);

            foreach ($pcafinallist as $explodeid) {
                if ($explodeid == 0) {
                    $html .= "";
                } else {
                    if (in_array($explodeid, explode(',', $user->agreement_id))) {
                        $select = "checked";
                    } else {
                        $select = "";
                    }

                    $agreementname = DB::table('agreement')->where('id', $explodeid)->value('agreement_name');
                    $html .= "<p><input class='agreementname' type='checkbox' ".$select." name='agreementname[".$explodeid."]' value='".$explodeid."' />".$agreementname."</p>";
                }
            }
        }

        echo $html;
    }

    public function changeAttachmentStatus($attachId, $checkValue, $user_id) {
        $statusCheck = DB::table('agreement_attachment_status')->where('agreement_attachment_id', $attachId)->where('user_id', $user_id)->get()->first();
        if($statusCheck) {
            DB::table('agreement_attachment_status')
                ->where('agreement_attachment_id', $attachId)->where('user_id', $user_id)
                ->update([
                    'status' => $checkValue,
                    'updated_at' => date("Y-m-d h:i:s")
                ]);
        } else {
            DB::table('agreement_attachment_status')->insert([
				'agreement_attachment_id' => $attachId,
				'user_id' => $user_id,
				'status' => $checkValue,
				'created_at' => date("Y-m-d h:i:s"),
				'updated_at' => date("Y-m-d h:i:s")
				]);
        }
        DB::table('agreement_attachment')
            ->where('id', $attachId)
            ->update([
                'status' => $checkValue
            ]);
        echo $checkValue;
    }

    public function uploadAttachment(Request $request){
        $postvalues = $request->all();
        $agreement_request = DB::table('agreement_request')->where('id', $postvalues['agreement_request_id'])->get()->first();
        $custom_file_name = time(). str_random(14). "." . $request->file('documents_attached')->getClientOriginalExtension();
        $file = $request->file('documents_attached')->storeAs('uploads/documents/',$custom_file_name);
        //$path = storage_path()."/app/jd/".$custom_file_name;
        $filename = "uploads/documents/".$custom_file_name;
        $ext = pathinfo(url($filename), PATHINFO_EXTENSION);
        $save_agreement_attachment = DB::table('agreement_attachment')->insertGetId([
            'agreement_id' => $agreement_request->agreement_id,
            'agreement_request_id' => $postvalues['agreement_request_id'],
            'attachment_id' => $postvalues['attachment_id'],
            'filename' => $filename,
            'version' => DB::table('agreement_attachment')->where('agreement_request_id',$postvalues['agreement_request_id'])->max('version') + 1,
            'created_at' => date("Y-m-d h:i:s"),
            'updated_at' => date("Y-m-d h:i:s")
        ]);
        if($save_agreement_attachment) {
            $newIDs = str_replace($postvalues['agreement_attachment_id'],$save_agreement_attachment,$agreement_request->documents_attached);
            DB::table('agreement_request')
                ->where('id', $postvalues['agreement_request_id'])
                ->update([
                    'documents_attached' => $newIDs
                ]);
            echo "uploaded";
        }
    }

    public function getUserListByPrivilege($privilege, $pca, $agreement) {
        $agreement_detail = DB::table('pca_mapping')->where('agreement_id', $agreement)->where('pca_id', $pca)->get()->first();
        if($privilege == 7) {
            $column = $agreement_detail->verifier_user_id;
        } else {
            $column = $agreement_detail->approver_user_id;
        }
        $orderby = "";
        if(!empty($column)){
            $orderby = "ORDER BY FIELD(id,".$column.")";
        }
        $user = DB::select( DB::raw("SELECT * FROM cms_users WHERE id_cms_privileges=$privilege AND (pca_id LIKE '%,$pca' OR pca_id LIKE '$pca,%' OR pca_id LIKE '%,$pca,%' OR pca_id LIKE '$pca') $orderby") );
        $html = '';
        foreach($user as $u) {
            if (in_array($u->id, explode(',', $column))) {
                $select = "checked";
            } else {
                $select = "";
            }
            $html .='
                <li class="ui-state-default">
                    <div class="checkbox">
                        <label><input type="checkbox" '.$select.' name="user_id['.$privilege.'][]" value="'.$u->id.'" />'.$u->name.'</label>
                    </div>
                </li>
            ';
        }
        echo $html;
    }

    public function uploadOtherAttachment(Request $request){
        $postvalues = $request->all();
        $agreement_request = DB::table('agreement_request')->where('id', $postvalues['agreement_request_id'])->get()->first();
        $custom_file_name = time(). str_random(14). "." . $request->file('other_documents_attached')->getClientOriginalExtension();
        $file = $request->file('other_documents_attached')->storeAs('uploads/documents/',$custom_file_name);
        //$path = storage_path()."/app/jd/".$custom_file_name;
        $filename = "uploads/documents/".$custom_file_name;
        $ext = pathinfo(url($filename), PATHINFO_EXTENSION);
        $save_agreement_attachment = DB::table('other_attachment')->insertGetId([
            'agreement_id' => $agreement_request->agreement_id,
            'agreement_request_id' => $postvalues['agreement_request_id'],
            'attachment_name' => $postvalues['attachment_name'],
            'filename' => $filename,
            'version' => DB::table('other_attachment')->where('agreement_request_id',$postvalues['agreement_request_id'])->max('version') + 1,
            'created_at' => date("Y-m-d h:i:s"),
            'updated_at' => date("Y-m-d h:i:s")
        ]);
        if($save_agreement_attachment) {
            // $newIDs = str_replace($postvalues['agreement_attachment_id'],$save_agreement_attachment,$agreement_request->documents_attached);
            // DB::table('agreement_request')
            //     ->where('id', $postvalues['agreement_request_id'])
            //     ->update([
            //         'documents_attached' => $newIDs
            //     ]);
            echo "uploaded";
        }
    }
}
