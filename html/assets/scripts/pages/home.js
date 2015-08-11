$(document).ready(function () {
	$('.flexslider').flexslider({
		animation: "slide",
		animationLoop: true,
		controlNav: false,
		itemMargin: 20,
		slideshow: false,
		move: 1,                   
		itemWidth : 260,
		minItems : 2,
		maxItems : 4
	});

	$('.tp-banner').revolution({
		delay:9000,
		startwidth:1170,
		startheight:1090,
		hideThumbs: 0,
		navigationType:"thumb",

		thumbWidth: 125,
		thumbHeight: 120,
		hideThumbs: 0,
        hideTimerBar:"off",
		
		navigationType:"none",
		navigationArrows:"nexttobullets",
		navigationStyle:"preview3",
		navigationHAlign: 'right',
	});

	initSwiper();

});

$(window).load(function(){
	initSwiper();
});

$(window).resize(function(){
	initSwiper();
});

function initSwiper() {
	if ($(window).width() <= 768 ) {
		var swiper = new Swiper('.swiper-container', {
			spaceBetween: 20,
			pagination: '.swiper-pagination',
			paginationClickable: true
	 	});
	}
}