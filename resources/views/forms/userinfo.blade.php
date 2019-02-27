<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')
<div class="wholedata" style="margin:15px;">
<div class="box user_details row" style="margin: 0px 0px 15px 0px;">
    <div class="col-md-6"><label>Employee ID</label><h3>{{$userdata->employeeid}}</h3><label>User</label><h3>{{$userdata->name}}</h3></div>
    <div class="col-md-6"><label>Designation</label><h3>{{$privilege}}</h3></div>
    <input type="hidden" id="user_id" value="{{$userdata->id}}" />
</div>
@if(($roleid == 4) || ($roleid == 5) || ($roleid == 10) || ($roleid == 9))
<div class="row">
    <div class='panel panel-default'>
        <div class='panel-heading'></div>
        <div class='panel-body'>
            <form method="POST" action="">
                    {{ csrf_field() }}
                    <div class="box-body" id="parent-form-area">
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                Division
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class="multipleSelect" multiple name="divisionname[]">
                                    @foreach ($division as $divik => $diviv)
                                        @if ($userdata)
                                            @php
                                                if(in_array($diviv->id, explode(',',$userdata->division_id))) {
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
                                        <option {{$select}} value="{{$diviv->id}}">{{$diviv->division_name}}</option>
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
</div>
@elseif(($roleid == 6) || ($roleid == 7) || ($roleid == 8))
<div class="row">
    <div class='panel panel-default'>
        <div class='panel-heading'></div>
        <div class='panel-body'>
            <form method="POST" action="">
                    {{ csrf_field() }}
                    <div class="box-body" id="parent-form-area">
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                State
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class="multipleSelect statename" multiple name="statename[]">
                                    @foreach ($states as $statek => $statev)
                                        @if ($userdata)
                                                @php
                                                    if(in_array($statev->id, explode(',',$userdata->state_id))) {
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
                                        <option {{$select}} value="{{$statev->id}}">{{$statev->state_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                Division
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select class="multipleSelect divisionname" name="divisionname">
                                    @foreach ($division as $divik => $diviv)
                                        @if ($userdata)
                                                @php
                                                    if(in_array($diviv->id, explode(',',$userdata->division_id))) {
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
                                        <option {{$select}} value="{{$diviv->id}}">{{$diviv->division_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                PCA
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <div class="pcadiv">

                                </div>
                            </div>
                        </div>
                        {{-- <div class='form-group header-group-0'>
                            <label class='control-label col-sm-2'>
                                Agreement
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <div class="agreementdiv">

                                </div>
                            </div>
                        </div> --}}
                    </div>
                    <div class="box-footer">
                        <a href="{{CRUDBooster::adminPath('users')}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Back</a>
                        <input type="submit" name="submit" id="submit" value="Save" class="btn btn-success">
                        <input type="reset" class="btn btn-warning" value="Reset" />
                    </div>
            </form>
        </div>
    </div>
</div>
</div>
@endif

@endsection
@push('top')

@endpush
@push('bottom')
    <link rel="stylesheet" href="/fastselect/fastselect.min.css">
    <script src="/fastselect/fastselect.standalone.js"></script>
    <script>
        $(document).ready(function(){
            var state = $('.statename').val();
            var division = $('.divisionname').val();
            var user_id = $('#user_id').val();

            $('#submit').on('click',function(){
                if(($('.pcaname:checked').length === 0)){
                    window.alert('please select pca value');
                    return false;
                }
            });

            function pcaList(state, division, user_id) {
                $.get(`/api/get/pcalist/${state}/${division}/${user_id}`, function (pcalist) {
                    $('.pcadiv').html(pcalist);
                });
            }

            function callPcaApi() {
                if(state != '' && division != '') {
                    pcaList(state, division, user_id);
                    console.log(pcaList(state, division, user_id));
                }
            }

            callPcaApi();
            $('.statename').change(function(){
                state = $('.statename').val();
                pcaList(state, division, user_id);
            });
            $('.divisionname').change(function(){
                division = $('.divisionname').val();
                pcaList(state, division, user_id);
            });



            $('.multipleSelect').fastselect();
        });

    </script>
@endpush
