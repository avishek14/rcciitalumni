$(function(){

	$('#login_button').on( 'click', function(e){
		var email = $('#email');
		var pass = $('#password');

		var messg = "";
		var err = false;

		if( !pass.val().match(/^[a-zA-Z0-9]{6,16}$/) ) {
			err = true;
			messg = "Password is invalid.";
		}
		else if( email.val() === "" ) {
			err = true;
			messg = "Email cannot be empty.";
		}

		if( err ) {
			e.preventDefault();
			e.stopPropagation();

			$('#logger_error').css( 'display', 'block');
			$('#logger_error').html( messg );
		}
	});
	
});
