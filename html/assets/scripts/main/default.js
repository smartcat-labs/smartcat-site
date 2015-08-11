$(document).ready(function () {

	//accordion
	if ($('.accordion').length > 0) {
		var heading = '.accordion .item .accordion-head a';
		$(heading).click(function (e) {
	        e.preventDefault();        
			if (!$(this).parent().hasClass('open')) {
				$('.accordion .item').find('.accordion-content').slideUp('fast');
				$('.accordion .item .accordion-head.open').removeClass('open');
				$(this).parent().addClass('open');
				$(this).parent().next().slideDown('fast');
			} else {
				$(this).parent().removeClass('open');
				$(this).parent().next().slideUp('fast');
			}
		});
	}

	if ($('.widget .flexslider').length > 0) {
		$('.widget .flexslider').flexslider({
			animation: "slide",
			animationLoop: false,
			controlNav: true
		});
	}

	// Mobile navigation
	$(".close-menu").click(function () {
		$(".menu-wrapper").slideUp();
		$("body").removeClass("fixed");
	});	

	$(".menu-btn").click(function () {
		$(".menu-wrapper").slideDown();
		$("body").addClass("fixed");
	});

});




var theForm = document.getElementById( 'theForm' );

new stepsForm( theForm, {
	onSubmit : function( form ) {
		// hide form
		classie.addClass( theForm.querySelector( '.simform-inner' ), 'hide' );
		/*
		form.submit()
		or
		AJAX request (maybe show loading indicator while we don't have an answer..)
		*/

		// let's just simulate something...
		var messageEl = theForm.querySelector( '.final-message' );
		messageEl.innerHTML = 'Thank you! We\'ll be in touch.';
		classie.addClass( messageEl, 'show' );
	}
});