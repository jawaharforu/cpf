@extends('crudbooster::admin_template')
@section('content')
<div class="row">
    <div class="col-lg-3 col-md-6">
        @if ($userCount)
            <div class="panel panel-primary boxshad">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-users fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{{$userCount}}</div>
                            <div>Total Users</div>
                        </div>
                    </div>
                </div>
                <a href="<?php echo CRUDBooster::adminPath('users'); ?>">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        @else
            <div class="panel panel-primary boxshad">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-users fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{{$newRequest}}</div>
                            <div>To be Assigned</div>
                        </div>
                    </div>
                </div>
                <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        @endif
    </div>
    @if(CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1 || CRUDBooster::myPrivilegeId() == 6 || CRUDBooster::myPrivilegeId() == 4)
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-file-pdf-o fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$requestCount}}</div>
                        <div>Total Agreements</div>
                    </div>
                </div>
            </div>
            @if(CRUDBooster::myPrivilegeId() != 4)
            <a href="<?php echo CRUDBooster::adminPath('agreement_request'); ?>">
            @else
            <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
            @endif
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    @endif
    @if(CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1)
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-users fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$docVerifier}}</div>
                        <div>Sent to  doc Verifier</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-users fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$docApprover}}</div>
                        <div>Sent to  doc Approver</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    @endif
    @if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1)
    <div class="col-lg-3 col-md-6">
    <div class="panel panel-primary boxshad">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-users fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge">{{$AGCIncharge}}</div>
                    <div>Sent to  AGC Incharge</div>
                </div>
            </div>
        </div>
        <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
            <div class="panel-footer">
                <span class="pull-left">View Details</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </a>
    </div>
    </div>
    <div class="col-lg-3 col-md-6">
    <div class="panel panel-primary boxshad">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-users fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge">{{$AGCVerifier}}</div>
                    <div>Sent to  AGC Verifier</div>
                </div>
            </div>
        </div>
        <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
            <div class="panel-footer">
                <span class="pull-left">View Details</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </a>
    </div>
    </div>
    <div class="col-lg-3 col-md-6">
    <div class="panel panel-primary boxshad">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3">
                    <i class="fa fa-users fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                    <div class="huge">{{$AGCApprover}}</div>
                    <div>Sent to  AGC Approver</div>
                </div>
            </div>
        </div>
        <a href="<?php echo CRUDBooster::adminPath('listing'); ?>">
            <div class="panel-footer">
                <span class="pull-left">View Details</span>
                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                <div class="clearfix"></div>
            </div>
        </a>
    </div>
    </div>
    @endif
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-yellow boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-check-circle fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$requestDraftApprovedCount}}</div>
                        <div>Draft Approved Agreement</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listStatusWise/14'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-purpal boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-check-circle fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$requestFinalApprovedCount}}</div>
                        <div>Final Approved Agreement</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listStatusWise/19'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-greenyellow boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-upload fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$requestSignedDoc}}</div>
                        <div>Signed Agreement</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listStatusWise/16'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-ban fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$requestRejectCount}}</div>
                        <div>Rejected Agreement</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('listStatusWise/0'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    @if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 6 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1)
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-ban fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$renewal}}</div>
                        <div>Renewal</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('renewal-list'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red boxshad">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-ban fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">{{$expired}}</div>
                        <div>Expired</div>
                    </div>
                </div>
            </div>
            <a href="<?php echo CRUDBooster::adminPath('expired-list'); ?>">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    @endif
</div>
@if(CRUDBooster::myPrivilegeId() == 4 || CRUDBooster::myPrivilegeId() == 2 || CRUDBooster::myPrivilegeId() == 1)
<div class="row">
    <div class="col-md-12">
        <div class='panel panel-default'>
            <div class='panel-heading'>
                Dashboard
            </div>
            <div class='panel-body'>
                @if($agreementschartjs)
                <div style="width:75%;">
                    {!! $agreementschartjs->render() !!}
                </div>
                @endif
                @if($yearchartjs)
                <div style="width:75%;">
                    {!! $yearchartjs->render() !!}
                </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endif
@endsection
@push('bottom')
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
@endpush
