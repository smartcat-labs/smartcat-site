$(document).ready(function () {
	$('.carousel-block .flexslider').flexslider({
		animation: "slide",
		animationLoop: true,
		controlNav: false,
		itemMargin: 0,
		slideshow: false,
		move: 1,                   
		itemWidth: 260,
		minItems: 5,
		maxItems: 5
	});


	$('.people-slider .flexslider').flexslider({
		animation: "fade",
		animationLoop: true,
		controlNav: true
	});

	$('.testimonials-block .flexslider').flexslider({
		animation: "fade",
		animationLoop: true,
		controlNav: false,
		directionNav: false,
		slideshowSpeed: 6000,
		animationSpeed: 600,   
	});
	

	// $('.tp-banner').revolution({
	// 	delay:9000,
	// 	startwidth:1170,
	// 	startheight:1090,
	// 	hideThumbs: 0,
	// 	navigationType:"thumb",

	// 	thumbWidth: 125,
	// 	thumbHeight: 120,
	// 	hideThumbs: 0,
 //        hideTimerBar:"off",
		
	// 	navigationType:"none",
	// 	navigationArrows:"nexttobullets",
	// 	navigationStyle:"preview3",
	// 	navigationHAlign: 'right',
	// });

	// initSwiper();

	// responsive triangles for home page
	function triangleRezise(){
	   $('.triangle').each(function(){
	      var parentWidth = $(this).parent().width();
	      var parentHeight = $(this).parent().height();
	      var widthVariable = $(this).attr('w');
	      if(!widthVariable){ var widthVariable = $(this).attr('h');}
	      triangleWidth = parseInt(widthVariable) / 100 * parentWidth;
	      var heightVariable = $(this).attr('h');
	      if(!heightVariable){ var heightVariable = $(this).attr('w');}
	      triangleHeight = parseInt(heightVariable) / 100 * parentWidth;
	      

	      if($(this).hasClass('bottomleft')) {
	        triangleHeight = "" + triangleHeight + "px";
	        triangleWidth = "" + triangleWidth + "px";
	        var triangle = "0px " + triangleWidth + " " + triangleHeight + " " + "0px";
	        $(this).css("border-width", triangle);
	     }
	     else if($(this).hasClass('bottomright')) {
	        triangleHeight = "" + triangleHeight + "px";
	        triangleWidth = "" + triangleWidth + "px";
	        var triangle = "0px " + "0px " + triangleHeight + " " + triangleWidth;
	        $(this).css("border-width", triangle);
	     }
	     else{};
	    });
	};
	triangleRezise();
	
	setImgHeight();

	$(window).resize(function() {
	  	triangleRezise();
	  	setImgHeight();
	});

});

function setImgHeight(){
	var divWidth = $('.one-three .img-container').width();
	$('.one-three .img-container').outerHeight(divWidth);
	$('.one-three .text').outerHeight(divWidth);
};

