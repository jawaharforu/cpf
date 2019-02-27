<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;

	class AdminPcaMappingController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = false;
			$this->button_show = false;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "pca_mapping";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Agreement","name"=>"agreement_id","join"=>"agreement,agreement_name"];
			$this->col[] = ["label"=>"PCA","name"=>"pca_id","join"=>"pca,pca_name"];
			$this->col[] = ["label"=>"No.of Verifiers","name"=>"verify"];
            $this->col[] = ["label"=>"Verifier Name","name"=>"verifier_user_id", "callback"=>function($row) {
                $user = DB::table('cms_users')->whereIn('id', explode(",",$row->verifier_user_id))->orderByRaw('FIELD(id,'.$row->verifier_user_id.')')->get()->all();
                $a = array();
                foreach($user as $u) {
                    $a[] = $u->name;
                }
                return implode(",",$a);
            }];
            $this->col[] = ["label"=>"No.of Approvers","name"=>"approval"];
			$this->col[] = ["label"=>"Approver Name","name"=>"approver_user_id", "callback"=>function($row) {
                $user = DB::table('cms_users')->whereIn('id', explode(",",$row->approver_user_id))->orderByRaw('FIELD(id,'.$row->approver_user_id.')')->get()->all();
                $a = array();
                foreach($user as $u) {
                    $a[] = $u->name;
                }
                return implode(",",$a);
            }];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Agreement','name'=>'agreement_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'agreement,agreement_name'];
			$this->form[] = ['label'=>'Pca Id','name'=>'pca_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'pca,pca_name'];
			$this->form[] = ['label'=>'Verify','name'=>'verify','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Approval','name'=>'approval','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'User Id','name'=>'user_id','type'=>'select2','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10','datatable'=>'user,id'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ["label"=>"Agreement Id","name"=>"agreement_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"agreement,agreement_name"];
			//$this->form[] = ["label"=>"Pca Id","name"=>"pca_id","type"=>"select2","required"=>TRUE,"validation"=>"required|integer|min:0","datatable"=>"pca,pca_name"];
			//$this->form[] = ["label"=>"Verify","name"=>"verify","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"Approval","name"=>"approval","type"=>"number","required"=>TRUE,"validation"=>"required|integer|min:0"];
			//$this->form[] = ["label"=>"User Id","name"=>"user_id","type"=>"select2","required"=>TRUE,"validation"=>"required|string|min:5|max:5000","datatable"=>"user,id"];
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



        //By the way, you can still create your own method in here... :)
        public function getAdd() {
            $data = [];
            $data['page_title'] = "PCA Mapping";
            $data['agreement'] = DB::table('agreement')->get()->all();
            $data['pca'] = DB::table('pca')->get()->all();
            $this->cbView('forms.pca_mapping',$data);
        }

        public function postAdd() {
            $result = request()->all();
            if (empty($result['agreement_id']) || !isset($result['agreement_id'])) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('pca_mapping/add'), "Select Agreement", $type='danger');
            } else if (!isset($result['pca_id']) || empty($result['pca_id'])) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select PCA", $type='danger');
            } else if (!isset($result['user_id'][7]) || count($result['user_id'][7]) == 0) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select Verifier", $type='danger');
            } else if (!isset($result['user_id'][8]) || count($result['user_id'][8]) == 0) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select Approver", $type='danger');
            } else {
                $data[] = [
                    'agreement_id' => $result['agreement_id'],
                    'pca_id' => $result['pca_id'],
                    'verify' => $result['verifier'],
                    'approval' => $result['approver'],
                    'verifier_user_id' => implode(",",$result['user_id'][7]),
                    'approver_user_id' => implode(",",$result['user_id'][8]),
                    'created_at' => date("Y-m-d h:i:s"),
                    'updated_at' => date("Y-m-d h:i:s")
                ];
                DB::table('pca_mapping')->insert($data);
                return CRUDBooster::redirect(CRUDBooster::adminPath('pca_mapping'), "New PCA mapping added", $type='success');
            }
        }

        public function getEdit($id) {
            $data = [];
            $data['page_title'] = "PCA Mapping";
            $data['agreement'] = DB::table('agreement')->get()->all();
            $data['pca'] = DB::table('pca')->get()->all();
            $data['agreementspca'] = DB::table('pca_mapping')->where('id',$id)->get()->first();
            $this->cbView('forms.pca_mapping',$data);

        }

        public function postEdit($id) {
            $result = request()->all();
            if (empty($result['agreement_id']) || !isset($result['agreement_id'])) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('pca_mapping/add'), "Select Agreement", $type='danger');
            } else if (!isset($result['pca_id']) || empty($result['pca_id'])) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select PCA", $type='danger');
            } else if (!isset($result['user_id'][7]) || count($result['user_id'][7]) == 0) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select Verifier", $type='danger');
            } else if (!isset($result['user_id'][8]) || count($result['user_id'][8]) == 0) {
                return CRUDBooster::redirect(CRUDBooster::adminPath('agreement/add'), "Select Approver", $type='danger');
            } else {
                $data = [
                    'agreement_id' => $result['agreement_id'],
                    'pca_id' => $result['pca_id'],
                    'verify' => $result['verifier'],
                    'approval' => $result['approver'],
                    'verifier_user_id' => implode(",",$result['user_id'][7]),
                    'approver_user_id' => implode(",",$result['user_id'][8]),
                    'updated_at' => date("Y-m-d h:i:s")
                ];
                DB::table('pca_mapping')->where('id', $id)->update($data);
                return CRUDBooster::redirect(CRUDBooster::adminPath('pca_mapping'), "PCA mapping Updated", $type='success');
            }
        }


	}
