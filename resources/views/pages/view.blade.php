@extends('crudbooster::admin_template')
@section('content')
<style>
    .switch-toggle.switch-candy, .switch-light.switch-candy > span{
        width: 15em;
    }
</style>
    <div>
        <div class="row">
            <div class="col-md-12">
                <div class='panel panel-default'>
                    <div class='panel-heading'>
                        <h3>View of Ticket ID {{$agreement_request->ticket_no}}</h3>
                    </div>
                    <div class='panel-body'>
                        <div class="row">
                            <div class="col-md-9" id="DivIdToPrint">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Nature of Agreement</th>
                                        <td>{{getAgreementNameByID($agreement_request->agreement_id)}}</td>
                                    </tr>
                                    <tr>
                                        <th>PCA</th>
                                        <td>{{getPCANameByID($agreement_request->pca_id)}}</td>
                                    </tr>
                                    <tr>
                                        <th>Name of the Vendor/Customer</th>
                                        <td>{{$agreement_request->vendor_name}}</td>
                                    </tr>
                                    <tr>
                                        <th>Address</th>
                                        <td>{{$agreement_request->address}}</td>
                                    </tr>
                                    <tr>
                                        <th>Own/Lease/Representative</th>
                                        <td>{{$agreement_request->own_lease_representative}}</td>
                                    </tr>
                                    <tr>
                                        <th>New/Renewal Agreement</th>
                                        <td>{{$agreement_request->new_renewal}}</td>
                                    </tr>
                                    @if (!empty($agreement_request->exist_ticket_no))
                                    <tr>
                                        <th>Existing Ticket No.</th>
                                        <td><a target="_blank" href="">{{$agreement_request->exist_ticket_no}}</a></td>
                                    </tr>
                                    @endif
                                    @if (!empty($agreement_request->vendor_code))
                                    <tr>
                                        <th>Vendor/Customer Code</th>
                                        <td>{{$agreement_request->vendor_code}}</td>
                                    </tr>
                                    @endif
                                    <tr>
                                        <th>Start Date</th>
                                        <td>{{date("d/m/Y",strtotime($agreement_request->start_date))}}</td>
                                    </tr>
                                    <tr>
                                        <th>End Date</th>
                                        <td>{{date("d/m/Y",strtotime($agreement_request->end_date))}}</td>
                                    </tr>
                                    <tr>
                                        <th>Consideration (Rs.)(Rent/Charges to be paid)</th>
                                        <td>{{$agreement_request->consideration_rs}}</td>
                                    </tr>
                                    <tr>
                                        <th>Deposit</th>
                                        <td>{{$agreement_request->deposit}}</td>
                                    </tr>
                                    <tr>
                                        <th>Other Information</th>
                                        <td>{{$agreement_request->other_information}}</td>
                                    </tr>
                                    @if (!empty($agreement_request->other_attachment))
                                    <tr>
                                        <th>Other Document 1</th>
                                        <td><a target="_blank" href="{{url($agreement_request->other_attachment)}}">Download</a></td>
                                    </tr>
                                    @endif
                                    @if (!empty($agreement_request->other_attachment1))
                                    <tr>
                                        <th>Other Document 2</th>
                                        <td><a target="_blank" href="{{url($agreement_request->other_attachment1)}}">Download</a></td>
                                    </tr>
                                    @endif
                                    @if (!empty($agreement_request->signed_doc))
                                    <tr>
                                        <th>Signed  Agreement</th>
                                        <td><a target="_blank" href="{{url($agreement_request->signed_doc)}}">Download</a></td>
                                    </tr>
                                    @endif
                                </table>
                            </div>
                            <div class="col-md-3">
                                <input type='button' id='btnprint' value='Print' >
                            </div>
                        </div>

                    <div class='row'>
                        <div class="col-md-9">
                        <table class="table table-striped">
                            @foreach ($agreement_attachment as $item)
                                <tr>
                                    <td>{{getAttachmentNameByID($item->attachment_id)}}</td>
                                    @if ($docFiles == "yes" && CRUDBooster::myPrivilegeId() != 6 && CRUDBooster::myPrivilegeId() != 8)
                                        @php
                                            if($item->status == 1) {
                                                $approve = 'checked="checked"';
                                                $na = '';
                                                $reject = '';
                                            } else if($item->status == 2) {
                                                $approve = '';
                                                $na = '';
                                                $reject = 'checked="checked"';
                                            } else {
                                                $approve = '';
                                                $na = 'checked="checked"';
                                                $reject = '';
                                            }
                                        @endphp
                                        <td>
                                            <div class="switch-toggle switch-3 switch-candy">
                                                <input id="on{{$item->id}}" name="state-d{{$item->id}}" type="radio" class="docs appdoc" data_id="{{$item->id}}"  value="1" {{$approve}} />
                                                <label for="on{{$item->id}}" onclick="">Accepted</label>
                                                <input id="na{{$item->id}}" name="state-d{{$item->id}}" type="radio" disabled {{$na}} />
                                                <label for="na{{$item->id}}" class="disabled" onclick="">&nbsp;</label>
                                                <input id="off{{$item->id}}" name="state-d{{$item->id}}" type="radio" data_id="{{$item->id}}" class="rejdoc docs"  value="2" {{$reject}} />
                                                <label for="off{{$item->id}}" onclick="">Rejected</label>
                                                <a></a>
                                            </div>
                                        </td>
                                    @else
                                        <td>
                                            @if ($item->status==1)
                                                Approved
                                            @elseif ($item->status==2)
                                                Rejected
                                            @else
                                                Waiting
                                            @endif

                                            @if (CRUDBooster::myPrivilegeId() == 6 && $docFiles == "yes")
                                                @if ($item->status==2)
                                                    <form action="" name="attachform{{$item->id}}" id="attachform{{$item->id}}" method="POST" enctype='multipart/form-data'>
                                                        <input type="hidden" name="attachment_id" value="{{$item->attachment_id}}" />
                                                        <input type="hidden" name="agreement_request_id" value="{{$agreement_request->id}}" />
                                                        <input type="hidden" value="{{$item->id}}" name="agreement_attachment_id" />
                                                        <input type="file" required title="{{getAttachmentNameByID($item->attachment_id)}}"
                                                        class="form-control" id="documents_attached{{$item->id}}" name="documents_attached" />
                                                        <button class="uploadbtn uploadbtn{{$item->id}}" data-id="{{$item->id}}">Upload</button>
                                                    </form>
                                                @endif
                                            @endif
                                        </td>
                                    @endif
                                    <td><a target="_blank" href="{{url($item->filename)}}">Download</a></td>
                                </tr>
                            @endforeach
                        </table>
                        </div>
                        <div class="col-md-9">
                            <p>Other documents</p>
                            @if($other_attachment)
                            <table class="table table-striped">
                                @foreach ($other_attachment as $item)
                                    <tr>
                                        <td>{{$item->attachment_name}}</td>
                                        <td><a target="_blank" href="{{url($item->filename)}}">Download</a></td>
                                    </tr>
                                @endforeach
                            </table>
                            @endif
                            @if ((CRUDBooster::myPrivilegeId() == 6 && $docFiles == "yes") || CRUDBooster::myPrivilegeId() == 4)
                            <form action="" name="otherattachform" id="otherattachform" method="POST" enctype='multipart/form-data'>
                                <input type="text" name="attachment_name"  />
                                <input type="hidden" name="agreement_request_id" value="{{$agreement_request->id}}" />
                                <input type="file" required name="other_documents_attached" />
                                <button class="otheruploadbtn">Upload</button>
                            </form>
                            @endif
                        </div>
                    </div>
                    <div class='row'>
                        <div class="col-md-12">
                            <table class="table">
                                    <thead>
                                        <th>Created</th>
                                        <th>From User</th>
                                        <th>To User</th>
                                        <th>Status</th>
                                        <th>Comments</th>
                                    </thead>
                                @foreach ($agreement_request_status as $item)
                                    <tr>
                                        <td>{{date("d/m/Y",strtotime($item->created_at))}}</td>
                                        <td>{{getUserDetailsByID($item->from_user_id)->name}}({{getPrivilegeDetailsByID(getUserDetailsByID($item->from_user_id)->id_cms_privileges)->name}})</td>
                                        <td>{{getUserDetailsByID($item->to_user_id)->name}}({{getPrivilegeDetailsByID(getUserDetailsByID($item->to_user_id)->id_cms_privileges)->name}})</td>
                                        <td>{{statusType($item->privilege_id, $item->status)}}</td>
                                        <td>{{$item->remarks}}</td>
                                    </tr>
                                @endforeach
                            </table>
                        </div>
                    </div>
                </div>
                    <div class='panel-footer'>
                        @if (($docFiles == "yes" || CRUDBooster::myPrivilegeId()==4) && $renewal == "no")
                            <form action="" method="POST" id="sendToForm" enctype='multipart/form-data'>
                                {{ csrf_field() }}
                                @if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10 || (CRUDBooster::myPrivilegeId() == 6 && $countAgrement == 0))
                                    <div>
                                        <textarea name="agreement_copy"><?php echo (empty($agreement_copy->document)?$agreement_sample_document->document:$agreement_copy->document); ?></textarea>
                                        <button class="btn btn-primary" id="saveDoc">SAVE</button>
                                    </div>
                                    <?php
                                        $spaceValue = [0, 25, 50, 75];
                                    ?>
                                    <label>Space </label>
                                    @for ($i = 0; $i < 4; $i++)
                                        @php
                                            $checked = "";
                                            if($spaceValue[$i] == $agreement_copy->space){
                                                $checked = "checked";
                                            }
                                        @endphp
                                        <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" {{$checked}} id="defaultInline{{$spaceValue[$i]}}" name="space" value="{{$spaceValue[$i]}}">
                                        <label class="custom-control-label" for="defaultInline1">{{$spaceValue[$i]}}%</label>
                                        </div>
                                    @endfor
                                    @if(CRUDBooster::myPrivilegeId() != 6)
                                        <div>
                                            <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Document Log</button>
                                            <div id="demo" class="collapse">
                                                <div class="panel-group" id="accordion">
                                                    @foreach ($agreement_copy_log as $log)
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h4 class="panel-title">
                                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$log->id}}">
                                                                {{getUserDetailsByID($log->user_id)->name}} - {{date('d/m/Y', strtotime($log->created_at))}} - {{$log->doc_type.(1000000+$log->id)}}
                                                                </a>
                                                            </h4>
                                                            </div>
                                                            <div id="collapse{{$log->id}}" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <?php echo $log->document; ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endif
                                @if(!empty($agreement_copy->document) && (CRUDBooster::myPrivilegeId()==4 || CRUDBooster::myPrivilegeId()==10))
                                    {{-- <button class="btn btn-primary" id="downloadWordFile">Download Word Draft Agreement</button>
                                    <br />
                                    <div class='form-group header-group-0 row'>
                                        <label class='control-label col-sm-3'>
                                            Upload Edited Agreement
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="file" title="file_copy"
                                                    class="form-control" id="file_copy" name="file_copy">
                                        </div>
                                    </div>
                                    <br /> --}}
                                @endif
                                @if(CRUDBooster::myPrivilegeId()==4)
                                    <br />
                                    <select class="form-control" name="privilege_to" id="privilege_to">
                                        <option value="">Select Role</option>
                                        <option value="9">AGC Incharge</option>
                                        <option value="5">AGC Verifier</option>
                                        <option value="10">AGC Approver</option>
                                    </select>
                                @endif
                                <br />
                                <label class='control-label'>Input your Comments:</label>
                                <textarea class="form-control" name="remarks" id="remarks"></textarea>
                                <input type="hidden" name="agreement_request_id" value="{{$agreement_request->id}}" />
                                <input type="hidden" name="repoted" value="{{$report->id}}" />
                                <br/>
                                @if($agreement_request->status != 16)
                                    @if($agreement_request->status == 14 && CRUDBooster::myPrivilegeId()==6)
                                        <button id="acceptBtn" type="button" class="btn btn-success">Accept</button>
                                        <button id="docRejectBtn" type="button" class="btn btn-danger">Reject</button>
                                        <a target="_blank" class="btn btn-primary" href="{{CRUDBooster::adminPath('generatepdf/'.$agreement_copy->id.'/copy/'.$agreement_copy->space.'/YES')}}">Download PDF Draft Agreement</a>
                                        <br />
                                    @endif
                                    @if($agreement_request->status != 14 && $agreement_request->status != 19)
                                        @if(CRUDBooster::myPrivilegeId()!=6)
                                            @if(CRUDBooster::myPrivilegeId()!=10)
                                            <button id="assignBtn" type="button" class="btn btn-success">Approve</button>
                                            @endif
                                        <button id="rejectBtn" type="button" class="btn btn-danger">Reject</button>
                                        @else
                                        <button id="assignBtn" type="button" class="btn btn-success">Confirm</button>
                                        <button id="rejectBtn" type="button" class="btn btn-danger">Cancel Request</button>
                                        <a href="{{CRUDBooster::adminPath('agreement_request')}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Exit without saving</a>
                                        @endif
                                    @endif
                                    @if(CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10)
                                        <button id="revertbackBtn" type="button" class="btn btn-danger">Revert Back</button>
                                    @endif
                                @endif
                                @if(!empty($agreement_copy->document) &&(CRUDBooster::myPrivilegeId()==4 || CRUDBooster::myPrivilegeId()==10) && $agreement_request->status != 17 && $agreement_request->status != 14)
                                    <button id="approveBtn" type="button" class="btn btn-primary aprvBtn">Approve Draft Document</button>
                                @endif
                                @if(!empty($agreement_copy->document) &&(CRUDBooster::myPrivilegeId()==4 || CRUDBooster::myPrivilegeId()==10)  && $agreement_request->status == 17)
                                    <button id="approveFinalBtn" type="button" class="btn btn-primary aprvBtn">Approve Final Document</button>
                                @endif
                                @if($agreement_request->status == 16 && CRUDBooster::myPrivilegeId()== 4  && $agreement_request->status == 17)
                                    <button id="reuploadDoc" type="button" class="btn btn-primary">Reupload Sign Doc</button>
                                @endif
                                @if(CRUDBooster::myPrivilegeId()==6 && $agreement_request->status == 19)
                                    <a target="_blank" class="btn btn-primary" href="{{CRUDBooster::adminPath('generatepdf/'.$agreement_copy->id.'/copy/'.$agreement_copy->space.'/NO')}}">Download Agreement</a>
                                @endif
                                @if(CRUDBooster::myPrivilegeId()==6 && $agreement_request->status == 19)
                                <br/>
                                <div class='form-group header-group-0 row'>
                                    <label class='control-label col-sm-3'>
                                        Signed Agreement
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="file" title="Other Document"
                                                class="form-control" id="signeddocument" name="signeddocument">
                                    </div>
                                    <div class="text-danger"></div>
                                    <p class='help-block'></p>
                                </div>
                                <div class='form-group header-group-0 row'>
                                    <label class='control-label col-sm-3'></label>
                                    <div class="col-sm-9">
                                        <button id="signedDocBtn" type="button" class="btn btn-warning">Upload Signed Doc</button>
                                    </div>
                                    <div class="text-danger"></div>
                                    <p class='help-block'></p>
                                </div>
                                <br/>
                                @endif
                            </form>
                        @endif
                        @if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10)
                            @if(!empty($agreement_copy->document))
                                <br />
                                @if($docFiles == "yes")
                                <button class="btn btn-primary" id="downloadPDFFile">Download Draft Agreement</button>
                                @else
                                <a target="_blank" class="btn btn-primary" href="{{CRUDBooster::adminPath('generatepdf/'.$agreement_copy->id.'/copy/'.$agreement_copy->space.'/YES')}}">Download PDF Draft Agreement</a>
                                @endif
                            @endif
                        @endif
                        @if($renewal=="yes")
                        <form action="/admin/agreement_request/renewal" method="POST">
                            {{ csrf_field() }}
                            <input type="hidden" name="agreement_request_id" value="{{$agreement_request->id}}" />
                            <?php
                            $renewaled = "";$noneed="";
                            if($agreement_request->renewal_need == 1){
                                $renewaled = "checked";
                            }
                            if($agreement_request->renewal_need == 2){
                                $noneed = "checked";
                            }
                            ?>
                            <div class="form-group">
                                <label>Renewed</label>
                                <input type="radio" <?php echo $renewaled; ?> required name="renewalstatus" value="1">
                            </div>
                            <div class="form-group">
                                <label>Renewal Not Required</label>
                                <input type="radio" <?php echo $noneed; ?> required name="renewalstatus" value="2">
                            </div>
                            <button class="btn btn-primary" type="submit">Update</button>
                        </form>
                        @endif
                    </div>
            </div>
        </div>
    </div>
@endsection
@push('bottom')
    <link href="https://cdn.jsdelivr.net/css-toggle-switch/latest/toggle-switch.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.11.1/full/ckeditor.js"></script>
    <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
    //http://cssdeck.com/labs/ufct35ys5t
    <script>
        $(document).ready(function(){
            function hideAssignBtn() {
                if ( $('.appdoc:checked').length != $('.rejdoc').length ) {
                    $('#assignBtn').attr("disabled", "disabled");
                } else {
                    $('#assignBtn').removeAttr("disabled");
                }
            }
            hideAssignBtn();
            $('.docs').change(function(){
                var attachId = $(this).attr('data_id');
                var checkValue = $("input[name='state-d"+attachId+"']:checked").val();
                hideAssignBtn();
                $.get(`/api/changeAttachmentStatus/${attachId}/${checkValue}/{{Crudbooster::me()->id}}`, function (res) {
                    console.log(res);
                });
            });
            $('.uploadbtn').click(function(){
                var attachID = $(this).attr('data-id');
                var formData = new FormData($('form#attachform'+attachID)[0]);
                $.ajax({
                    url: "/api/post/upload-attachment",
                    type: 'POST',
                    data: formData,
                    async: false,
                    success: function (res) {
                        if(res === 'uploaded'){
                            window.location.reload();
                        } else {

                        }
                    },
                    cache: false,
                    contentType: false,
                    processData: false
                });
                return false;
            });
            $('.otheruploadbtn').click(function(){
                var formData = new FormData($('form#otherattachform')[0]);
                $.ajax({
                    url: "/api/post/upload-other-attachment",
                    type: 'POST',
                    data: formData,
                    async: false,
                    success: function (res) {
                        if(res === 'uploaded'){
                            window.location.reload();
                        } else {

                        }
                    },
                    cache: false,
                    contentType: false,
                    processData: false
                });
                return false;
            });
            @if(CRUDBooster::myPrivilegeId() == 4)
                $("#privilege_to").change(function(){
                    if($(this).val()>0){
                        $('.aprvBtn').attr("disabled", "disabled");
                    } else {
                        $('.aprvBtn').removeAttr("disabled");
                    }
                });
            @endif
            @if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 5 || CRUDBooster::myPrivilegeId() == 9 || CRUDBooster::myPrivilegeId() == 10 || (CRUDBooster::myPrivilegeId() == 6 && $countAgrement == 0))
                CKEDITOR.replace( 'agreement_copy' );
            @endif
            $("#assignBtn").on("click", function(e){
                e.preventDefault();
                var spaceLength = $("input[name='space']").length;
                if(spaceLength > 0){
                    var space = $("input[name='space']:checked").val();
                    if(typeof space!="undefined") {
                        $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/report-assign"); ?>').submit();
                    } else {
                        alert("Select Space before download");
                    }
                } else {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/report-assign"); ?>').submit();
                }
            });
            $("#rejectBtn").on("click", function(e){
                e.preventDefault();
                if($('#remarks').val()!="") {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/report-reject"); ?>').submit();
                } else {
                    alert("Enter some comments");
                }

            });
            $("#docRejectBtn").on("click", function(e){
                e.preventDefault();
                if($('#remarks').val()!="") {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/doc-reject"); ?>').submit();
                } else {
                    alert("Enter some comments");
                }

            });
            $("#approveBtn").on("click", function(e){
                e.preventDefault();
                var space = $("input[name='space']:checked").val();
                if(typeof space!="undefined") {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/report-approve"); ?>').submit();
                } else {
                    alert("Select Space");
                }
            });
            $("#approveFinalBtn").on("click", function(e){
                e.preventDefault();
                var space = $("input[name='space']:checked").val();
                if(typeof space!="undefined") {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/report-final-approve"); ?>').submit();
                } else {
                    alert("Select Space");
                }
            });
            $("#signedDocBtn").on("click", function(e){
                e.preventDefault();
                $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/signed-doc-upload"); ?>').submit();
            });
            $("#revertbackBtn").on("click", function(e){
                e.preventDefault();
                if($('#remarks').val()!="") {
                    $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/revert-back"); ?>').submit();
                } else {
                    alert("Enter some comments");
                }
            });
            $('#downloadWordFile').click(function(e){
                e.preventDefault();
                var space = $("input[name='space']:checked").val();
                if(typeof space!="undefined") {
                    window.location.href = "<?php echo CRUDBooster::adminPath('generateword/'.$agreement_copy->id.'/copy').'/'; ?>"+space;
                } else {
                    alert("Select Space before download");
                }
            });
            $('#downloadPDFFile').click(function(e){
                e.preventDefault();
                var space = $("input[name='space']:checked").val();
                if(typeof space!="undefined") {
                    window.location.href = "<?php echo CRUDBooster::adminPath('generatepdf/'.$agreement_copy->id.'/copy').'/'; ?>"+space+"/YES";
                } else {
                    alert("Select Space before download");
                }
            });
            $("#acceptBtn").on("click", function(e){
                e.preventDefault();
                $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/accept-doc"); ?>').submit();
            });
            $("#reuploadDoc").on("click", function(e){
                e.preventDefault();
                $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/reupload-doc"); ?>').submit();
            });
            $("#saveDoc").on("click", function(e){
                e.preventDefault();
                $('#sendToForm').attr('action', '<?php echo CRUDBooster::adminPath("agreement_request/doc-save"); ?>').submit();
            });
            @if(CRUDBooster::myPrivilegeId()==6 && $agreement_request->status == 9)
            $("#downloadBtn").on("click", function(e){
                e.preventDefault();
                var doc = new jsPDF();
                var elementHandler = {
                    '#ignorePDF': function (element, renderer) {
                      return true;
                    }
                  };
                doc.fromHTML(
                '<?php echo $agreement_copy->document; ?>',
                15,
                0.5,
                {
                    'width': 180,'elementHandlers': elementHandler
                });
                doc.save('abc.pdf');
            });
            @endif
            //CKEDITOR.instances['editor1'].setData(data);
            /*
            function readDoc(filename) {
                window.Mammoth.convertToHtml({path: `${filename}`})
                .then(function(result){
                    var html = result.value; // The generated HTML
                    var messages = result.messages; // Any messages, such as warnings during conversion
                    return html;
                })
                .done();

                window.Docx2html(filename).then(function(html){
                    var html = html.toString();
                    console.log(html);
                })
            }
            var htmlResult = readDoc('<?php echo url("uploads/1/2018-12/completedepes.docx"); ?>');
            //console.log(htmlResult);
            */
            function printDiv()
            {

            var divToPrint=document.getElementById('DivIdToPrint');

            var newWin=window.open('','Print-Window');

            newWin.document.open();

            newWin.document.write('<html><body onload="window.print()">'+divToPrint.innerHTML+'</body></html>');

            newWin.document.close();

            setTimeout(function(){newWin.close();},10);

            }
            $('#btnprint').click(function(){
                printDiv();
            });
        });
    </script>
@endpush
