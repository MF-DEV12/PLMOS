<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - <?=COMPANY_NAME;?></title>
    <link rel="stylesheet" type="text/css" href="<?=base_url('css/bootstrap/bootstrap.min.css');?>">
    <link rel="stylesheet" type="text/css" href="<?=base_url('css/form-element.css');?>">
    <link rel="stylesheet" type="text/css" href="<?=base_url('css/login.css');?>">
</head>
<body>
<div class="background-holder"> </div>

 <!-- Top content -->
<div class="company-logo" align="center">
    <h1>LE<span>GA</span>CY</h1>
    <!-- <img src="<?=base_url('images/logo.png')?>" width="250px"> -->
    <p>Aluminum Glass and Construction Supply Inc.</p>
</div>              
<div class="box login">

   <?php if($this->session->flashdata('error')) {?>
        <p class="label label-danger"><?=$this->session->flashdata('error');?></p> 
    <?php }?>
  <div id="header">
  <h1 id="logintoregister"  align="center">Login</h1>
 
  </div>  
   <form action="<?=base_url('login/validateUser')?>" method="post" class="login-form" id="loginform">
    <div class="group">      
      <input class="inputMaterial" type="text" name="username" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Username or Email</label>
    </div>
        <div class="group">      
      <input class="inputMaterial" type="password" name="password"  required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Password</label>
    </div>
   
    <button id="buttonlogintoregister" type="submit">Login</button> 
  </form> 
  <div id="footer-box">
  <p class="footer-text">Not a member?<span class="sign-up"> Sign up now</span></p>
  </div>
</div>

  
    <script type="text/javascript" src='js/jquery/jquery-1.11.3.js'></script>
    <script type="text/javascript" src='js/bootstrap/bootstrap.min.js'></script>
    <script type="text/javascript" src="<?=base_url('js/bootbox.min.js');?>"></script> 
    <script type="text/javascript" src='js/utility/ajaxCall.js'></script>
    <!-- <script type="text/javascript" src='js/index.js'></script> -->
</body>
</html>