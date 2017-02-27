/*global $, document, window, setTimeout, navigator, console, location*/
$(document).ready(function () {

    'use strict';

    var usernameError = true,
        firstNameError    = true,
        lastNameError    = true,
        addressError    = true,
        contactError    = true,
        emailError    = true,
        passwordError = true,
        passConfirm   = true;

    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {

        $(this).siblings('label').addClass('active');
    });

    // Form validation
    $('input').blur(function () { 

         // firstname
        if ($(this).hasClass('firstname')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your first name').fadeIn().parent('.form-group').addClass('hasError');
                firstNameError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                firstNameError = false;
            }
        }

         // lastname
        if ($(this).hasClass('lastname')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your last name').fadeIn().parent('.form-group').addClass('hasError');
                lastNameError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                lastNameError = false;
            }
        }


         // address
        if ($(this).hasClass('address')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your address').fadeIn().parent('.form-group').addClass('hasError');
                addressError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                addressError = false;
            }
        }
 
        // Contact
        if ($(this).hasClass('contact')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your phone number').fadeIn().parent('.form-group').addClass('hasError');
                contactError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                contactError = false;
            }
        }

        // Email
        if ($(this).hasClass('email')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your email address').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                emailError = false;
            }
        }

        // PassWord
        if ($(this).hasClass('pass')) {
            if ($(this).val().length < 8) {
                $(this).siblings('span.error').text('Please type at least 8 charcters').fadeIn().parent('.form-group').addClass('hasError');
                passwordError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                passwordError = false;
            }
        }

        // PassWord confirmation
        if ($('.pass').val() !== $('.passConfirm').val()) {
            $('.passConfirm').siblings('.error').text('Passwords don\'t match').fadeIn().parent('.form-group').addClass('hasError');
            passConfirm = false;
        } else {
            $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
            passConfirm = false;
        }

        // label effect
        if ($(this).val().length > 0) {
            $(this).siblings('label').addClass('active');
        } else {
            $(this).siblings('label').removeClass('active');
        }
    });


    // form switch
    $('a.switch').click(function (e) {
        $(this).toggleClass('active');
        e.preventDefault();

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });


    // Form submit
    $('form.signup-form').submit(function (event) {
        event.preventDefault();

        if (firstNameError == true || lastNameError == true || addressError == true || contactError == true || emailError == true || passwordError == true || passConfirm == true) {
            $('.name, .address, .contact .email, .pass, .passConfirm').blur();
        } else {

          var param = new Object();
          

          param.FirstName = $("input.firstname").val();
          param.LastName = $("input.lastname").val();
          param.Address = $("input.address").val();
          param.Email = $("input.email").val();
          param.ContactNo = $("input.contact").val();
          param.Password = $("input.pass").val();
  
          callAjaxJson("login/signUp", {"data":JSON.stringify(param)}, 
            function(response){
                var data = response
                if(data.responseitem){
                 if(data.responseitem == "Success"){
                    $('.signup, .login').addClass('switched'); 
                    setTimeout(function () { $('.signup, .login').hide(); }, 700);
                    setTimeout(function () { $('.brand').addClass('active'); }, 300);
                    setTimeout(function () { $('.heading').addClass('active'); }, 600);
                    setTimeout(function () { $('.success-msg p').addClass('active'); }, 900);
                    setTimeout(function () { $('.success-msg a').addClass('active'); }, 1050);
                    setTimeout(function () { $('.form').hide(); }, 700);
                  }
                }
                else{
                    $("form.signup-form").addClass("error")
                    $("form.signup-form:before").css("content", data.errormessage)
                }
                 

              },
          ajaxError)


            
        }
    });

    // Reload page
    $('a.profile').on('click', function () {
        location.reload(true);
    });


});
