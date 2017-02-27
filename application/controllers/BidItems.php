<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Biditems extends CI_Controller {
 private $param;
 	function __construct(){
 		parent::__construct();
 		$this->load->helper('url');
 	}

 	function index(){
		$data['username'] = $this->session->userdata("username");
		$data['role'] = $this->session->userdata("role");
		$data['name'] = $this->session->userdata("name");
 		$level1no = $this->input->get("family");
 		$level2no = $this->input->get("category");
 		$level3no = $this->input->get("subcategory");
 		$itemfor = $this->input->get("for");
 		if(isset($itemfor))
 			$this->session->set_userdata('itemfor',$itemfor);
 		else
 			$this->session->unset_userdata('itemfor');

 		$item = $this->input->get("name");
 		$data["family"] = ($level1no) ? $this->getFamilyName($level1no) : array();
 		$data["category"] = ($level2no) ? $this->getCategoryName($level2no) : array();
 		$data["subcategory"] = ($level3no) ? $this->getSubCategoryName($level2no) : array();
 		$data["listfamily"] = $this->getListFamily();
 		$data["listcategory"] = $this->getCategoryByFamily();
 		$data["listsubcategory"] = $this->getSubCategory();
 		// $this->session->sess_destroy();

 		// Get Items
 		$id = "{"; 
 		$id .= ($level1no) ? "\"l1\": \"$level1no\"" : ""; 
 		$id .= ($level2no) ? ",\"l2\": \"$level2no\"" : ""; 
 		$id .= ($level3no) ? ",\"l3\": \"$level3no\"" : ""; 
 		$id .= ($item) ? "\"name\": \"$item\"" : ""; 
 		$id .= "}"; 
 		$data["items"] = $this->getItemsForBid($id);

 		$listItemsInCart = $this->session->userdata("cartitems");
 		$data["totalItemCart"] = ($listItemsInCart) ? count($listItemsInCart) : "";

 		$this->load->view('biditems',$data);
 	}



 	function getFamilyName($level1no = ""){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level1";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = "Level1No = '$level1no'";
		$this->param["order"] = "Name1";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}

 	function getCategoryName($level2no = ""){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level2";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = "Level2No = '$level2no'";
		$this->param["order"] = "Name2";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}

 	function getSubCategoryName($level3no = ""){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level3";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = "Level3No = '$level3no'";
		$this->param["order"] = "Name3";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}



 	function getListFamily(){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level1";
 		$this->param["fields"] = "*";
		$this->param["order"] = "Name1";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}

 	function getCategoryByFamily(){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level2";
 		$this->param["fields"] = "*";
		$this->param["order"] = "Name2";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}
 	function getSubCategory(){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "level3";
 		$this->param["fields"] = "*";
		$this->param["order"] = "Name3";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}
 
 	  
 	function getItemsForBid($id){
 		$data = $id; 
 		$data = json_decode($data);
 		$itemfor = $this->session->userdata("itemfor");
 		$itemfor = ($itemfor) ? $itemfor : "";
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "vw_biditems";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = "";
		if(isset($data->l1))
			$this->param["conditions"] .= " Level1No = '$data->l1'";
		if(isset($data->l2))
			$this->param["conditions"] .= " AND Level2No = '$data->l2'";
		if(isset($data->l3))
			$this->param["conditions"] .= " AND Level3No = '$data->l3'";


		if(isset($data->name))
			$this->param["conditions"] .= " Name like '%$data->name%'";
		if($itemfor!="")
			$this->param["conditions"] .= (($this->param["conditions"] != "") ? " AND " : "") ." ItemFor = $itemfor ";

		// $this->param["groups"] = "ItemNo, ItemNoV";
		$this->param["order"] = "Name";
		 
		$result =  $this->query_model->getData($this->param);


		// die($this->db->last_query());
		return $result;
 	}

 	function getBidItemsByID($id){
 	 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "vw_biditems";
 		$this->param["fields"] = "*";
		$this->param["conditions"] = "ID = $id"; 
		$result =  $this->query_model->getData($this->param);
 
		return $result;
 	}

 	function getItems(){
 		$data = $this->input->post("id"); 
		echo json_encode($this->getItemsForBid($data)); 
 	}

 	function getItemVariant($item){ 
 		$this->param = $this->query_model->param; 
 		$this->param["table"] = "itemvariant";
 		$this->param["fields"] = "*";
 		$this->param["conditions"] = "ItemNo = '$item' and Owned = 1 and Price is not null";
		$result = $this->query_model->getData($this->param);
		return $result;
 	}
 	
 	function updateLastBidUsers(){
 		$this->load->helper("responseobject_helper");
 		$responseobject = responseobject();
 		 
 		try{
 			if(!$this->session->userdata("username"))
 				throw new Exception("User not logged in.");

 			$biditemid = $this->input->post("bidid");
	 		$this->param = $this->query_model->param;
	 		$this->param["table"] = "biddingbyusers";
	 		$data["BidItemID"] = $biditemid;
	 		$data["CustomerNo"] = $this->session->userdata("customerno");
	 		$this->param["dataToInsert"] = $data;
	 		$this->param["transactionname"] = $this->session->userdata("name") . " has bid.";
	 		$this->query_model->insertData($this->param); 
	 		$resposeobject["responsitem"] = $this->getBidItemsUpdate($biditemid);

 		}catch (Exception $e){

	 		$resposeobject["errormessage"] = $e->getMessage();

 		}

 		echo json_encode($resposeobject);
 		 
 		
 	}

 	function updateAllLastBidUsers(){ 
		echo json_encode($this->getBidItemsUpdate("","PROGRESS"));

 	}

 	function getBidItemsUpdate($id="",$bidStatus=""){
		$this->param = $this->query_model->param; 
 		$this->param["table"] = "vw_biduserscount";
 		$this->param["fields"] = "*"; 
 		if($id!=""){ 
 			$this->param["conditions"] = "BidItemID = $id";
 		}

 		if($bidStatus!=""){ 
 			$this->param["conditions"] = "BidStatus = '$bidStatus'";
 		}

		$result = $this->query_model->getData($this->param);
		return $result;
 	}

 	// VIEW ITEMS

 	function view(){
		$data['username'] = $this->session->userdata("username");
		$data['role'] = $this->session->userdata("role");
		$data['name'] = $this->session->userdata("name");
 		$item = $this->input->get("id"); 
		$level1no = $this->input->get("family");
 		$level2no = $this->input->get("category");
 		$level3no = $this->input->get("subcategory");
		$data["family"] = ($level1no) ? $this->getFamilyName($level1no) : array();
 		$data["category"] = ($level2no) ? $this->getCategoryName($level2no) : array();
 		$data["subcategory"] = ($level3no) ? $this->getSubCategoryName($level2no) : array();
 		$data["listfamily"] = $this->getListFamily();
 		$data["listcategory"] = $this->getCategoryByFamily();
 		$data["listsubcategory"] = $this->getSubCategory();
 		$listItemsInCart = $this->session->userdata("cartitems");
 		$data["totalItemCart"] = ($listItemsInCart) ? count($listItemsInCart) : "";

 		$data["bidid"] = $item; 
 		$data["items"] = $this->getBidItemsByID($item); 
 		$data['bidusers'] = $this->getBidUsersByID($item);
 		// print_r($data['bidusers']);
 		// die();
 		$this->load->view("viewbiditem", $data);
 	}

 	function generateBidSummary(){
			$this->load->library("GeneratePDF");
			$id = $this->input->get("id");
			$this->param = $this->query_model->param;  
			$this->param["table"] = "vw_biditems"; 
			$this->param["fields"] = "*, 1 `Qty`, CONCAT('Php ', CurrentBidPrice) `BidAmount`";  
			$this->param["conditions"] = "ID = '$id'";  
			$this->param["isArrayReturn"] = true; 
			$result = $this->query_model->getData($this->param);
 	 		
 	 		for($i = 0; $i < count($result);$i++){ 
				$result[$i]["VariantName"] = str_replace("<br/>", "\n", $result[$i]["VariantName"]);  
			}
 		 	
		 	$data["table-title"] =  "BID CODE: <b>" . $result[0]['BidCode'] . "</b>"; 
			$data["title"] =  "Bid Summary"; 


			$data["list"] = $result;
			$columns["Category"] = "Category";
			$columns["Name"] = "Name";
			$columns["VariantName"] = "Description";
			$columns["Qty"] = "Qty";
			$columns["BidAmount"] = "Bid Amount";
			$data["columns"] =  $columns; 

			$content = array();
  
			array_push($content,"\n\n\nTerms and Conditions: \n   Payment: Thirty (30) calendar days after receipt of goods, sales invoice, and warranty certificate.");
			array_push($content,"For goods: \n   Check amount is subject to 1% expanded withholding tax and 5% withholding VAT)");
			array_push($content,"For services: \n   Check amount is subject to 2% expanded withholding tax and 5% withholding VAT)");
			array_push($content,"Price Validity: \n   Thirty (30) calendar days");

			$data["content"] = $content;

			$this->generatepdf->generate($data); 
		}

 	function getBidUsersByID($id){
 		$qry = file_get_contents('sp/getbidusersbyid.txt');  
 		$qry = str_replace("#bidid", $id, $qry);
		$listQry = explode(";", $qry); 
		foreach ($listQry as $strQry) {
			if(strlen(trim($strQry)) > 0) 
				$query = $this->db->query($strQry . ";");
		
		  
			if($strQry == $listQry[count($listQry) - 1]){ 
				return $query->result();   
			}
				 
		}    
 		 
 	}




 

}
