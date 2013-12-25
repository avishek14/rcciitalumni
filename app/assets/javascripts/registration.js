$(function(){
	var typeOf = $('#typeof');

	typeOf.change(function(){
		if( typeOf.val() === 'Alumni') {
			$('#posit').prop('disabled', true);
			$('#inst').prop('disabled', false);
			$('#status').prop('disabled', false);
			$('#date_year').prop('disabled', false);
		}
		else if( typeOf.val() === 'Teacher') {
			$('#posit').prop('disabled', false);
			$('#inst').prop('disabled', true);
			$('#status').prop('disabled', true);
			$('#date_year').prop('disabled', true);
		}
		else if( typeOf.val() === 'Student' ) {
			$('#posit').prop('disabled', true);
			$('#inst').prop('disabled', true);
			$('#status').prop('disabled', true);
			$('#date_year').prop('disabled', false);
		}
	});

	var pass = $('#password');
	var conf_pass = $('#confirm_password');

	$('#register').on( 'click', function(e){
		var messg = "";
		var err = false;

		if( !pass.val().match(/^[a-zA-Z0-9]{6,16}$/) ) {
			messg = "Password Invalid.";
			err = true;
		}
		else if( pass.val() !== conf_pass.val() ) {
			messg = "Passwords do not match.";
			err = true;
		}
		else if( $('#phone').val() === "" ) {
			messg = "Phone number cannot be empty.";
			err =true;
		}
		else if( $('#email').val() === "" ) {
			messg = "Email cannot be empty.";
			err = true;
		}
		else if( $('#fname').val() === "" && $('#lname').val() === "" ) {
			messg = "Enter full name.";
			err = true;
		}

		if( err ) {
			e.stopPropagation();
			e.preventDefault();

			$('#registration_error').css('display', 'block');
			$('#registration_error').html(messg);
		}
	});
});