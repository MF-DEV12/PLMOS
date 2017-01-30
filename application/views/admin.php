 <div class="content-group show" data-group="purchaseorder">
                <?php $this->load->view("dashboard");?> 
                <div class="content-list" data-content="purchaseorder">
                    <!-- <h5 class="dash-header"><span class="glyphicon glyphicon-stats"></span> Purchase Orders <subheader></subheader></h5>  -->
                    <button id="btn-addrequest" class="btn btn-action main-button btn-action-right"><span class="glyphicon glyphicon-plus"></span> Create Request</button>
                    <div class="btn-group btn-child-group btn-group-mode btn-action-right">
                        <button id="btn-pocancel" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span> Cancel</button>
                        <button id="btn-poreset" class="btn btn-default"><span class="glyphicon glyphicon-refresh"></span> Reset</button>
                        <button id="btn-posubmit" class="btn btn-action"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                    </div>
                    <table class="display main-table" data-table="purchaseorder"> </table>
                    <div class="content-child">

                        <div class="col-md-5 polistsupplier-wrap"> 
                            <div class="polistsupplier-holder">
                                <select id="polistsupplier" class="form-control">
                                    <option value="" disabled selected>Select a Supplier</option>
                                    <?php foreach($suppliers["list"] as $po){ ?>
                                        <option value="<?=$po->SupplierNo;?>"><?=$po->SupplierName;?></option>
                                    <?php }?>
                                </select>
                            </div>
                           
                            <table class="display" data-table="pobysupplier"></table>
                            <table class="display" data-table="lowstockbysupplier"></table>
                         </div>

                         <div class="col-md-7 posubmit-wrap"> 
                            <table class="display" data-table="posubmit" >
                              
                             
                            </table>
                            <p><totalpo>0.00</totalpo></p>
                         </div>

                    </div>
                </div>
                 <div class="content-list" data-content="additems">
              <div class="col-md-12" style="font-size: 14px;">
                  <div class="btn-group main-button btn-group-mode btn-action-right">
                    <button id="btn-backitems" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span> Cancel</button>
                    <button id="btn-submititemvariant" class="btn btn-action"><span class="glyphicon glyphicon-ok-circle"></span> Save items with variant</button>
                  </div> 
                  <div class="group-1" style="padding-top:10px;">
                    <ul class="stepNav threeWide">
                      <li class="selected" data-view="item-info"><a href="#" title="">Information</a></li>
                      <li data-view="item-variants"><a href="#" title="" >Variants</a></li>
                      <li data-view="item-review"><a href="#" title="">Review</a></li>
                    </ul>
                    <div class="step-holder">
                      <div class="step-view col-md-12 show" data-view="item-info" align="center">

                          <table class="display form-table" width="80%" style="margin-top: 20px;">
                                  <tr>
                                      <td>
                                          <div class="group">      
                                            <input class="inputMaterial required" type="text" id="txt-itemname" required>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Item name:</label>
                                          </div> 
                                      </td>
                                      <td>
                                          <div class="group">
                                            <select class="inputMaterial required" id="list-family" required>  
                                               <option value="" selected disabled=""></option>
                                               <?php foreach($listfamily as $row){ ?>
                                                  <option value="<?=$row->id;?>"><?=$row->Name;?></option>
                                               <?php }?>
                                            </select>  
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Family:</label>
                                          </div>
                                      </td> 
                                  </tr>
                                  <tr>
                                      <td>
                                          <div class="group">   
                                            <select class="inputMaterial required" id="list-uom" required>  
                                               <option value="" selected disabled=""></option>
                                               <?php foreach($listuom as $row){ ?>
                                                  <option value="<?=$row->UOMCode;?>"><?=$row->Description . " (". $row->UOMCode .")";?></option>
                                               <?php }?>
                                            </select><span class="pull-right"><a style="cursor:pointer;color:#172052!important;" data-toggle="modal" data-target="#addUOM"><span class="glyphicon glyphicon-plus"></span> Add UOM</a></span>     
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Unit of measure (UOM):</label>
                                          </div> 
                                      </td>
                                      <td>
                                          <div class="group">
                                            <select class="inputMaterial" id="list-category" required> 
                                               <option value="" selected disabled=""></option> 
                                            </select>       
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Category:</label>
                                          </div>
                                      </td>  
                                  </tr>
                                  <tr>
                                      <td>
                                          <div class="group">
                                            <select class="inputMaterial required" id="list-itemfor" required>  
                                               <option value="" selected disabled=""></option>
                                               <option value="1">Customer</option>
                                               <option value="2">Supplier</option>
                                               <option value="0">All</option>
                                            </select>  
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Item for:</label>
                                          </div>
                                      </td>
                                       <td>
                                          <div class="group"> 
                                            <select class="inputMaterial" id="list-subcategory" required>  
                                               <option value="" selected disabled=""></option>
                                            </select>      
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="formlabel">Subcategory:</label>
                                          </div>
                                      </td>  
                                  </tr>
                                  
                                   
                          </table>
                        
                      </div>
                      <div class="step-view col-md-12" data-view="item-variants">
                        <div class="col-md-5" style="background: white;    border: 1px solid #ddd;">
                          <div class="variant-wrap">
                             <!-- <label>Multiple items?</label> 
                              <div class="checkbox"> 
                                <label><input type="checkbox"  id="chkIsMultiple" value="">Create Attributes and Options</label>
                              </div>  -->
                              <div>
                              <span>Create Attribute and Options for the variant:</span>
                                 <table width="100%" id="table-attribute" class="display table-custom" > 
                                    <thead> 
                                        <tr>
                                            <td width="200px">Attribute</td>
                                            <td>Options</td>
                                            <td></td>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                       
                                    </tbody>
                                    <tfoot>
                                      <tr>
                                          <td colspan="3">
                                              <span id="addattribute" class="pull-right"><span class="glyphicon glyphicon-plus"></span> Add more attribute</span>

                                          </td>
                                      </tr>
                                    </tfoot>
                                    
                                </table> 
                              </div> 
                              <!-- <button class="btn btn-action" id="btn-itemvariantgenerate">Generate Item with Variant</button>  -->
                            </div>
                        </div>
                        <div class="col-lg-7">
                           <button id="btn-itemvariantadd" class="btn btn-default pull-left" style="margin-bottom: 10px;"><span class="glyphicon glyphicon-plus"></span> Add items</button>

                          <table class="display main-table" data-table="listitemvariant" ></table> 
                        </div> 
                      </div>
                      <div class="step-view col-md-12" data-view="item-review">
                          <div class="col-md-12 item-review-wrap">
                            <div class="group"> 
                              <input type="text" class="inputMaterial display" id="lbl-itemname" readonly/>    
                              <span class="highlight"></span>
                              <span class="bar"></span>
                              <label class="formlabel display">Item Name:</label>
                            </div>
                             <div class="group"> 
                              <input type="text" class="inputMaterial display" id="lbl-uom" readonly/>    
                              <span class="highlight"></span>
                              <span class="bar"></span>
                              <label class="formlabel display">Unit of Measure (UOM):</label>
                            </div>
                             <div class="group"> 
                              <input type="text" class="inputMaterial display" id="lbl-category" readonly/>    
                              <span class="highlight"></span>
                              <span class="bar"></span>
                              <label class="formlabel display">Category:</label>
                            </div>
                          </div>
                         

                          <table class="display main-table" data-table="listitemvariantreview" ></table> 

                      </div>
                    </div>



                  </div>
    
              </div> 
               
          </div> 

                <div class="content-list" data-content="receivings">
                    <button id="btn-directreceive" class="btn main-button btn-action btn-action-right"><span class="glyphicon glyphicon-arrow-right"></span> Direct Receive</button>
                    <div class="btn-group btn-child-group btn-group-mode btn-action-right">
                        <button id="btn-receivecancel" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span> Cancel</button>
                        <button id="btn-receivesubmit" class="btn btn-action"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                    </div>
                    <table class="display main-table" data-table="receivings"> </table>
                    
                    <div class="content-child">
                        <div class="row">
                             <div class="col-md-6"> 
                                <table class="display main-table" data-table="porequest" ></table>
                               
                             </div>

                             <div class="col-md-6"> 
                                <table class="display main-table" data-table="poreceivesubmit" ></table>
                             </div>
                         </div> 
                    </div>
                </div>

                <div class="content-list" data-content="backorders">
                    <!-- <button id="" class="btn btn-action btn-action-right"><span class="glyphicon glyphicon-send"></span> Send Notification</button> -->
                    <table class="display main-table" data-table="backorders"> </table>
                </div>

                <div class="content-list" data-content="suppliers">
                    <button id="btn-addsupplier" class="btn btn-action main-button btn-action-right"><span class="glyphicon glyphicon-plus"></span> New Supplier</button>
                    <div class="btn-group btn-child-group btn-group-mode btn-action-right">
                        <button id="btn-suppliercancel" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span> Cancel</button>
                        <button id="btn-suppliersubmit" class="btn btn-action"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                    </div>
                    <div class="btn-group btn-child-group btn-group-mode btn-action-right" style="z-index: 9;">
                        <button id="btn-supplierback" class="btn btn-default"><span class="glyphicon glyphicon-menu-left"></span> Back</button> 
                    </div>
                    <table class="display main-table" data-table="suppliers"> </table>

                    <div class="content-child">
                        <div class="row group-1">
                             <div class="col-lg-12"> 
                                <table class="display form-table" width="500px">
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="text" name="SupplierName" id="txt-suppliername" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Supplier name:</label>
                                            </div>

                                            <!-- <label for="txt-suppliername">Supplier name:</label>
                                            <input type="text" name="SupplierName" id="txt-suppliername" class="form-control"> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="text"  name="Address" id="txt-address" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Address:</label>
                                            </div>

                                            <!-- <label for="txt-address">Address:</label>
                                            <input type="text" name="Address" id="txt-address" class="form-control"> -->
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="text" name="ContactNo" id="txt-contact" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Contact:</label>
                                            </div>
                                            <!-- <label for="txt-contact">Contact:</label>
                                            <input type="text" name="ContactNo" id="txt-contact" class="form-control"> -->
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="text" name="Email" id="txt-email" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Email Address:</label>
                                            </div>
                                            <!-- <label for="txt-email">Email Address:</label>
                                            <input type="text" name="Email" id="txt-email" class="form-control"> -->
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="text" name="Username" id="txt-username" required> 
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Username:</label>
                                            </div><!-- 
                                            <label for="txt-username">Username:</label>
                                            <input type="text" name="Username" id="txt-username" class="form-control"> -->
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="password" name="Password" id="txt-password" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Password:</label>
                                            </div><!-- 
                                            <label for="txt-Password">Password:</label>
                                            <input type="password" name="Password" id="txt-password" class="form-control"> -->
                                        </td>  
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="group">      
                                              <input class="inputMaterial" type="password" id="txt-confirmpassword" required>
                                              <span class="highlight"></span>
                                              <span class="bar"></span>
                                              <label class="formlabel">Confirm Password:</label>
                                            </div>
                                            <!-- <label for="txt-confirmpassword">Confirm Password:</label>
                                            <input type="password" id="txt-confirmpassword" class="form-control"> -->
                                        </td> 
                                        
                                    </tr> 
                                </table>
                             </div>
     
                         </div> 
                          <div class="group-2">
                             <div class="col-lg-12"> 
                                <div>
                                    <h3 id="label-suppliername"></h3> 
                                    <table width="100%" id="table-suppliersinfo">
                                        <tr>
                                            <td>Address:</td>
                                            <td id="label-address"></td>
                                        </tr>
                                         <tr>
                                            <td>Contact #:</td>
                                            <td id="label-contact"></td>
                                        </tr>
                                         <tr>
                                            <td>Email Address:</td>
                                            <td id="label-email"></td>
                                        </tr>
                                    </table> 
                                </div>
                                <div class="padding"></div>
                                <table class="display main-table" data-table="listsupplybysupplier" ></table> 
                             </div>
     
                         </div> 
                    </div>

                </div>
 
                <div class="content-list" data-content="inventory">
                    <!-- <button id="" class="btn btn-action btn-action-right"><span class="glyphicon glyphicon-plus"></span> Physical Count</button> -->
                    <button class="btn btn-action main-button btn-action-right  btn-print" data-print="generateListInventory"><span class="glyphicon glyphicon-print"></span> Print</button>
                    <table class="display main-table" data-table="inventory"> </table>
                </div>

                <div class="content-list" data-content="items">
                    <!-- <button id="direct-receive" class="btn btn-action main-button btn-action-right"><span class="glyphicon glyphicon-arrow-plus"></span> Add Item</button> -->
                    <div class="btn-group btn-child-group btn-group-mode btn-action-right">
                        <button id="btn-itemscancel" class="btn btn-default"><span class="glyphicon glyphicon-ban-circle"></span> Cancel</button>
                        <button id="btn-submititemvariant" class="btn btn-action"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                    </div>
                    <table class="display main-table" data-table="items"> </table>
                     

                </div>

                <div class="content-list" data-content="lowstocks">
                    <table class="display main-table" data-table="lowstocks"> </table>
                </div>
                <div class="content-list" data-content="categories">
                    <!-- <button id="btn-addfamily" class="btn btn-action main-button btn-action-right"><span class="glyphicon glyphicon-plus"></span> Add Family</button>  -->
                    <!-- <table class="display main-table" data-table="categories"></table> -->
                    <div class="col-md-12" align="center"> 
                        <dl class="categories-wrap">
                            <dd>
                                 <h5 class="dash-header sub2">Family <span class="pull-right add"><span class="glyphicon glyphicon-plus"></span> Add</span></h5>
                                 <dl class="list-family dd-categories" data-section="level1">
                                    <?php foreach($listfamily as $row){ ?>
                                        <dd data-id="<?=$row->id;?>">
                                          <div class="row">
                                            <div class="col-sm-5" align="center">
                                              <div class="image-holder">
                                               <?php $image = base_url('images/variant-folder/' . $row->ImageFile);?>

                                                <img src="<?=$image;?>" onerror="this.src='<?=base_url('images/noimage.gif');?>';"/>
                                              </div>
                                              <button class="btn btn-action upload">Upload image</button> 
                                              <input type="file" data-col="Level1No" data-id="<?=$row->id;?>" data-table="level1" class="file-upload" style="display: none;">
                                            </div> 
                                            <div class="col-sm-7"> 
                                              <span class="data-edit" ><?=$row->Name;?></span>
                                              <span class="action pull-right"><a class="edit">Edit</a> | <a class="delete">Delete</a></span>
                                            </div> 
                                          </div> 
                                        </dd>
                                    <?php } ?> 
                                 </dl>
                            </dd>
                            <dd>
                                 <h5 class="dash-header sub2">Category <span class="pull-right add"><span class="glyphicon glyphicon-plus"></span> Add</span></h5>
                                 <dl class="list-categories dd-categories" data-section="level2">
                                     
                                 </dl>
                            </dd>
                            <dd>
                                 <h5 class="dash-header sub2">Sub-Category <span class="pull-right add"><span class="glyphicon glyphicon-plus"></span> Add</span></h5>
                                 <dl class="list-subcategories dd-categories" data-section="level3">
                                      
                                 </dl>
                            </dd>

                        </dl>
                    </div>
                       
                </div>
                <div class="content-list" data-content="removeditems"> 
                    <table class="display main-table" data-table="removeditems"> </table> 
                </div>
        
                <div class="content-list" data-content="rptitems"> 
                    <button class="btn btn-action main-button btn-action-right btn-print" data-print="generateListItems"><span class="glyphicon glyphicon-print"></span> Print</button>
                    <table class="display main-table" data-table="rptitems"> </table>
                </div>
                <div class="content-list" data-content="rptcustomers"> 
                    <button class="btn btn-action main-button btn-action-right  btn-print" data-print="generateListSupplier"><span class="glyphicon glyphicon-print"></span> Print</button>
                    <table class="display main-table" data-table="rptcustomers"> </table>
                </div>


                <div class="content-list" data-content="allorders">

                     <div class="orderstatus-wrap">
                         <label>Order Status:</label>
                         <select id="polistorderstatus" class="form-control">
                                <option value="" selected>All</option>
                                <option value="New">New</option>
                                <option value="Process">Process</option>
                                <option value="Ship">Shipped</option>
                                <option value="Cancel">Cancelled</option> 
                         </select>
                     </div>  
                    <table class="display main-table" data-table="allorders"> </table>
                </div>
 
</div>



