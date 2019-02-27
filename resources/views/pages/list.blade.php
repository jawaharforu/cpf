@extends('crudbooster::admin_template')
@section('content')
    <div>
        <div class="row">
            <div class="col-md-12">
                <div class='panel panel-default'>
                    <div class='panel-heading'>
                        <h3>{{$pageTitle}}</h3>
                    </div>
                    <div class='panel-body'>
                        <div>
                            <table id="listOfForm" class="table table-striped table-responsive"
                                style="width: 100%;"
                                role="grid" aria-describedby="example_info">
                             <thead>
                             <tr role="row">
                                 <th>Ticket ID</th>
                                 <th>Agreement Type</th>
                                 <th>Vendor Name</th>
                                 <th>Created Date</th>
                                 <th>Status</th>
                                 <th>Recent Comments</th>
                                 <th>Action</th>
                             </tr>
                             </thead>
                             <tbody>
                             @foreach($requestForm as $rf)
                                 <tr class="{{ readOrNotRead($rf->id) }}" role="row">
                                     <td>{{$rf->ticket_no}}</td>
                                     <td>{{getAgreementNameByID($rf->agreement_id)}}</td>
                                     <td>{{$rf->vendor_name}}</td>
                                     <td>{{$rf->created_at}}</td>
                                     <td>{{getStatusByID($rf->status)->status_name}}</td>
                                     <td>{{getRecentCommenet($rf->id)}}</td>
                                     <td><a href="<?php echo CRUDBooster::adminPath('agreement_request/view/'.$rf->id); ?>">Full View</a></td>
                                 </tr>
                             @endforeach
                             </tbody>
                         </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('bottom')
    <link href="https://cdn.jsdelivr.net/css-toggle-switch/latest/toggle-switch.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.11.1/full/ckeditor.js"></script>
    //http://cssdeck.com/labs/ufct35ys5t
    <script>
        $(document).ready(function(){
            $("#listOfForm").DataTable({
                "order": [[ 0, "desc" ]]
            });
        });
    </script>
@endpush
