<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')

    <div class='panel panel-default'>
        <div class='panel-heading'>{{ $page_title }}</div>
        <div class='panel-body'>
            <form method="POST" action="" id="pcaMappingForm" enctype='multipart/form-data'>
                    {{ csrf_field() }}
                    <div class="box-body" id="parent-form-area">
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Agreement
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class='form-control' name="agreement_id" id="agreement_id">
                                    <option value="">Select Agreement</option>
                                    @foreach ($agreement as $item)
                                        @if ($agreementspca)
                                            @php
                                                if($item->id == $agreementspca->agreement_id) {
                                                    $select = "selected";
                                                } else {
                                                    $select = "";
                                                }
                                            @endphp
                                        @else
                                            @php
                                                $select = "";
                                            @endphp
                                        @endif
                                        <option {{$select}} value="{{$item->id}}">{{$item->agreement_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                PCA
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class='form-control' name="pca_id" id="pca_id">
                                    <option value="">Select PCA</option>
                                    @foreach ($pca as $item)
                                        @if ($agreementspca)
                                            @php
                                                if($item->id == $agreementspca->pca_id) {
                                                    $select = "selected";
                                                } else {
                                                    $select = "";
                                                }
                                            @endphp
                                        @else
                                            @php
                                                $select = "";
                                            @endphp
                                        @endif
                                        <option {{$select}} value="{{$item->id}}">{{$item->pca_code}}-{{$item->pca_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group header-group-0 row">
                                    <label for="verifier" class='control-label col-sm-2'>Verifier</label>
                                    <div class="col-sm-10">
                                        <select class="col-md-6 form-control" id="verifier" name="verifier">
                                            @php
                                                $i = 1;
                                                $optionlist = array();
                                                for($i=1;$i<=5;$i++){
                                                    if($agreementspca->verify == $i){
                                                        echo "<option selected value='".$i."'>".$i."</option>";
                                                    }else{
                                                        echo"<option value='".$i."'>".$i."</option>";
                                                    }
                                                }
                                            @endphp
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group header-group-0 row">
                                    <label for="approver" class='control-label col-sm-2'>Approver</label>
                                    <div class="col-sm-10">
                                        <select class="col-md-6 form-control" id="approver" name="approver">
                                            @php
                                                $i = 1;
                                                $optionlist = array();
                                                for($i=1;$i<=5;$i++){
                                                    if($agreementspca->approval == $i){
                                                        echo "<option selected value='".$i."'>".$i."</option>";
                                                    }else{
                                                        echo"<option value='".$i."'>".$i."</option>";
                                                    }
                                                }
                                            @endphp
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="verifierdiv"></ul>
                            </div>
                            <div class="col-sm-6">
                                <ul class="approverdiv"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <a href="{{CRUDBooster::adminPath('pca_mapping')}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Back</a>
                        <input type="button" id="pcamappingsubmit" value="Save" class="btn btn-success">
                        <input type="reset" class="btn btn-warning" value="Reset" />
                    </div>
            </form>
        </div>
    </div>
@endsection
@push('top')
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
@endpush
@push('bottom')
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(document).ready(function(){
            function userListByPCA(privilege, pca, agreement, divClass) {
                $.get(`/api/get/userlist/${privilege}/${pca}/${agreement}`, function (userlist) {
                    $('.'+divClass).html(userlist);
                });
            }
            $( ".verifierdiv" ).sortable();
            $( ".verifierdiv" ).disableSelection();
            $( ".approverdiv" ).sortable();
            $( ".approverdiv" ).disableSelection();
            $('#agreement_id , #pca_id').change(function(){
                var agreement_id = $('#agreement_id').val();
                var pca_id = $('#pca_id').val();
                if(agreement_id != '' && pca_id != '') {
                    userListByPCA(7, pca_id, agreement_id, 'verifierdiv');
                    userListByPCA(8, pca_id, agreement_id, 'approverdiv');
                }
            });
            var agreement_id = $('#agreement_id').val();
            var pca_id = $('#pca_id').val();
            if(agreement_id != '' && pca_id != '') {
                userListByPCA(7, pca_id, agreement_id, 'verifierdiv');
                userListByPCA(8, pca_id, agreement_id, 'approverdiv');
            }
            $("#pcamappingsubmit").click(function(){
                var verifier = $('#verifier').val();
                var approver = $('#approver').val();
                var verifierChecked = $('.verifierdiv input:checkbox:checked').length;
                var approverChecked = $('.approverdiv input:checkbox:checked').length;
                if(verifier == verifierChecked && approver == approverChecked){
                    $('#pcaMappingForm').submit();
                  } else {
                    alert('Selection not matching');
                }
            });
        });
    </script>
@endpush
