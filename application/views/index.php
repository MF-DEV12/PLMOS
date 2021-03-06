<!DOCTYPE html>
<html>
<head>
    <!-- Include meta tag to ensure proper rendering and touch zooming -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

      
    <title><?=COMPANY_NAME?></title>

    <link rel="stylesheet" type="text/css" href="<?=base_url('css/bootstrap/bootstrap.min.css');?>">
    <link rel="stylesheet" type="text/css" href="<?=base_url('css/datatables/jquery.dataTables.css');?>">
    <link rel="stylesheet" type="text/css" href="<?=base_url('js/tagsinput/bootstrap-tagsinput.css');?>">
    <link rel="stylesheet" href="<?=base_url('css/navside/nav.css');?>"> <!-- Resource style -->
    <link rel="stylesheet" href="<?=base_url('css/rsTable.css');?>"> <!-- Resource style -->
    <link rel="stylesheet" href="<?=base_url('css/style.css');?>"> <!-- Resource style -->
    <link rel="stylesheet" href="<?=base_url('css/admin_navi_style.css');?>"> <!-- Resource style -->
    <link rel="stylesheet" href="<?=base_url('css/stepnavi.css');?>"> <!-- Resource style -->

    <link href="<?=base_url('js/bootstrap-datepicker/css/bootstrap-datetimepicker.css');?>" rel="stylesheet" type="text/css" />
</head>
<body>
    
    <input type="hidden" id="company-title" value="<?=COMPANY_NAME?>">

    <div class='wrapper'> 
     <?php $this->load->view("admin_menu");?> 
          <div class='content isOpen'>
            <div class="header-wrap">
                <span class='button'></span> 
                <span class="content-header"><span>Dashboard</span><subheader></subheader></span>
                 <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:gray;"><span class="glyphicon glyphicon-bell"></span><span class="badge notification-count"><?=((count($notification) > 0) ? count($notification) : "");?></span> </a>
                        <ul class="dropdown-menu" style="width:325px;height:300px;">
                            <li>
                                <div class="navbar-content">
                                    <h5><span class="glyphicon glyphicon-bell"></span> Notifications:</h5>
                                    <div class="row"> 
                                        <div class="col-md-12" align="center">
                                         <dl class="notify-list">
                                             <?php if($notification) { ?>
                                              
                                               
                                                <?php foreach ($notification as $key) { ?> 
                                                   <dd> <a class="notify" data-content="<?=$key->link;?>"> <b><?=$key->total;?></b> <?=$key->notify;?></a></dd> 
                                                <?php } ?>
                                              
                                            
                                             <?php }else {  ?>
                                                <p class="empty">No notifications</p>

                                             <?php } ?>
                                         </dl>
                                        </div> 
                                    </div>
                                </div> 
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:gray;"><span class="glyphicon glyphicon-user"></span></span>
                        <b class="caret"></b></a>
                        <ul class="dropdown-menu" style="width:245px;">
                            <li>
                                <div class="navbar-content">
                                    <div class="row"> 
                                        <div class="col-md-3" align="center">
                                        <span class="glyphicon glyphicon-user" style="font-size:40px;"></span> 
                                        </div>
                                        <div class="col-md-9">
                                            <span><?=$username;?></span>
                                            <p class="text-muted small role"><?=$role;?></p>
                                            <div class="divider">
                                            </div>
                                            <!-- <a href="#" class="btn btn-primary btn-sm active">View Profile</a> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="navbar-footer">
                                    <div class="navbar-footer-content">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <a href="#" class="btn btn-default btn-sm">Change Password</a>
                                            </div>
                                            <div class="col-md-6">
                                                <a href="<?=base_url('login/clearSession');?>" class="btn btn-sm pull-right btn-action">Log Out</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            

            <?php $this->load->view($role);?>
          </div> 
    </div>


    <div class="modal fade" id="editvariantadmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="font-size: 20px;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Edit Variants</h4>
          </div>
          <div class="modal-body">
              <div class="row">
                <div class="col-md-4 image-variant">
                  
                </div> 

                 <div class="col-md-8">
                    <label for="lbl-variant">Variant name:</label>
                    <p id="lbl-variant" style="padding-bottom:25px;"></p>
                    <p id="lbl-srp" style="padding-bottom:25px;">DPO Cost: <span></span></p>
                    <div class="group">
                     <input class="inputMaterial numeric" type="text" id="txt-editPriceAdmin" required>
                      <span class="highlight"></span>
                      <span class="bar"></span>
                      <label class="formlabel">Unit Price:</label>
                    </div> 
                    <div class="group">
                     <input class="inputMaterial quantity" type="text" id="txt-editLowstockAdmin" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required>
                      <span class="highlight"></span>
                      <span class="bar"></span>
                      <label class="formlabel">Low stock level:</label>
                    </div> 
                    <div class="group">
                     <input class="inputMaterial quantity" type="text" id="txt-editCriticalAdmin" onkeypress='return event.charCode >= 48 && event.charCode <= 57' required>
                      <span class="highlight"></span>
                      <span class="bar"></span>
                      <label class="formlabel">Critical level:</label>
                    </div> 
     
                    <p class="label-error"></p>
                </div> 
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-action" id="btn-saveeditvariantsadmin">Save</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="addUOM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Add UOM</h4>
          </div>
          <div class="modal-body">
              <div class="uom-wrap">
                <div class="group">
                  <input class="inputMaterial" type="text" id="txt-uomcode" required />
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label class="formlabel">UOM Code:</label>
                </div> 

                <div class="group">      
                  <input class="inputMaterial" type="text" id="txt-uomdesc" required/>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <label class="formlabel">Description:</label>
                </div> 
              </div> 
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-action" onclick="saveUOM();" id="btn-saveuom">Save</button>
          </div>
        </div>
      </div>
    </div>


 
<div class="modal fade" id="attributesetup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="font-size: 20px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create new Variants</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-5 image-variant-wrap" align="center">
            <div class="image-holder">
              <span class="glyphicon glyphicon-picture upload-file"></span> 
            </div>
            <button class="btn btn-action upload">Upload image</button> 
            <input type="file" class="file-upload" style="display: none;"  accept="image/x-png,image/gif,image/jpeg" >
          </div> 

          <div class="col-md-7">
            <table width="100%" id="table-attribute-setup" class="display table-custom" style="margin-top:10px;"> 
                <thead> 
                    <tr>
                        <td width="200px">Attribute</td>
                        <td>Options</td> 
                    </tr> 
                </thead>
                <tbody style="height:225px;">
                   
                </tbody>
                
            </table> 

          </div>

        </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-action" id="btn-saveattributesetup">Save</button>
      </div>
    </div>
  </div>
</div>
 





    <script type="text/javascript" src='<?=base_url("js/jquery/jquery-1.11.3.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/jquery/jquery-ui.js")?>'></script> 
    <script type="text/javascript" src='<?=base_url("js/datatables/jquery.dataTables.min.js")?>'></script> 
    <script type="text/javascript" src='<?=base_url("js/datatables/datatables-rowsgroup.js")?>'></script> 
    <script type="text/javascript" src='<?=base_url("js/bootstrap/bootstrap.min.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/bootbox.min.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/utility/ajaxCall.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/utility/helpers.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/maskMoney.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/highcharts.js")?>'></script>
    <script type="text/javascript" src='<?=base_url("js/tagsinput/bootstrap-tagsinput.js")?>'></script>
    <script src="<?=base_url('js/scripts/admin.js');?>"></script>   
    <script src="<?=base_url('js/navside/main.js');?>"></script>   

 
</body>
    
</html>         