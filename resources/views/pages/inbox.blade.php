<!-- First, extends to the CRUDBooster Layout -->
@extends('crudbooster::admin_template')
@section('content')
<link rel='stylesheet' href='/css/inbox.css?r='{{time()}}/>
<div class="mail-box">
    <aside class="sm-side">
        <div class="inbox-body"></div>
        <div class="inbox-body"></div>
        <ul class="inbox-nav inbox-divider">
            <li class="active">
                <a href="#"><i class="fa fa-inbox"></i> Inbox <span class="label label-danger pull-right">2</span></a>

            </li>
            <li>
                <a href="#"><i class="fa fa-envelope-o"></i> Outbox</a>
            </li>
        </ul>
    </aside>
    <aside class="lg-side">
        <div class="inbox-head">
            <h3>Inbox</h3>
            <form action="#" class="pull-right position">
                <div class="input-append">
                </div>
            </form>
        </div>
        <div class="inbox-body">
            <table class="table table-inbox table-hover">
              <tbody>
                @foreach ($inbox as $in)
                    @php
                        if($in->opened != 1){
                            $unread = "unread";
                        } else {
                            $unread = "";
                        }
                    @endphp
                    <tr class="{{$unread}}">
                        <td class="view-message  dont-show">{{getAgreementNameByRequestID($in->agreement_request_id)}}</td>
                        <td class="view-message "></td>
                        <td class="view-message  inbox-small-cells"></td>
                        <td class="view-message  text-right">9:27 AM</td>
                    </tr>
                @endforeach
            </tbody>
            </table>
        </div>
    </aside>
</div>
@endsection
@push('bottom')
    <script>
        $(document).ready(function(){

        });
    </script>
@endpush
