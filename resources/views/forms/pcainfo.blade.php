@extends('crudbooster::admin_template')
@section('content')

    <h1>{{$name}}</h1>
<div class="row">
    <div class="container">
        <form action="" method="POST">
            {{ csrf_field() }}
            <div class="form-group header-group-0 row">
                <label for="verifier" class='control-label col-sm-2'>Verifier</label>
                <div class="col-sm-10">
                    <select class="col-md-6" id="verifier" name="verifier">
                            @if($agreementsselected)
                            @php
                                $i = 1;
                                $optionlist = array();
                                for($i=1;$i<=3;$i++){
                                    if($agreementsselected->verify == $i){
                                        echo "<option selected value='".$i."'>".$i."</option>";
                                    }else{
                                        echo"<option value='".$i."'>".$i."</option>";
                                    }
                                }
                            @endphp
                        @endif
                    </select>
                </div>
            </div>
            <div class="form-group header-group-0 row">
                <label for="approver" class='control-label col-sm-2'>Approver</label>
                <div class="col-sm-10">
                    <select class="col-md-6" id="approver" name="approver">
                        @if($agreementsselected)
                            @php
                                $i = 1;
                                $optionlist = array();
                                for($i=1;$i<=3;$i++){
                                    if($agreementsselected->approval == $i){
                                        echo "<option selected value='".$i."'>".$i."</option>";
                                    }else{
                                        echo"<option value='".$i."'>".$i."</option>";
                                    }
                                }
                            @endphp
                        @endif
                    </select>
                </div>
            </div>
            {{-- <div class='form-group header-group-0 row'>
                <label class='control-label col-sm-2'>
                        Agreements
                    <span class='text-danger' title='This field is required'>*</span>
                </label>
                <div class="col-sm-10">
                    <select class="multipleSelect" multiple id="agreementids" title="PCA" name="agreementids[]">
                        @foreach ($agreements as $item)
                            @if($agreementsselected)
                                @php
                                    if(in_array($item->id, explode(",",$agreementsselected->agreement_id))){
                                        $select = "selected";
                                    }else{
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
            </div> --}}
            <div class="form-group">
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