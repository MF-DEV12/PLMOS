 $(function () {
      $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');




      $('.tree li.parent_li > span').on('click', function (e) {
          var children = $(this).parent('li.parent_li').find(' > ul > li');
          if (children.is(":visible")) {
              children.hide('fast');
              $(this).attr('title', 'Expand this branch').find(' > i').addClass('fa-plus-square').removeClass('fa-minus-square');
          } else {
              children.show('fast');
              $(this).attr('title', 'Collapse this branch').find(' > i').addClass('fa-minus-square').removeClass('fa-plus-square');
          }

          e.stopPropagation();
      });

      
      $('.tree li > span').on('click', function(e){
         var elem = $(this)
         var param = new Object(); 
         param.id = JSON.stringify(elem.data("id")) 
         bindBreadCrumb($("ol.breadcrumb"), elem.data("name")) 
         $(".tree span.active").removeClass("active")
         elem.addClass("active")
         // $('.tree li > span:not(.active)').closest("li").find("ul").children().hide()
         // elem.closest("li").find("ul").children().show()

         callAjaxJson("biditems/getItems", param, getItemsResponse, ajaxError)
       });
   
      
      $("button.cart").click(function(e){
          location.href= baseUrl + "/Items/cart";
      }) 


      $("span.btn-itemsearch").click(function(e){
        var elem = $(this)
        if($.trim(elem.prev("input").val()).length > 0 )
          location.href = baseUrl + "/biditems?name=" + elem.prev("input").val()
      })

      $("button.btn-checkout, button#btn-proceed").click(function(e){
        location.href = baseUrl + "items/checkout";
      })

      $("button.btn-submitorder").click(function(e){
          if(!isValidCustomer()) {return;}
          var param = new Object()
          var param2 = new Object()
          param.LastName = $("#txt-lastname").val()
          param.FirstName = $("#txt-firstname").val()
          param.HomeAddress = $("#txt-homeaddress").val()
          param.ShipAddress = $("#txt-shipaddress").val()
          param.Email = $("#txt-email").val()
          param.ContactNo = $("#txt-contact").val()
          param2.data = JSON.stringify(param)

          callAjaxJson("items/submitOrder", param2, 
            function(response){
                var data = response 
                if(data.orderno){
                  var data 
                  var modal = $("#SuccessCheckout")  
                  $("a#printorder").attr("href", baseUrl + "items/generateOrderSummary?on=" + data.orderno)    
                  modal.modal("show");
 
                }
            }, 
          ajaxError)  
      })
     
  });



bidtimer();

function bidtimer(){
  $("span.bidtimer").each(function(e){
    var elem = $(this)
    

    var data = elem.data("range")
    var startTime = new Date(data.StartDate); 
    var endTime = new Date(data.EndDate);
    var currentTime = ( startTime >  new Date) ? startTime : endTime
   $("span#tmr"+data.ID).closest("div.timer-holder").attr("class","timer-holder");
    if( startTime >  new Date){
      // $("p#lastbid"+data.ID).hide()
      $("span#tmr"+data.ID).html("<span style=\"font-size:12px;\">Starts " +  startTime.toLocaleString() + "</span>")
      $("span#tmr"+data.ID).closest("div.timer-holder").addClass("soldbid");
  
      $("span#tmr"+data.ID).closest("div.item").find("button.btn-bid").addClass("disabled")
      // $("span#tmr"+data.ID).text("Starts " +  startTime.toLocaleString())
    }
    else{

        // PROGRESS TO BID
        var total_seconds = (endTime  - new Date) / 1000;    
        var hours = Math.floor(total_seconds / 3600);
        total_seconds = total_seconds % 3600;

        var minutes = Math.floor(total_seconds / 60);
        total_seconds = total_seconds % 60;

        var seconds = Math.floor(total_seconds);

        hours = pretty_time_string(hours);
        minutes = pretty_time_string(minutes);
        seconds = pretty_time_string(seconds);
        if(total_seconds > 0){
            $("span#tmr"+data.ID).countdowntimer({
                      hours : hours,
                      minutes : minutes, 
                      seconds : seconds,
                      size : "lg"
            });
        if(hours == 0 && minutes <= 10){
           $("span#tmr"+data.ID).closest("div.timer-holder").addClass("lastminutes"); 
        } 
        else{
          $("span#tmr"+data.ID).closest("div.timer-holder").addClass("progressbid"); 
        }

        }
        else{
           $("span#tmr"+data.ID).closest("div.item").find("button.btn-bid")
                .hide()
          $("span#tmr"+data.ID).closest("div.timer-holder").addClass("soldbid"); 

           $("span#tmr"+data.ID).closest("div.timer-holder").find("span.glyphicon-time").removeClass("glyphicon-time").addClass("glyphicon-thumbs-up")
           $("span#tmr"+data.ID).text("SOLD")
        }
    }

    

  

  })
}
function pretty_time_string(num) {
    return ( num < 10 ? "0" : "" ) + num;
}

function categorymenuClick(elem){

     elem = $(elem)
     var param = new Object(); 
     param.id = JSON.stringify(elem.data("id")) 
     bindBreadCrumb($("ol.breadcrumb"), elem.data("name")) 
     $(".tree span.active").removeClass("active")
     elem.addClass("active")
     callAjaxJson("Items/getItems", param, getItemsResponse, ajaxError)
}

function getItemsResponse(response){
    var data = response
    $("div.list-items").empty();  

    $("div.list-items").append("<div class=\"preloader2\"> <i class=\"fa fa-circle-o-notch fa-spin\"></i></div>")
    setTimeout(function(e){
          $("div.list-items").empty();  
          if(data.length){
            for(x in data){
                var item = ""
                item += "   <div class=\"col-xs-12 col-sm-6 col-md-4 col-lg-3 item\" title=\"Click to view\">"
                item += "      <div class=\"row\">"
                item += "        <div class=\"col-sm-12  item-holder\"  onclick=\"viewItems('"+ data[x].ItemNumber +"');\">"
                item += "          <img width=\"200px\" height=\"200px\" src=\"images/variant-folder/"+ data[x].ImageFile +"\" alt=\"\" onerror=\"this.src='"+ baseUrl  +"/images/noimage.gif';\"/>"
               
                item += "          <h5>"+ data[x].Name +"</h5>"
                item += "          <p class=\"category\">"+ data[x].Category +"</p>"
                item += "          <strong class=\"bidprice\" id=\"bidprice"+data[x].ID+"\">&#8369; "+data[x].CurrentBidPrice+"</strong> <br/>"
                item += "          <p class=\"lastbid\" id=\"lastbid"+data[x].ID+"\"></span> <span id=\"lastbid"+data[x].ID+"\">"+data[x].LastBidUser+"</span> </p>"
                item += "          <div class=\"timer-holder\">"
                item += "              <span class=\"glyphicon glyphicon-time\"></span>"
                item += "              <span class=\"bidtimer\" id=\"tmr"+data[x].ID+"\"  data-range='"+JSON.stringify(data[x])+"'><span>"
                item += "          </div>"
                item += "        </div>"
                item += "        <div class=\"col-sm-12\">"
                item += "          <button class=\"btn btn-action btn-bid\" onclick=\"orderItem('"+ data[x].ID +"');\"  style=\"width:100%;\">BID</button> "
                item += "        </div> "
                item += "      </div>"
                item += "   </div>"
                $("div.list-items").append(item);   
                  
            }
            bidtimer();
          }else{
            $("div.list-items").append("<p class=\"empty\">No item(s) found.</p>"); 
          } 
    },500) 
 

}

function bindBreadCrumb(ol, data){
    ol.empty();
    for(x = 0; x < data.length; x++){
      ol.append("<li class=\"breadcrumb-item "+ ((x == (data.length-1)) ? "active" : "") + "\">"+data[x]+"</li>");
    }

} 

setInterval(function(e){
 callAjaxJson("biditems/updateAllLastBidUsers", new Object(), 
      function(response){
          if(response){
              var data = response
              for(x in data){ 
                    if($("span#lastbid" + data[x].BidItemID).text() != data[x].LastBidUser){
                        $("p#lastbid" + data[x].BidItemID).addClass("focus") 
                        setTimeout(function(e){
                          $("p#lastbid" + data[x].BidItemID).removeClass("focus")
                        },500) 
                    }
                    $("span#lastbid" + data[x].BidItemID).text(data[x].LastBidUser)  
                    $("strong#bidprice" + data[x].BidItemID).html("&#8369; " + data[x].CurrentBidPrice)  
                   
              }
                
          }
      },ajaxError )
},1500)

function bidItemByUsers(id,elem){
    elem = $(elem)
     callAjaxJson("biditems/updateLastBidUsers", {"bidid": id}, 
      function(response){
          var data = response
          try{
            if(data.responseitem){ 
                $("strong#bidprice" + id).html("&#8369; " + data.CurrentBidPrice)  
                $("span#lastbid" + id).text(data.LastBidUser) 

                $("p#lastbid" + data.BidItemID).addClass("focus") 
                  setTimeout(function(e){
                    $("p#lastbid" + data.BidItemID).removeClass("focus")
                  },500) 
            } else{
              if(data.errormessage == "User not logged in."){
                bootbox.alert("Please login your account before proceed to bid.", function(result){ 
                  location.href = baseUrl + "login"
                  
                })
              }
            }
          }catch(e){
            if(data.errormessage == "User not logged in."){
              bootbox.alert("Please login your account before proceed to bid.", function(result){
                if(result){
                  location.href = baseUrl + "login"
                }
              })
            }
          }

           
      },ajaxError )
}

 
function bidItemsView(item){
   location.href = baseUrl + "biditems/view?id="+item
}

function removeCart(elem, item){
    bootbox.re
    elem = $(elem)
    var tr = elem.closest("tr")
    var param = new Object()
    param.id = item;
    callAjaxJson("Items/removeCart", param, 
        function(response){
           var data = response
            if(data){
              $("span.countCart").text(data.carttotal)
              $("carttotal").text(data.carttotal)
              $("span.subtotal").html("&#8369; " + toMoney(data.itemstotal))
              $("span.total").html("<b>&#8369; " + toMoney(data.itemstotal) + "</b>")
              tr.remove()
            }
            
        }
      , ajaxError) 

}
 

function isValidCustomer(){
  var isOkay = true
  $("div.customer-form input[type=text]").each(function(e){
      var elem = $(this)
      if($.trim(elem.val()).length == 0){
        if(elem.attr("id") == "txt-shipaddress"){
          if(!$("div.chk-sameaddress input").prop("checked")){
              isOkay= false
          }
        }else{
          isOkay = false

        }
      } 
  })

  if(!isOkay){
    bootbox.alert("Please input all required field(s)");
    return isOkay
  }

  if(!isEmailValid($("#txt-email").val())){
    bootbox.alert("Email address is invalid");
    isOkay = false;
     return isOkay
  }

  if(!$("div.chk-termcondition input").prop("checked")){
    bootbox.alert("Please check the \"I agree to the term and conditions\"");
    isOkay = false;
     return isOkay
  }

  return isOkay;
}


function viewOrderList(orderno){
  var param = new Object();
  param.orderno = orderno
  $("#viewOrderList orderno").text(orderno);
  callAjaxJson("mypurchase/viewOrderDetails",param, viewOrderListResponse, ajaxError)
}

function viewOrderListResponse(response){
  var data = response
  $("table#table-orderlist tbody").empty()
  if(data){
      for(x in data){
        tr = "";                 
        tr += "<tr>"
        tr += "    <td>"
        tr += "      <div class=\"row\">"
        tr += "        <div class=\"col-xs-5\">"
        tr += "          <img alt=\"\" width:\"80px\" height=\"80px\" src=\""+ baseUrl + "images/variant-folder/" + data[x].ImageFile + "\"/>"
        tr += "          <h6>"+ data[x].VariantName +"</h6>"
        tr += "        </div>"
        tr += "        <div class=\"col-xs-7\"> "
        tr += "          <h4 style=\"color:#172052;\">"+ data[x].Name +"</h4>  " 
        tr += "          <h6>Price:<br/> &#8369; "+ toMoney(data[x].Price) +" x "+ data[x].Quantity +"</h6>"
        tr += "          <h5>Total:<br/> &#8369; <strong>"+ toMoney(data[x].Total) +"</strong></h5>"
        tr += "        </div>"
        tr += "      </div> "
        tr += "    </td>" 
        tr += "  </tr>"
        $("table#table-orderlist tbody").append(tr)
      }
  }
  else{
        tr = "<tr> <td align=\"center\"> <p class=\"empty\">No orders yet.</p> </td>  </tr> ";                 
        $("table#table-orderlist tbody").append(tr) 
  }



}