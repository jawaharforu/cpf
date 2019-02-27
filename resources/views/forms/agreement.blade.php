<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')

    <div class='panel panel-default'>
        <div class='panel-heading'>{{ $page_title }}</div>
        <div class='panel-body'>
            <form method="POST" action="">
                    {{ csrf_field() }}
                    <div class="box-body" id="parent-form-area">
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                Agreement Name
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type='text' title="Attachment Name"
                                required    maxlength=255 class='form-control'
                                name="agreement_name" id="agreement_name" value='<?php echo (isset($agreement->agreement_name))?$agreement->agreement_name:""; ?>'/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                Attachments
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class="multipleSelect" multiple name="attachment_id[]">
                                        @foreach ($attachment as $item)
                                            @if ($agreement)
                                                @php
                                                    if(in_array($item->id, explode(',',$agreement->attachment_id))) {
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
                                            <option {{$select}} value="{{$item->id}}">{{$item->attachment_name}}</option>
                                        @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <input type="submit" name="submit" value="Save" class="btn btn-success">
                    </div>
            </form>
        </div>
    </div>
@endsection
@push('top')

@endpush
@push('bottom')
    <link rel="stylesheet" href="/fastselect/fastselect.min.css">
    <script src="/fastselect/fastselect.standalone.js"></script>
    <script>
        $(document).ready(function(){
            $('.multipleSelect').fastselect();
        });
    </script>
@endpush
