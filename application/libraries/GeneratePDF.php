<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class GeneratePDF{
    
	function Generate($data){ 
		 
		$this->ci = & get_instance();
  		$pdf = $this->ci;
	    $pdf->load->library('cezpdf');
		$pdf->load->helper('pdf');


		$pdf->cezpdf->ezText($data["title"], 15, array('justification' => 'right'));

		$pdf->cezpdf->ezText(COMPANY_NAME, 15, array('justification' => 'left'));

	    $pdf->cezpdf->ezSetDy(-0);
	    $content = "Legacy Building, 118 Tunasan National Road, Muntinlupa, 1773 \n";
	    $content .= "(02) 861-8286, (02) 986-7372, Globe: 0927-3098165 \n";

	    $pdf->cezpdf->ezText($content, 10, array('justification' => 'left'));
	    $pdf->cezpdf->ezImage(base_url('images/watermark.jpg'), 0, 500, 'none', 'center','');
		
		prep_pdf(); // creates the footer for the document we are creating.
 		
		if(array_key_exists('list', $data))
			$pdf->cezpdf->ezTable($data["list"], $data["columns"], $data["table-title"], array('width'=>550));
		
		if(array_key_exists('content', $data)){
			foreach ($data["content"] as $key) {
				$key = str_replace("<br/>", "\n", $key);
				$pdf->cezpdf->ezText($key, 11, array('justification' => 'left')); 
			}
		}

		 

		if(isset($data["footer"])){
			$pdf->cezpdf->ezSetDy(-20);
			$pdf->cezpdf->ezText(COMPANY_NAME, 13, array('justification' => 'right'));
		}
	    	

		$pdf->cezpdf->ezStream();
	} 

 
	 


}
 

