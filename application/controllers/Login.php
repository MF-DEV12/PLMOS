<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
 private $param;
 	function __construct(){
 		parent::__construct();
 		// if($this->session->userdata("username"))
 		// 	redirect("/main"); 
 		$this->param = $this->param = $this->query_model->param; 
 		$this->param["table"] = "accounts";
 	}

 	function index(){
 		$this->load->view('login_new');
 	}

	function validateUser(){
		$username = $this->input->post("username");
		$password = $this->input->post("password");
		$password = MD5($password);
		$this->param["fields"] = "*";
		$this->param["conditions"] = " Username = '$username' AND `Password` = '$password'";
		$result = $this->query_model->getData($this->param);
		// $this->session->set_flashdata('error', $this->db->last_query()); // debug purpose
		if($result){
			$data["username"] = $result[0]->Username;
			$data["name"] = $result[0]->FirstName;
			
			$data["email"] = $result[0]->Username;
			$data["role"] = $result[0]->LoginType;
			if($data["role"] == "supplier")
				$data["supplierno"] = $this->getSupplierNoByAccountNo($result[0]->AccountNo);
			if($data["role"] == "customer"){
				$customerdata =  $this->getCustomerNoByEmail($result[0]->Username);
				 
				$data["customerno"] = $customerdata->CustomerNo;
				$data["bidname"] = substr($customerdata->Firstname, 0, 1) . '.' . $customerdata->Lastname;
			}
			$this->session->set_userdata($data); 
			if($data["role"] != "customer")
				redirect("/main");
			else{
				if($this->input->get("t"))
					redirect("/items/checkout");
				else
					redirect("");
			}
		}
		else
			$this->session->set_flashdata('error', "Username and password did not match.");
			redirect("login");
	}

	function signUp(){
		$this->load->library("Email_Lib");
		$this->load->helper("responseobject_helper");
		$responseobject = responseobject();

		try{
			$data = $this->input->post("data");
			$data = json_decode($data);

			//Insert Customer
			$this->param = $this->query_model->param; 
			$this->param["table"] = "customer";
			$this->param["dataToInsert"] = $data;
			$this->param["transactionname"] = "New customer";
			$this->query_model->insertData($this->param);

			//Insert Account
			$this->param = $this->query_model->param; 
			$this->param["table"] = "accounts";
			$account["Username"] = $data->Email;
			$account["LastName"] = $data->LastName;
			$account["FirstName"] =$data->FirstName;
			$account["Password"] = md5($data->Password);
			$account["LoginType"] = 'customer'; 
			$this->param["dataToInsert"] = $account;
			$this->query_model->insertData($this->param);


			$edata["firstname"] = $account["FirstName"];
			$edata["email"] = $account["Username"];
			$edata["password"] = $data->Password;
			$edata["companyname"] = COMPANY_NAME;
 			
			// $this->email_lib->sendAccount($edata);

			$responseobject["responseitem"] = "Success";

		}catch(Exception $err){

			$responseobject["errormessage"] =  $err->message;
		}

		echo json_encode($responseobject);
		

	}

	function clearSession(){

		$this->session->sess_destroy();
		redirect("/login");
	}


	function logOut(){

		$this->session->sess_destroy();
		redirect("");
	}
	

	function getSupplierNoByAccountNo($accountNo){
		$this->param = $this->param = $this->query_model->param; 
 		$this->param["table"] = "supplier";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = " AccountNo = '$accountNo'";
		$result = $this->query_model->getData($this->param);
		return $result[0]->SupplierNo;
	}

	function getCustomerNoByEmail($email){
		$this->param = $this->param = $this->query_model->param; 
 		$this->param["table"] = "customer";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = " Email = '$email'";
		$result = $this->query_model->getData($this->param);

		return $result[0];
	}
	 
}
