<!DOCTYPE html>
<html>
<head>
    <!-- Include meta tag to ensure proper rendering and touch zooming -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

      
    <title>View item - <?=COMPANY_NAME;?></title>


    <link href="<?=base_url('css/homestyle/bootstrap.min.css');?>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?=base_url('css/datatables/jquery.dataTables.css');?>">
    <link href="<?=base_url('css/homestyle/animate.min.css');?>"  rel="stylesheet"> 
    <link href="<?=base_url('css/homestyle/font-awesome.min.css');?>" rel="stylesheet">
    <link href="<?=base_url('css/homestyle/lightbox.css');?>" rel="stylesheet">
    <link href="<?=base_url('css/homestyle/main.css');?>"  rel="stylesheet">
    <link href="<?=base_url('css/treeview-style.css');?>"  rel="stylesheet">
    <link rel="stylesheet" href="<?=base_url('css/category_menu.css');?>">  
    <link id="css-preset" href="<?=base_url('css/homestyle/presets/preset1.css');?>"  rel="stylesheet">
    <link href="<?=base_url('css/homestyle/responsive.css');?>"  rel="stylesheet">

   
</head>
<body>
<?php $this->load->view("category_menu");?>

<div id="main">
    <div class="preloader"> <i class="fa fa-circle-o-notch fa-spin"></i></div>
     <?php $this->load->view("header_home");?>
 

 

<section id="orders" style="padding: 0px">
    <?php $items = $items[0];?>
    <div class="container" style="height: 700px;">
      <div class="row">
        <div class="col-sm-12 col-md-5">
          <h3 style="margin-bottom: 0px;"><?=$items->Name;?></h3>
          <ol class="breadcrumb item-category">
            <li class="breadcrumb-item"><?=$items->Name1?></li>  
            <?php if($items->Name2) { ?> 
              <li class="breadcrumb-item"><?=$items->Name2?></li>  
            <?php } ?> 
            <?php if($items->Name3) { ?> 
              <li class="breadcrumb-item"><?=$items->Name3?></li>  
            <?php } ?> 
           
          </ol>
          <div align="center" style="padding: 35px;">
            <img id="item-image" src="<?=base_url('images/variant-folder/'. $items->ImageFile);?>" alt="" height="70%" width="90%">
            
          </div>
        </div>
        <div class="col-sm-12 col-md-7" style="padding-top: 32px;">
          <h5>Item Specification:</h5>
          <dl id="items-specs">
            <dd style="border-bottom: 1px solid #ddd;">
              <a class="btn btn-action pull-right" target="_blank" href="<?=base_url('biditems/generateBidSummary?id='.$bidid)?>"><i class="fa fa-print" aria-hidden="true"></i> Print Bid</a><br/>
              <ul class="variantname">
                 <?php $variantname = json_decode($items->VariantNameJSON);?>
                 <?php foreach($variantname as $key => $value){ ?> 
                  <li><?=$key?> : <?=$value;?></li>
                 <?php } ?> 
              </ul>

            </dd>
             
            <dd>
              <span class="pull-right">Status: <span class="label <?=($items->BidStatus == "PROGRESS") ? "label-danger" : "label-default"?>"><?=$items->BidStatus?></span></span>
              <h4>Bid History:</h4>
              <div style="height:500px;overflow-y: auto;">
                  <table class="table">
                  <thead>
                    <tr>
                    <th>Name</th>
                    <th>Bid Price</th>
                    </tr>
                  </thead>
                  <tbody >
                    <?php foreach($bidusers as $key) { ?>
                    <tr <?=($this->session->userdata('bidname') == $key->BidUsername) ? "class=\"curbiduser\"" : "" ?>>
                      <td>
                        <span><strong><i class="fa fa-user-circle-o" aria-hidden="true"></i> <?=$key->BidUsername?></strong></span><br/>
                        <span style="font-size: 11px;"><i class="fa fa-clock-o" aria-hidden="true"></i> <?=date('M d Y h:i:s A', strtotime($key->CreatedDate))?></span>
                      </td>
                      <td><span>&#8369; <?=$key->price?></span> </td>
                    </tr>
                    <?php } ?> 
                    
                  </tbody>
                  </table>
              </div>
            </dd>
          </dl> 
        </div>
      </div>
    </div>
   
 
    <div id="portfolio-single-wrap">
      <div id="portfolio-single">
      </div>
    </div> 
</section>  

 

<footer id="footer">
    <div class="footer-top wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
      <div class="container text-center">
        <!-- <div class="footer-logo">
          <a href="index.html"><img class="img-responsive" src="images/logo.png" alt=""></a>
        </div> -->
        <div class="social-icons">
          <ul>
            <li><a class="envelope" href="#"><i class="fa fa-envelope"></i></a></li>
            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li> 
            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a class="tumblr" href="#"><i class="fa fa-tumblr-square"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <p>&copy; 2017  <?=COMPANY_NAME;?></p>
          </div>
          <div class="col-sm-6">
          </div>
        </div>
      </div>
    </div>
</footer>

 <div class="modal fade" id="confirmcart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="font-size: 20px;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          
          <div class="modal-body">
              <h4 style="color:#048e81;"><span class="glyphicon glyphicon-ok"></span> This item has been added to your cart.</h4>
              <div class="row">
                <div class="col-xs-12 col-md-6 item-wrap">
                    <div class="row">
                        <div class="col-xs-5 col-md-5">
                          <img src="<?=base_url('');?>" class="cart-img" width="80px" height="80px"/>
                        </div>
                        <div class="col-xs-7 col-md-7">
                          <h4><name></name></h4>
                          <h6><category></category></h6>
                          <h5>&#8369; <price></price></h5>
                        </div>
                    </div>
                </div> 

                <div class="col-xs-12 col-md-6" style="border-left: 1px solid #ddd; padding-top: 10px;">
                    <h5>My Shopping Cart <a href="<?=base_url('items/cart')?>" title="Click to view your cart"><carttotal></carttotal> item(s)</a> </h5>
                    <dl style="font-size: 12px;">
                      <dd style="padding: 10px 2px; border-bottom: 1px solid #ddd; border-top: 1px solid #ddd;">
                        Subtotal: <span class="pull-right">&#8369; <subtotal></subtotal></span>
                      </dd>

                      <dd style="padding: 4px 2px; font-size: 14px !important;">
                        Total: <span class="pull-right">&#8369; <b><total></total></b></span>
                      </dd>

                    </dl>
                </div> 
              </div>
          </div>
          <div class="modal-footer">
            <a type="button" class="btn btn-default" data-dismiss="modal">Continue to Shopping</a>
            <button type="button" class="btn btn-action" id="btn-proceed">Proceed to Checkout</button>
          </div>
        </div>
      </div>
    </div>
</div>
      <script type="text/javascript" src="<?=base_url("js/homestyle/jquery.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/bootstrap.min.js")?>"></script>
      <script type="text/javascript" src='<?=base_url("js/utility/ajaxCall.js")?>'></script>
      <script type="text/javascript" src='<?=base_url("js/maskMoney.js")?>'></script>
      <script type="text/javascript" src='<?=base_url("js/utility/helpers.js")?>'></script>
 
      <script type="text/javascript" src="<?=base_url("js/homestyle/jquery.inview.min.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/wow.min.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/mousescroll.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/smoothscroll.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/jquery.countTo.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/lightbox.min.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/homestyle/main.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/side-menu/side-menu.js")?>"></script>
      <script type="text/javascript" src="<?=base_url("js/customerorder.js")?>"></script>

    
 
     
</body>
    
</html> 