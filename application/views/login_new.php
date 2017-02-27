<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Responsive Signup/Login form</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:300,600" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel='stylesheet prefetch' href="<?=base_url('css/login/dist/css/bootstrap.css');?>">

  <link rel="stylesheet" href="<?=base_url('css/login_new.css')?>">

  
</head>

<body>
  
<div class="container">
   <section id="formHolder">

      <div class="row">

         <!-- Brand Box -->
         <div class="col-sm-6 brand">
            <!-- <a href="#" class="logo">MR <span>.</span></a> -->

            <div class="heading">
               <h2>LE<span style="color:#f44336;">GA</span>CY</h2>
               <p>Aluminum Glass and Construction supplies.</p>
            </div>

            <div class="success-msg">
               <p>Great! You are one of our members now</p>
               <a href="<?=base_url()?>" class="profile">Shopping now</a>
            </div>
         </div>


         <!-- Form Box -->
         <div class="col-sm-6 form">

            <!-- Login Form -->
            <div class="login form-peice">
               <form class="login-form" action="<?=base_url('login/validateUser')?>" method="post"  style="top:134px;">
                  <div class="form-group">
                     <label for="loginemail">Username / Email Address</label>
                     <input type="text" name="username" id="loginemail" required>
                  </div>

                  <div class="form-group">
                     <label for="loginPassword">Password</label>
                     <input type="password" name="password" id="loginPassword" required>
                  </div>

                  <div class="CTA">
                     <input type="submit" value="Login">
                     <a href="#" class="switch">I'm New</a>
                  </div>

			    <?php if($this->session->flashdata('error')) {?>
				        <p style="color:red;"><?=$this->session->flashdata('error');?></p> 
			    <?php }?>
               </form>
            </div><!-- End Login Form -->


            <!-- Signup Form -->
            <div class="signup form-peice switched">
               <form class="signup-form" action="#" method="post">

                  <div class="form-group">
                     <label for="name">First Name</label>
                     <input type="text" name="FirstName" id="name" class="firstname name">
                     <span class="error"></span>
                  </div>
                  <div class="form-group">
                     <label for="name">Last Name</label>
                     <input type="text" name="LastName" id="name" class="lastname name">
                     <span class="error"></span>
                  </div>
                   
                  <div class="form-group">
                     <label for="email">Address</label>
                     <input type="text" name="Address" id="email" class="address">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="email">Email Address</label>
                     <input type="email" name="Email" id="email" class="email">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="phone">Phone Number</label>
                     <input type="text" name="ContactNo" id="phone" name="contact" class="contact">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" name="Password" id="password" class="pass">
                     <span class="error"></span>
                  </div>

                  <div class="form-group">
                     <label for="passwordCon">Confirm Password</label>
                     <input type="password" name="passwordCon" id="passwordCon" class="passConfirm">
                     <span class="error"></span>
                  </div>

                  <div class="CTA">
                     <input type="submit" value="Signup Now" id="submit">
                     <a href="#" class="switch">I have an account</a>
                  </div>
               </form>
            </div><!-- End Signup Form -->
         </div>
      </div>

   </section>

 

</div>
 <script src='<?=base_url("js/jquery/jquery-1.11.3.js");?>'></script>
<script src='<?=base_url("js/bootstrap/bootstrap.min.js");?>'></script>
<script src='<?=base_url("js/utility/ajaxCall.js");?>'></script>

    <script src="<?=base_url('js/login_new.js')?>"></script>

</body>
</html>
