$(function(){
	var refd = false;

	$('.slideshow').cycle({
		fx: 'fade',
		speed: 200,
		random: true
	});

	$('#scrollable').simplyScroll({
		customClass: 'vert',
			orientation: 'vertical',
            auto: true,
            autoMode: 'loop',
			frameRate: 20,
			speed: 1	
	});

});