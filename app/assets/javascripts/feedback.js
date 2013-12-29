$(function(){
	$('#send_feedback').on( 'click', function(e){
		alert("HO");
		var name = $('#name').val();
		var subject = $('#subject').val();
		var email = $('#email').val();
		var body = $('#body').val();

		var f_error = $('#feedback_error');

		if( name === "" || subject === "" || email === "" || body === "" ) {
			f_error.css('display', 'block');
			f_error.html("All fields marked with a red astreix must be filled.");

			e.stopPropagation();
			e.preventDefault();
		}
	)};
});