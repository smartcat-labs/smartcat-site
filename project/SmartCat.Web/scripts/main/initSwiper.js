$(window).load(function(){
	initSwiper();
});

$(window).resize(function(){
	initSwiper();
});

function initSwiper() {
	if ($(window).width() <= 768 ) {
		var swiper = new Swiper('.what-we-do-block .swiper-container', {
			spaceBetween: 20,
			pagination: '.what-we-do-block .swiper-pagination',
			paginationClickable: true,
			slideToClickedSlide: true
	 	});

	 	var swiper = new Swiper('.process-block .swiper-container', {
			spaceBetween: 20,
			pagination: '.process-block .swiper-pagination',
			paginationClickable: true,
			slideToClickedSlide: true
	 	});

	 	var swiper = new Swiper('.technologies-page .swiper-container', {
			spaceBetween: 20,
			paginationClickable: true,
			slideToClickedSlide: true,
			nextButton: '.technologies-page .swiper-button-next',
			prevButton: '.technologies-page .swiper-button-prev'
	 	});
	}

}