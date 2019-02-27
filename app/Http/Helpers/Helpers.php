<?php
function getAgreementNameByRequestID($id) {
   $request = DB::table('agreement_request')->where('id',$id)->get()->first();
   return DB::table('agreement')->where('id',$request->agreement_id)->value('agreement_name');
}

function getNewTicketNo(){
    $request = DB::table('agreement_request')->max('ticket_no');
    if($request) {
        return $request + 1;
    } else {
        return 100000;
    }
}

function getAgreementNameByID($id) {
    return DB::table('agreement')->where('id',$id)->value('agreement_name');
}

function getPCANameByID($id) {
    return DB::table('pca')->where('id',$id)->value('pca_name');
}

function getAttachmentNameByID($id) {
    return DB::table('attachment')->where('id',$id)->value('attachment_name');
}

function getUserDetailsByID($id) {
    return DB::table('cms_users')->where('id',$id)->get()->first();
}

function getPrivilegeDetailsByID($id) {
    return DB::table('cms_privileges')->where('id',$id)->get()->first();
}

function getDivisionDetailsByID($id) {
    return DB::table('division')->where('id',$id)->get()->first();
}

function getBusinessUnitDetailsByID($id) {
    return DB::table('business_unit')->where('id',$id)->get()->first();
}

function getPCADetailsByID($id) {
    return DB::table('pca')->where('id',$id)->get()->first();
}

function getNextPrivilege($id) {
    switch ($id) {
        case 4: // AGC Admin
            $nextReportPerson = 9;
            break;
        case 9: // AGC Incharge
            $nextReportPerson = 5;
            break;
        case 5: // AGC Verifier
            $nextReportPerson = 10;
            break;
        case 10: // AGC Approver
            $nextReportPerson = 4;
            break;
        default:
            $nextReportPerson = 4;
    }
    return $nextReportPerson;
}

function getRecentCommenet($agreement_request_id) {
    $geting = DB::table('request')
    ->where('agreement_request_id',$agreement_request_id)
    ->orderBy('id', 'desc')
    ->get()->first();
    return $geting->remarks;
}

function getStatusByID($id) {
    return DB::table('status_type')->where('id',$id)->get()->first();
}

function documentType($id){
    $aggrement_request = DB::table('agreement_request')->where('id', $id)->get()->first();
    $userDetail = getUserDetailsByID($aggrement_request->user_id);
    $pca = getPCADetailsByID($aggrement_request->pca_id);
    $businessUnit = getBusinessUnitDetailsByID($pca->division_id);
    $division = getDivisionDetailsByID($userDetail->division_id);
    return $businessUnit->business_unit_doc_code.$division->division_doc_code;
}

function curlCall(){
    $data = array(
        'output' => 'http://localhost:8000/curloutput',
        'mode' => 'normaledit',
        'apikey' => 'c424297fd6504b5357c18f52d5d8eada',
        'filename' => 'Untitled Document',
        'format' => 'docx',
        'id' => '1234'
    );
    //dd(http_build_query($data));
    $ch = curl_init();

curl_setopt($ch, CURLOPT_URL,"https://writer.zoho.com/writer/remotedoc.im");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,"output=/check&mode=normaledit&apikey=c424297fd6504b5357c18f52d5d8eada&filename=Untitled Document&format=docx&id=1234");

// In real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS,
//          http_build_query(array('postvar1' => 'value1')));

// Receive server response ...
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$server_output = curl_exec($ch);

curl_close ($ch);
dd($server_output);

}

function dashBoardDetails() {
    $requestCount = DB::table('agreement_request')->get()->count();
    $requestRejectCount = DB::table('agreement_request')->where('status',0)->get()->count();
    $requestApprovedCount = DB::table('agreement_request')->where('status',16)->get()->count();
    $userCount = DB::table('cms_users')->get()->count();
    $requestCount = DB::table('cms_users')->where('id_cms_privileges',6)->get()->count();
    $verifierCount = DB::table('cms_users')->where('id_cms_privileges',7)->get()->count();
    $approverCount = DB::table('cms_users')->where('id_cms_privileges',8)->get()->count();

    dd($requestCount);
}

function readOrNotRead($id) {
    $notRead = DB::table('request')->where('agreement_request_id', $id)->where('to_user_id', Crudbooster::me()->id)->orderBy('id', 'desc')->where('opened',0)->get()->first();
    if($notRead) {
        return "makeItBold";
    } else {
        return "";
    }
}

function statusType($privilege, $status) {
    switch ($privilege) {
        case 6: // Requestor
            $stat = ($status==1)?'Requested':'Rejected';
            break;
        case 7: // Doc Verifier
            $stat = ($status==1)?'Verified':'Rejected';
            break;
        case 8: // Doc Approver
            $stat = ($status==1)?'Approved':'Rejected';
            break;
        case 4: // AGC Admin
            $stat = ($status==1)?'Approved':'Rejected';
            break;
        case 9: // AGC Incharge
            $stat = ($status==1)?'Approved':'Rejected';
            break;
        case 5: // AGC Verifier
            $stat = ($status==1)?'Verified':'Rejected';
            break;
        case 10: // AGC Approver
            $stat = ($status==1)?'Approved':'Rejected';
            break;
        default:
            $stat = ($status==1)?'Approved':'Rejected';
    }
    return $stat;
}
