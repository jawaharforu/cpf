<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')

    <div class='panel panel-default'>
        <div class='panel-heading'>{{ $page_title }}</div>
        <div class='panel-body'>
            <form method="POST" action="" enctype='multipart/form-data'>
                    {{ csrf_field() }}
                    <div class="box-body" id="parent-form-area">
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Nature of Agreement
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select required class="form-control agreements" title="Nature of Agreement" id="nature_of_agreement" name="nature_of_agreement">
                                    <option selected value="">Choose Option</option>
                                    @foreach ($agreement as $agreement_value)
                                        <option value="{{$agreement_value->id}}">{{$agreement_value->agreement_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                    PCA
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select required class="multipleSelect form-control" id="pca_id" title="PCA" name="pca_id">
                                    <option selected value="">Choose Option</option>
                                    @foreach ($pca as $pcavalue)
                                        <option value="{{$pcavalue->id}}">{{$item->pca_code}}-{{$pcavalue->pca_name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Name of the Vendor/Customer
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type='text' title="Name of the Vendor/Customer" required    maxlength=255 class='form-control'
                                name="vendor_name" id="vendor_name" value=''/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Address
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <textarea class="form-control" title="Address" name="address" id="address" rows="3"></textarea>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Own/Lease/Representative
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select required class="multipleSelect form-control" title="Own/Lease/Representative" id="own_lease_representative" name="own_lease_representative">
                                    <option selected value="">Choose Option</option>
                                    <option value="Own">Own</option>
                                    <option value="Lease">Lease</option>
                                    <option value="Representative">Representative</option>
                                </select>
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                New/Renewal Agreement
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <select required class="multipleSelect  form-control" name="newrenewal" id="newrenewal" title="New/Renewal Agreement">
                                    <option selected value="">Choose Option</option>
                                    <option value="New">New</option>
                                    <option value="Renewal">Renewal</option>
                                    <option value="Amendment">amendment</option>
                                </select>
                            </div>
                        </div>
                        <div id="exist_ticket_no" style="display:none" class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Existing Ticket Number
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type="text" title="Existing Ticket Number" class="form-control exist_ticket_no" name="exist_ticket_no" >
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Vendor/Customer Code
                                <span class='text-danger vendorcode' title='This field is required'></span>
                            </label>
                            <div class="col-sm-10">
                                <input type='text' title="Vendor/Customer Code" maxlength=255 class='form-control'
                                name="vendor_code" id="vendor_code" value=''/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Start Date
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type="text" title="Start Date" data-date-format='dd/mm/yyyy' required class="form-control" name="start_date" id="start_date">
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                End Date
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type="text" title="End Date" data-date-format='dd/mm/yyyy' required class="form-control" name="end_date" id="end_date">
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Consideration (Rs.)(Rent/Charges to be paid)
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type='number' title="Consideration (Rs.)(Rent/Chargers to be paid)" required maxlength=255 class='form-control'
                                name="consideration_rs" id="consideration_rs"/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class="doc_attach_div">
                            <p class="align-middle">Documents attached</p>
                            <div id="doc_attach_div">
                                <p>Documents need to be attached</p>
                            </div>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Other Document 1
                            </label>
                            <div class="col-sm-10">
                                <input type="file" title="Other Document"
                                        class="form-control" id="other_attachment" name="other_attachment">
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Other Document 2
                            </label>
                            <div class="col-sm-10">
                                <input type="file" title="Other Document"
                                        class="form-control" id="other_attachment1" name="other_attachment1">
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Deposit
                                <span class='text-danger' title='This field is required'>*</span>
                            </label>
                            <div class="col-sm-10">
                                <input type='text' title="Deposit" required maxlength=255 class='form-control'
                                name="deposit" id="deposit"/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <div class='form-group header-group-0 row'>
                            <label class='control-label col-sm-2'>
                                Other Information
                            </label>
                            <div class="col-sm-10">
                                <input type='text' title="Other Information" maxlength=255 class='form-control'
                                name="other_information" id="other_information"/>
                            </div>
                            <div class="text-danger"></div>
                            <p class='help-block'></p>
                        </div>
                        <input type="hidden" name="ticket_no" value="{{getNewTicketNo()}}" />
                    </div>
                    <div class="box-footer">
                        <a href="{{CRUDBooster::adminPath('agreement_request')}}" class="btn btn-default"><i class="fa fa-chevron-circle-left"></i> Back</a>
                        <input type="submit" name="submit" value="Save" class="btn btn-success">
                        <input type="reset" class="btn btn-warning" value="Reset" />
                    </div>
            </form>
        </div>
    </div>
@endsection
@push('top')

@endpush
@push('bottom')
    <link rel="stylesheet" href="/fastselect/fastselect.min.css">
    <script>
        $(document).ready(function(){
            $('#start_date').datepicker();
            $('#end_date').datepicker();
            $('.agreements').change(function(){
                var agreement = $(this).val();
                if(agreement != '') {
                    $.get(`/api/get/agreement_attachment/${agreement}`, function (agreementOutput) {
                        $('#doc_attach_div').html('');
                        var obj = jQuery.parseJSON(agreementOutput);
                        $.each(obj, function (index, value) {
                            $('#doc_attach_div').append(`
                                <div class='form-group header-group-0 row'>
                                    <label class='control-label col-sm-2'>
                                        ${value.name}
                                        <span class='text-danger' title='This field is required'>*</span>
                                    </label>
                                    <div class="col-sm-10">
                                        <input type="file" required
                                        class="form-control" id="documents_attached" name="agreement_attached[${value.id}]" data-toggle="tooltip" data-placement="top" title="${value.discription}">
                                    </div>
                                </div>
                            `);
                        });
                    });
                } else {
                    $('#doc_attach_div').html('');
                }
            });
            $('#newrenewal').change(function(){
                if($(this).val() == "Renewal" || $(this).val() == "Amendment") {
                    $('#exist_ticket_no').show();
                    $('.exist_ticket_no').attr('required','required');
                    $('.vendorcode').html("*");
                    $('#vendor_code').attr('required','required');
                } else {
                    $('#exist_ticket_no').hide();
                    $('#exist_ticket_no').removeAttr("required");
                    $('.vendorcode').html("");
                    $('#vendor_code').removeAttr("required");
                }
            });
        });
    </script>
@endpush
