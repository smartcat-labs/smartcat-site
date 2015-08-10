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

});
