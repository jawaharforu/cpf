<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
    use CRUDBooster;
    use Illuminate\Support\Facades\Storage;
	class AdminAgreementRequestController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "vendor_name";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = false;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = false;
			$this->button_delete = false;
			$this->button_detail = false;
			$this->button_show = false;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = true;
			$this->show_numbering = TRUE;
			$this->table = "agreement_request";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
            $this->col = [];
            $this->col[] = ["label"=>"Ticket No","name"=>"ticket_no"];
			$this->col[] = ["label"=>"Agreement","name"=>"agreement_id","join"=>"agreement,agreement_name"];
			$this->col[] = ["label"=>"PCA","name"=>"pca_id","join"=>"pca,pca_name"];
			$this->col[] = ["label"=>"PCA Code","name"=>"pca_id","join"=>"pca,pca_code"];
			$this->col[] = ["label"=>"Vendor Name","name"=>"vendor_name"];
			$this->col[] = ["label"=>"Address","name"=>"address"];
			$this->col[] = ["label"=>"Own/Lease/Representative","name"=>"own_lease_representative"];
			$this->col[] = ["label"=>"New/Renewal Agreement","name"=>"new_renewal"];
			$this->col[] = ["label"=>"Vendor Code","name"=>"vendor_code"];
            $this->col[] = ["label"=>"Start Date","name"=>"start_date"];
            $this->col[] = ["label"=>"End Date","name"=>"end_date"];
            $this->col[] = ["label"=>"Consideration","name"=>"consideration_rs"];
            $this->col[] = ["label"=>"Deposit","name"=>"deposit"];
            $this->col[] = ["label"=>"Status","name"=>"status","join"=>"status_type,status_name"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Agreement Id','name'=>'agreement_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'agreement,agreement_name'];
			$this->form[] = ['label'=>'PCA','name'=>'pca_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'pca,pca_name'];
			$this->form[] = ['label'=>'Vendor Name','name'=>'vendor_name','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Address','name'=>'address','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Vendor Code','name'=>'vendor_code','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Own Lease Representative','name'=>'own_lease_representative','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Start Date','name'=>'start_date','type'=>'datetime','validation'=>'required|date_format:Y-m-d H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'End Date','name'=>'end_date','type'=>'datetime','validation'=>'required|date_format:Y-m-d H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Consideration Rs','name'=>'consideration_rs','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Documents Attached','name'=>'documents_attached','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Deposit','name'=>'deposit','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Other Information','name'=>'other_information','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'State Id','name'=>'state_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'state,state_name'];
			$this->form[] = ['label'=>'User Id','name'=>'user_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'user,id'];
			$this->form[] = ['label'=>'Status','name'=>'status','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Agreement Id","name"=>"agreement_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"agreement,agreement_name"];
			//$this->form[] = ["label"=>"Business Unit Id","name"=>"business_unit_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"business_unit,business_unit_name"];
			//$this->form[] = ["label"=>"Vendor Name","name"=>"vendor_name","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Address","name"=>"address","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Vendor Code","name"=>"vendor_code","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Own Lease Representative","name"=>"own_lease_representative","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Start Date","name"=>"start_date","type"=>"datetime","required"=>TRUE,"validation"=>"required|date_format:Y-m-d H:i:s"];
			//$this->form[] = ["label"=>"End Date","name"=>"end_date","type"=>"datetime","required"=>TRUE,"validation"=>"required|date_format:Y-m-d H:i:s"];
			//$this->form[] = ["label"=>"Consideration Rs","name"=>"consideration_rs","type"=>"text","required"=>TRUE,"validation"=>"required|min:1|max:255"];
			//$this->form[] = ["label"=>"Documents Attached","name"=>"documents_attached","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Deposit","name"=>"deposit","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"Other Information","name"=>"other_information","type"=>"textarea","required"=>TRUE,"validation"=>"required|string|min:5|max:5000"];
			//$this->form[] = ["label"=>"State Id","name"=>"state_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"state,state_name"];
			//$this->form[] = ["label"=>"User Id","name"=>"user_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"user,id"];
			//$this->form[] = ["label"=>"Status","name"=>"status","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			# OLD END FORM

			/*
	        | ----------------------------------------------------------------------
	        | Sub Module
	        | ----------------------------------------------------------------------
			| @label          = Label of action
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        |
	        */
	        $this->sub_module = array();


	        /*
	        | ----------------------------------------------------------------------
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------
	        | @label       = Label of action
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        |
	        */
            $this->addaction = array();
            $this->addaction[] = ['label'=>'View Full Status','url'=>CRUDBooster::mainpath('view/[id]'),'icon'=>'fa fa-list','color'=>'success'];


	        /*
	        | ----------------------------------------------------------------------
	        | Add More Button Selected
	        | ----------------------------------------------------------------------
	        | @label       = Label of action
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button
	        | Then about the action, you should code at actionButtonSelected method
	        |
	        */
	        $this->button_selected = array();


	        /*
	        | ----------------------------------------------------------------------
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------
	        | @message = Text of message
	        | @type    = warning,success,danger,info
	        |
	        */
	        $this->alert        = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Add more button to header button
	        | ----------------------------------------------------------------------
	        | @label = Name of button
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        |
	        */
	        $this->index_button = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.
	        |
	        */
	        $this->table_row_color = array();


	        /*
	        | ----------------------------------------------------------------------
	        | You may use this bellow array to add statistic at dashboard
	        | ----------------------------------------------------------------------
	        | @label, @count, @icon, @color
	        |
	        */
	        $this->index_statistic = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Add javascript at body
	        | ----------------------------------------------------------------------
	        | javascript code in the variable
	        | $this->script_js = "function() { ... }";
	        |
	        */
	        $this->script_js = NULL;


            /*
	        | ----------------------------------------------------------------------
	        | Include HTML Code before index table
	        | ----------------------------------------------------------------------
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
	        $this->pre_index_html = null;



	        /*
	        | ----------------------------------------------------------------------
	        | Include HTML Code after index table
	        | ----------------------------------------------------------------------
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
	        $this->post_index_html = null;



	        /*
	        | ----------------------------------------------------------------------
	        | Include Javascript File
	        | ----------------------------------------------------------------------
	        | URL of your javascript each array
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
	        $this->load_js = array();



	        /*
	        | ----------------------------------------------------------------------
	        | Add css style at body
	        | ----------------------------------------------------------------------
	        | css code in the variable
	        | $this->style_css = ".style{....}";
	        |
	        */
	        $this->style_css = NULL;



	        /*
	        | ----------------------------------------------------------------------
	        | Include css File
	        | ----------------------------------------------------------------------
	        | URL of your css each array
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
	        $this->load_css = array();


	    }


	    /*
	    | ----------------------------------------------------------------------
	    | Hook for button selected
	    | ----------------------------------------------------------------------
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here

	    }


	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate query of index result
	    | ----------------------------------------------------------------------
	    | @query = current sql query
	    |
	    */
	    public function hook_query_index(&$query) {
            //Your code here
            if(CRUDBooster::myPrivilegeId() == 6) {
                $query->where($this->table.'.user_id',CRUDBooster::myId());
            }

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate row of index table html
	    | ----------------------------------------------------------------------
	    |
	    */
	    public function hook_row_index($column_index,&$column_value) {
	    	//Your code here
	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate data input before add data is execute
	    | ----------------------------------------------------------------------
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after add public static function called
	    | ----------------------------------------------------------------------
	    | @id = last insert id
	    |
	    */
	    public function hook_after_add($id) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for manipulate data input before update data is execute
	    | ----------------------------------------------------------------------
	    | @postdata = input post data
	    | @id       = current id
	    |
	    */
	    public function hook_before_edit(&$postdata,$id) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_after_edit($id) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_before_delete($id) {
	        //Your code here

	    }

	    /*
	    | ----------------------------------------------------------------------
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------
	    | @id       = current id
	    |
	    */
	    public function hook_after_delete($id) {
	        //Your code here

        }

        public function fileUpload($request_data, $key) {
            if(!empty($request_data[$key])) {
                $getting_file_extension = $request_data[$key]->getClientOriginalExtension();
                $custom_file_name = time(). str_random(14). "." . $getting_file_extension;
                $file = $request_data[$key]->storeAs('uploads/documents/',$custom_file_name);
                $filename = "uploads/documents/".$custom_file_name;
            } else {
                $filename = "";
            }
            return $filename;
        }

	    //By the way, you can still create your own method in here... :)
        public function getAdd() {
            $data = [];
            $data['page_title'] = "Agreement Request Form";
			$user_details = DB::table('cms_users')->where('id',Crudbooster::me()->id)->get()->first();
			// $user_details = DB::table('cms_users')->where('id',2)->get()->first();
			$pca = $user_details->pca_id;
			$states = $user_details->state_id;
			$data['pca'] = DB::table('pca')->whereIn('id',explode(',',$pca))->get()->all();
			$data['agreement'] = DB::table('agreement')->get()->all();
            $this->cbView('forms.agreement_request',$data);
		}

		public function postAdd() {

			$request_data = request()->all();
			$nature_of_agreement = $request_data['nature_of_agreement'];
			$pca_id = $request_data['pca_id'];
			$vendor_name = $request_data['vendor_name'];
			$address = $request_data['address'];
			$vendor_code = $request_data['vendor_code'];
			$own_lease_representative = $request_data['own_lease_representative'];
			$newrenewal = $request_data['newrenewal'];
			$start_date = explode("/",$request_data['start_date']);
            $end_date = explode("/",$request_data['end_date']);
			$consideration_rs = $request_data['consideration_rs'];
			$agreement_attached = $request_data['agreement_attached'];
			$deposit = $request_data['deposit'];
			$other_information = $request_data['other_information'];
            $state_id = $request_data['state_id'];
            $exist_ticket_no = $request_data['exist_ticket_no'];
            $other_attachment = $this->fileUpload($request_data, 'other_attachment');
            $other_attachment1 = $this->fileUpload($request_data, 'other_attachment1');
			$user_id = Crudbooster::me()->id;
			$save_agreement_request = DB::table('agreement_request')
                ->insertGetId([
					'agreement_id' => $nature_of_agreement,
					'pca_id' => $pca_id,
					'vendor_name' => $vendor_name,
					'address' => $address,
					'vendor_code' => $vendor_code,
					'own_lease_representative' => $own_lease_representative,
					'new_renewal' => $newrenewal,
					'start_date' =>  date('Y-m-d',strtotime($start_date[1].'/'.$start_date[0].'/'.$start_date[2])),
					'end_date' => date('Y-m-d',strtotime($end_date[1].'/'.$end_date[0].'/'.$end_date[2])),
					'consideration_rs' => $consideration_rs,
					'deposit' => $deposit,
					'other_information' => $other_information,
					'user_id' => $user_id,
                    'status' => 22,
                    'other_attachment' => $other_attachment,
                    'other_attachment1' => $other_attachment1,
                    'exist_ticket_no' => $exist_ticket_no,
                    'ticket_no' => DB::table('agreement_request')->max('ticket_no') + 1
                ]);
            $attacmentsids = array();
            foreach($agreement_attached as $key => $value) {
				$getting_file_extension = $request_data['agreement_attached'][$key]->getClientOriginalExtension();
				$custom_file_name = time(). str_random(14). "." . $getting_file_extension;
				$file = $request_data['agreement_attached'][$key]->storeAs('uploads/documents/',$custom_file_name);
                $filename = "uploads/documents/".$custom_file_name;
				$ext = pathinfo(url($filename), PATHINFO_EXTENSION);
                $save_agreement_attachment = DB::table('agreement_attachment')->insertGetId([
                    'agreement_id' => $nature_of_agreement,
					'agreement_request_id' => $save_agreement_request,
					'attachment_id' => $key,
					'filename' => $filename,
					'version' => DB::table('agreement_attachment')->where('agreement_request_id',$save_agreement_request)->max('version') + 1,
					'created_at' => date("Y-m-d h:i:s"),
					'updated_at' => date("Y-m-d h:i:s")
				]);
                $attacmentsids[] = $save_agreement_attachment;
			}
            $update = DB::table('agreement_request')
                    ->where('id', $save_agreement_request)
                    ->update([
                        'documents_attached' => implode(",",$attacmentsids)
					]);

			$toid = DB::table('cms_users')
					->where('pca_id', $pca_id)
					->where('id','!=', $user_id)
					->value('id');
            /*
			$request = DB::table('request')->insert([
				'agreement_request_id' => $save_agreement_request,
				'from_user_id' => $user_id,
				'to_user_id' => $toid
                ]);
            */
			if($request){
				return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request'), "Agreement Request Created", $type='success');
			}else{
				return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request'), "Attachment not saved", $type='success');
			}

        }

        public function getView($id) {
            $request_data = request()->all();
            $data = [];
            $data['agreement_request'] = DB::table('agreement_request')->where('id', $id)->get()->first();
            $data['agreement_sample_document'] = DB::table('agreement_sample_document')->where('agreement_id', $data['agreement_request']->agreement_id)->get()->first();
            $data['agreement_attachment'] = DB::table('agreement_attachment')->where('agreement_request_id', $id)->whereIn('id', explode(",", $data['agreement_request']->documents_attached))->get()->all();
            $data['other_attachment'] = DB::table('other_attachment')->where('agreement_request_id', $id)->get()->all();
            $data['agreement_request_status'] = DB::table('request')->where('agreement_request_id', $id)->get()->all();
            $data['agreement_request_ext_status'] = DB::table('request_ext')->where('agreement_request_id', $id)->get()->all();
            $latestAction = DB::table('request')->where('agreement_request_id', $id)->where('to_user_id', Crudbooster::me()->id)->orderBy('id', 'desc')->where('repoted',0)->get()->first();
            $countAgrement = DB::table('request')->where('agreement_request_id', $id)->count();
            $data['countAgrement'] = $countAgrement;
            $data['agreement_copy'] = DB::table('agreement_copy')->where('agreement_request_id', $id)->orderBy('id', 'desc')->get()->first();
            $data['agreement_copy_log'] = DB::table('agreement_copy_log')->where('agreement_copy_id', $data['agreement_copy']->id)->orderBy('id', 'desc')->get()->all();
            if($latestAction) {
                if(Crudbooster::me()->id == $latestAction->to_user_id) {
                    $data['docFiles'] = "yes";
                    DB::table('request')
                    ->where('id', $latestAction->id)
                    ->update([
                        'opened' => 1
                    ]);
                    DB::table('cms_notifications')
                    ->where('id_cms_users', Crudbooster::me()->id)
                    ->where('url', "/admin/agreement_request/view/".$id)
                    ->update([
                        'is_read' => 1
                    ]);
                } else {
                    $data['docFiles'] = "no";
                }
            } else if(CRUDBooster::myPrivilegeId() == 6 && $countAgrement==0) {
                $data['docFiles'] = "yes";
            } else {
                $data['docFiles'] = "no";
            }
            $data['report'] = $latestAction;
            if($request_data['rene']) {
                $data['renewal'] = "yes";
            } else {
                $data['renewal'] = "no";
            }
            $this->cbView('pages.view',$data);
        }

        public function agreementCopyAdd($agreement_copy_id, $request_data, $doc_type) {
            DB::table('agreement_copy_log')->insert([
                'agreement_copy_id' => $agreement_copy_id,
                'user_id' => CRUDBooster::myId(),
                'document' => $request_data['agreement_copy'],
                'created_at' => date("Y-m-d h:i:s"),
                'doc_type' => $doc_type,
                'version' => DB::table('agreement_copy_log')->where('agreement_copy_id',$agreement_copy_id)->max('version') + 1
                ]);
        }

        public function agreementCopyFileAdd($agreement_copy_id, $filename, $doc_type, $request_data) {
            DB::table('agreement_copy_log')->insert([
                'agreement_copy_id' => $agreement_copy_id,
                'user_id' => CRUDBooster::myId(),
                'filename' => $filename,
                'document' => $request_data['agreement_copy'],
                'created_at' => date("Y-m-d h:i:s"),
                'doc_type' => $doc_type,
                'version' => DB::table('agreement_copy_log')->where('agreement_copy_id',$agreement_copy_id)->max('version') + 1
                ]);
        }

        public function postReportAssign() {
            $request_data = request()->all();
            $aggrement_request = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $pca_map = DB::table('pca_mapping')->where('agreement_id', $aggrement_request->agreement_id)->where('pca_id', $aggrement_request->pca_id)->get()->first();
            switch (CRUDBooster::myPrivilegeId()) {
                case 6: // Requestor
                    $countReq = DB::table('request')->where('agreement_request_id', $request_data['agreement_request_id'])->whereIn('privilege_id',array(4,5,9,10))->count();
                    if($countReq > 0){
                        $nextReportPerson = 9;
                        $status = 7;
                    } else {
                        $nextReportPerson = 7;
                        $status = 1;
                    }
                    break;
                case 7: // Doc Verifier
                    $nextReportPerson = 8;
                    $status = 3;
                    $colm = $pca_map->verify;
                    $colmuser = $pca_map->verifier_user_id;
                    break;
                case 8: // Doc Approver
                    $nextReportPerson = 4;
                    $status = 5;
                    $colm = $pca_map->approval;
                    $colmuser = $pca_map->approver_user_id;
                    break;
                case 4: // AGC Admin
                    $nextReportPerson = $request_data['privilege_to'];
                    if($nextReportPerson == 9){
                        $status = 7;
                    } else if($nextReportPerson == 5){
                        $status = 9;
                    } else if($nextReportPerson == 10){
                        $status = 11;
                    }
                    break;
                case 9: // AGC Incharge
                    $nextReportPerson = 5;
                    $status = 9;
                    break;
                case 5: // AGC Verifier
                    $nextReportPerson = 10;
                    $status = 11;
                    break;
                case 10: // AGC Approver
                    $nextReportPerson = 4;
                    $status = 13;
                    break;
                default:
                    echo "Your favorite color is neither red, blue, nor green!";
            }
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
                    ]);
            if($nextReportPerson == 7) {
                $arruser = explode(",", $pca_map->verifier_user_id);
                $toSend = DB::table('cms_users')->where('id', $arruser[0])->get()->all();
            } else if($nextReportPerson == 8) {
                $Ver = DB::table('request')->where('agreement_request_id', $request_data['agreement_request_id'])->whereIn('to_user_id',array($pca_map->verifier_user_id))->where('repoted',1)->get()->all();
                $countVer = DB::table('request')->where('agreement_request_id', $request_data['agreement_request_id'])->whereIn('to_user_id',array($pca_map->verifier_user_id))->where('repoted',1)->count();
                $arruser = explode(",", $pca_map->verifier_user_id);
                if($countVer == 0) {
                    $toSend = DB::table('cms_users')->where('id', $arruser[0])->get()->all();
                } else {
                    for($k=0; $k < count($arruser); $k++) {
                        if(CRUDBooster::myId() == $arruser[$k]){
                            $nextUser = $k + 1;
                        }
                    }
                    if(!empty($arruser[$nextUser])){
                        $toSend = DB::table('cms_users')->where('id', $arruser[$nextUser])->get()->all();
                        $status = 1;
                    } else {
                        $arruser = explode(",", $pca_map->approver_user_id);
                        $toSend = DB::table('cms_users')->where('id', $arruser[0])->get()->all();
                    }
                }
            } else if ($nextReportPerson == 4) {
                $Ver = DB::table('request')->where('agreement_request_id', $request_data['agreement_request_id'])->whereIn('to_user_id',array($pca_map->approver_user_id))->where('repoted',1)->get()->all();
                $countVer = DB::table('request')->where('agreement_request_id', $request_data['agreement_request_id'])->whereIn('to_user_id',array($pca_map->approver_user_id))->where('repoted',1)->count();
                $arruser = explode(",", $pca_map->approver_user_id);
                //$arr = array_merge(array_diff($arr, array("yellow", "red")));
                if($countVer == 0) {
                    $toSend = DB::table('cms_users')->where('id', $arruser[0])->get()->all();
                } else {
                    for($k=0; $k < count($arruser); $k++) {
                        if(CRUDBooster::myId() == $arruser[$k]){
                            $nextUser = $k + 1;
                        }
                    }
                    if(!empty($arruser[$nextUser])){
                        $toSend = DB::table('cms_users')->where('id', $arruser[$nextUser])->get()->all();
                        $status = 3;
                    } else {
                        $toSend = DB::table('cms_users')->where('id_cms_privileges', $nextReportPerson)->where('division_id', 'like', '%' . getUserDetailsByID($aggrement_request->user_id)->division_id . '%')->get()->all();
                    }
                }
            } else if($nextReportPerson == 5 || $nextReportPerson == 9 || $nextReportPerson == 10) {
                $toSend = DB::table('cms_users')->where('id_cms_privileges', $nextReportPerson)->where('division_id', 'like', '%' . getUserDetailsByID($aggrement_request->user_id)->division_id . '%')->get()->all();
            }
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => $status
                    ]);
            $ver = (CRUDBooster::myPrivilegeId() == 6)?"R":"D";
            if(!empty($request_data['agreement_copy'])){
                $doc = DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->get()->first();
                if($doc) {
                    DB::table('agreement_copy')
                    ->where('id', $doc->id)
                    ->update([
                        'document' => $request_data['agreement_copy'],
                        'created_at' => date("Y-m-d h:i:s"),
                        'space' => $request_data['space'],
                        'doc_type' => documentType($request_data['agreement_request_id']).$ver
                    ]);
                    $this->agreementCopyAdd($doc->id, $request_data, documentType($request_data['agreement_request_id']).$ver);
                } else {
                    $agreement_copy_id = DB::table('agreement_copy')->insertGetId([
                        'agreement_request_id' => $request_data['agreement_request_id'],
                        'document' => $request_data['agreement_copy'],
                        'status' => 1,
                        'created_at' => date("Y-m-d h:i:s"),
                        'updated_at' => date("Y-m-d h:i:s"),
                        'space' => $request_data['space'],
                        'doc_type' => documentType($request_data['agreement_request_id']).$ver,
                        'version' => DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->max('version') + 1,
                        ]);
                    $this->agreementCopyAdd($agreement_copy_id, $request_data, documentType($request_data['agreement_request_id']).$ver);
                }
            }

            if($toSend) {

                // if(CRUDBooster::myPrivilegeId() == 7 || CRUDBooster::myPrivilegeId() == 8) {
                //     $userreport = DB::table('request')->where('agreement_request_id',$aggrement_request->id)->where('repoted',1)->where('status',1)->whereIn('to_user_id', explode(",", $colmuser))->count();

                //     if ($colm != $userreport && $colm > 1) {
                //         foreach($toSend as $to) {

                //             DB::table('request_ext')->insert([
                //                 'agreement_request_id' => $request_data['agreement_request_id'],
                //                 'from_user_id' => CRUDBooster::myId(),
                //                 'to_user_id' => $to->id,
                //                 'remarks' => $request_data['remarks'],
                //                 'status' => 1,
                //                 'opened' => 0,
                //                 'repoted' => 0,
                //                 'privilege_id' => CRUDBooster::myPrivilegeId(),
                //                 'created_at' => date("Y-m-d h:i:s"),
                //                 'responded_at' => date("Y-m-d h:i:s")
                //                 ]);
                //             ///////Notification
                //             DB::table('cms_notifications')->insert([
                //                 'id_cms_users' => $to->id,
                //                 'content' => $aggrement_request->ticket_no ."-". $aggrement_request->vendor_name."-".getStatusByID($aggrement_request->status)->status_name,
                //                 'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                //                 'is_read' => 0,
                //                 'created_at' => date("Y-m-d h:i:s"),
                //                 'updated_at' => date("Y-m-d h:i:s")
                //             ]);

                //         }
                //         return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
                //     }
                // }

                foreach($toSend as $to) {

                    DB::table('request')->insert([
                        'agreement_request_id' => $request_data['agreement_request_id'],
                        'from_user_id' => CRUDBooster::myId(),
                        'to_user_id' => $to->id,
                        'remarks' => $request_data['remarks'],
                        'status' => 1,
                        'opened' => 0,
                        'repoted' => 0,
                        'privilege_id' => CRUDBooster::myPrivilegeId(),
                        'created_at' => date("Y-m-d h:i:s"),
                        'responded_at' => date("Y-m-d h:i:s")
                        ]);
                    ///////Notification
                    DB::table('cms_notifications')->insert([
                        'id_cms_users' => $to->id,
                        'content' => $aggrement_request->ticket_no ."-". $aggrement_request->vendor_name."-".getStatusByID($status)->status_name,
                        'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                        'is_read' => 0,
                        'created_at' => date("Y-m-d h:i:s"),
                        'updated_at' => date("Y-m-d h:i:s")
                    ]);
                }

                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
            } else {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Person not created", $type='danger');
            }
        }

        public function postReportReject() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 20
                    ]);
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
					]);
            DB::table('request')->insert([
                'agreement_request_id' => $request_data['agreement_request_id'],
                'from_user_id' => CRUDBooster::myId(),
                'to_user_id' => $requestForm->user_id,
                'remarks' => $request_data['remarks'],
                'status' => 2,
                'opened' => 0,
                'repoted' => 0,
                'privilege_id' => CRUDBooster::myPrivilegeId(),
                'created_at' => date("Y-m-d h:i:s"),
                'responded_at' => date("Y-m-d h:i:s")
                ]);
            if(CRUDBooster::myPrivilegeId() == 7 || CRUDBooster::myPrivilegeId() == 8) {
                $pid = (CRUDBooster::myPrivilegeId()==7)?6:7;
                DB::table('request')
                    ->where('agreement_request_id', $request_data['agreement_request_id'])
                    ->where('privilege_id', $pid)
                    ->where('repoted', 0)
                    ->delete();
            }
            ///////Notification
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $requestForm->user_id,
                'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(20)->status_name,
                'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='danger');
        }

        public function postReportApprove() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $doc = DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->get()->first();
            // if(!empty($request_data['file_copy'])) {
                DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 14
                    ]);
                DB::table('request')
                        ->where('id', $request_data['repoted'])
                        ->update([
                            'repoted' => 1,
                            'responded_at' => date("Y-m-d h:i:s")
                        ]);
                DB::table('request')->insert([
                    'agreement_request_id' => $request_data['agreement_request_id'],
                    'from_user_id' => CRUDBooster::myId(),
                    'to_user_id' => $requestForm->user_id,
                    'remarks' => $request_data['remarks'],
                    'status' => 1,
                    'opened' => 0,
                    'repoted' => 0,
                    'privilege_id' => CRUDBooster::myPrivilegeId(),
                    'created_at' => date("Y-m-d h:i:s"),
                    'responded_at' => date("Y-m-d h:i:s")
                    ]);
                ///////Notification
                DB::table('cms_notifications')->insert([
                    'id_cms_users' => $requestForm->user_id,
                    'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(14)->status_name,
                    'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                    'is_read' => 0,
                    'created_at' => date("Y-m-d h:i:s"),
                    'updated_at' => date("Y-m-d h:i:s")
                ]);
                // $getting_file_extension = $request_data['file_copy']->getClientOriginalExtension();
                // $custom_file_name = time(). str_random(14). "." . $getting_file_extension;
                // $file = $request_data['file_copy']->storeAs('uploads/documents/',$custom_file_name);
                // $filename = "uploads/documents/".$custom_file_name;
                if($doc) {
                    DB::table('agreement_copy')
                    ->where('id', $doc->id)
                    ->update([
                        //'filename' => $filename,
                        'document' => $request_data['agreement_copy'],
                        'space' => $request_data['space'],
                        'created_at' => date("Y-m-d h:i:s"),
                        'doc_type' => documentType($request_data['agreement_request_id'])."D"
                    ]);
                    $this->agreementCopyFileAdd($doc->id, '', documentType($request_data['agreement_request_id'])."D", $request_data);
                } else {
                    $agreement_copy_id = DB::table('agreement_copy')->insertGetId([
                        'agreement_request_id' => $request_data['agreement_request_id'],
                        //'filename' => $filename,
                        'document' => $request_data['agreement_copy'],
                        'space' => $request_data['space'],
                        'status' => 1,
                        'created_at' => date("Y-m-d h:i:s"),
                        'updated_at' => date("Y-m-d h:i:s"),
                        'doc_type' => documentType($request_data['agreement_request_id'])."D",
                        'version' => DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->max('version') + 1,
                        ]);
                    $this->agreementCopyFileAdd($agreement_copy_id, '', documentType($request_data['agreement_request_id'])."D", $request_data);
                }
            // } else {
            //     return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Upload final PDF file", $type='danger');
            // }
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
        }

        public function postSignedDocUpload() {
            $request_data = request()->all();
            $getting_file_extension = $request_data['signeddocument']->getClientOriginalExtension();
            $custom_file_name = time(). str_random(14). "." . $getting_file_extension;
            $file = $request_data['signeddocument']->storeAs('uploads/documents/',$custom_file_name);
            $filename = "uploads/documents/".$custom_file_name;
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 16,
                        'signed_doc' => $filename
                    ]);
            $aggrement_request = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $toSend = DB::table('cms_users')->where('id_cms_privileges', 4)->where('division_id', 'like', '%' . getUserDetailsByID($aggrement_request->user_id)->division_id . '%')->get()->all();
            foreach($toSend as $to) {

                DB::table('request')->insert([
                    'agreement_request_id' => $request_data['agreement_request_id'],
                    'from_user_id' => CRUDBooster::myId(),
                    'to_user_id' => $to->id,
                    'remarks' => $request_data['remarks'],
                    'status' => 1,
                    'opened' => 0,
                    'repoted' => 0,
                    'privilege_id' => CRUDBooster::myPrivilegeId(),
                    'created_at' => date("Y-m-d h:i:s"),
                    'responded_at' => date("Y-m-d h:i:s")
                    ]);
                ///////Notification
                DB::table('cms_notifications')->insert([
                    'id_cms_users' => $to->id,
                    'content' => $aggrement_request->ticket_no ."-". $aggrement_request->vendor_name."-".getStatusByID(16)->status_name,
                    'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                    'is_read' => 0,
                    'created_at' => date("Y-m-d h:i:s"),
                    'updated_at' => date("Y-m-d h:i:s")
                ]);
            }
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Document uploaded", $type='success');
        }

        public function postRevertBack() {
            $request_data = request()->all();
            $result = DB::table('request')->where('id', $request_data['repoted'])->where('to_user_id', CRUDBooster::myId())->get()->first();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 21
                    ]);
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
					]);
            DB::table('request')->insert([
                'agreement_request_id' => $request_data['agreement_request_id'],
                'from_user_id' => CRUDBooster::myId(),
                'to_user_id' => $result->from_user_id,
                'remarks' => $request_data['remarks'],
                'status' => 2,
                'opened' => 0,
                'repoted' => 0,
                'privilege_id' => CRUDBooster::myPrivilegeId(),
                'created_at' => date("Y-m-d h:i:s"),
                'responded_at' => date("Y-m-d h:i:s")
                ]);
            ///////Notification
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $result->from_user_id,
                'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(21)->status_name,
                'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='danger');
        }

        public function postDocReject() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $toSend = DB::table('cms_users')->where('id_cms_privileges', 9)->where('division_id', 'like', '%' . getUserDetailsByID($requestForm->user_id)->division_id . '%')->get()->first();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 7
                    ]);
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
					]);
            DB::table('request')->insert([
                'agreement_request_id' => $request_data['agreement_request_id'],
                'from_user_id' => CRUDBooster::myId(),
                'to_user_id' => $toSend->id,
                'remarks' => $request_data['remarks'],
                'status' => 2,
                'opened' => 0,
                'repoted' => 0,
                'privilege_id' => CRUDBooster::myPrivilegeId(),
                'created_at' => date("Y-m-d h:i:s"),
                'responded_at' => date("Y-m-d h:i:s")
                ]);
            ///////Notification
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $requestForm->user_id,
                'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(7)->status_name,
                'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='danger');
        }

        public function postAcceptDoc() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $toSend = DB::table('cms_users')->where('id_cms_privileges', 10)->where('division_id', 'like', '%' . getUserDetailsByID($requestForm->user_id)->division_id . '%')->get()->first();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 17
                    ]);
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
					]);
            DB::table('request')->insert([
                'agreement_request_id' => $request_data['agreement_request_id'],
                'from_user_id' => CRUDBooster::myId(),
                'to_user_id' => $toSend->id,
                'remarks' => $request_data['remarks'],
                'status' => 1,
                'opened' => 0,
                'repoted' => 0,
                'privilege_id' => CRUDBooster::myPrivilegeId(),
                'created_at' => date("Y-m-d h:i:s"),
                'responded_at' => date("Y-m-d h:i:s")
                ]);
            ///////Notification
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $toSend->id,
                'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(17)->status_name,
                'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
        }

        public function postDocSave() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $doc = DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->get()->first();
            if($doc) {
                DB::table('agreement_copy')
                ->where('id', $doc->id)
                ->update([
                    'document' => $request_data['agreement_copy'],
                    'space' => $request_data['space'],
                    'created_at' => date("Y-m-d h:i:s"),
                    'doc_type' => documentType($request_data['agreement_request_id'])."D"
                ]);
                $this->agreementCopyFileAdd($doc->id, '', documentType($request_data['agreement_request_id'])."D", $request_data);
            } else {
                $agreement_copy_id = DB::table('agreement_copy')->insertGetId([
                    'agreement_request_id' => $request_data['agreement_request_id'],
                    'document' => $request_data['agreement_copy'],
                    'space' => $request_data['space'],
                    'status' => 1,
                    'created_at' => date("Y-m-d h:i:s"),
                    'updated_at' => date("Y-m-d h:i:s"),
                    'doc_type' => documentType($request_data['agreement_request_id'])."R",
                    'version' => DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->max('version') + 1,
                    ]);
                $this->agreementCopyFileAdd($agreement_copy_id, '', documentType($request_data['agreement_request_id'])."R", $request_data);
            }
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Doc Saved", $type='success');
        }

        public function postReportFinalApprove() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            $doc = DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->get()->first();
            // if(!empty($request_data['file_copy'])) {
                DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 19
                    ]);
                DB::table('request')
                        ->where('id', $request_data['repoted'])
                        ->update([
                            'repoted' => 1,
                            'responded_at' => date("Y-m-d h:i:s")
                        ]);
                DB::table('request')->insert([
                    'agreement_request_id' => $request_data['agreement_request_id'],
                    'from_user_id' => CRUDBooster::myId(),
                    'to_user_id' => $requestForm->user_id,
                    'remarks' => $request_data['remarks'],
                    'status' => 1,
                    'opened' => 0,
                    'repoted' => 0,
                    'privilege_id' => CRUDBooster::myPrivilegeId(),
                    'created_at' => date("Y-m-d h:i:s"),
                    'responded_at' => date("Y-m-d h:i:s")
                    ]);
                ///////Notification
                DB::table('cms_notifications')->insert([
                    'id_cms_users' => $requestForm->user_id,
                    'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(19)->status_name,
                    'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                    'is_read' => 0,
                    'created_at' => date("Y-m-d h:i:s"),
                    'updated_at' => date("Y-m-d h:i:s")
                ]);
                if($doc) {
                    DB::table('agreement_copy')
                    ->where('id', $doc->id)
                    ->update([
                        'document' => $request_data['agreement_copy'],
                        'space' => $request_data['space'],
                        'created_at' => date("Y-m-d h:i:s"),
                        'doc_type' => documentType($request_data['agreement_request_id'])."F"
                    ]);
                    $this->agreementCopyFileAdd($doc->id, '', documentType($request_data['agreement_request_id'])."F", $request_data);
                } else {
                    $agreement_copy_id = DB::table('agreement_copy')->insertGetId([
                        'agreement_request_id' => $request_data['agreement_request_id'],
                        'document' => $request_data['agreement_copy'],
                        'space' => $request_data['space'],
                        'status' => 1,
                        'created_at' => date("Y-m-d h:i:s"),
                        'updated_at' => date("Y-m-d h:i:s"),
                        'doc_type' => documentType($request_data['agreement_request_id'])."F",
                        'version' => DB::table('agreement_copy')->where('agreement_request_id',$request_data['agreement_request_id'])->max('version') + 1,
                        ]);
                    $this->agreementCopyFileAdd($agreement_copy_id, '', documentType($request_data['agreement_request_id'])."F", $request_data);
                }
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
        }

        public function postRenewal(){
            $request_data = request()->all();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'renewal_need' => $request_data['renewalstatus']
                    ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('renewal-list'), "Updated", $type='success');
        }

        public function postReuploadDoc() {
            $request_data = request()->all();
            $requestForm = DB::table('agreement_request')->where('id', $request_data['agreement_request_id'])->get()->first();
            DB::table('agreement_request')
                    ->where('id', $request_data['agreement_request_id'])
                    ->update([
                        'status' => 19
                    ]);
            DB::table('request')
                    ->where('id', $request_data['repoted'])
                    ->where('to_user_id', CRUDBooster::myId())
                    ->update([
                        'repoted' => 1,
                        'responded_at' => date("Y-m-d h:i:s")
					]);
            DB::table('request')->insert([
                'agreement_request_id' => $request_data['agreement_request_id'],
                'from_user_id' => CRUDBooster::myId(),
                'to_user_id' => $requestForm->user_id,
                'remarks' => $request_data['remarks'],
                'status' => 2,
                'opened' => 0,
                'repoted' => 0,
                'privilege_id' => CRUDBooster::myPrivilegeId(),
                'created_at' => date("Y-m-d h:i:s"),
                'responded_at' => date("Y-m-d h:i:s")
                ]);
            ///////Notification
            DB::table('cms_notifications')->insert([
                'id_cms_users' => $requestForm->user_id,
                'content' => $requestForm->ticket_no ."-". $requestForm->vendor_name."-".getStatusByID(19)->status_name,
                'url' => "/admin/agreement_request/view/".$request_data['agreement_request_id'],
                'is_read' => 0,
                'created_at' => date("Y-m-d h:i:s"),
                'updated_at' => date("Y-m-d h:i:s")
            ]);
            return CRUDBooster::redirect(CRUDBooster::adminPath('agreement_request/view/'.$request_data['agreement_request_id']), "Report Sent", $type='success');
        }

	}
