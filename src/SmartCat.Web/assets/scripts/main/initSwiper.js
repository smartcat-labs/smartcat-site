
$(document).ready(function () {
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
			paginationClickable: true,
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev'
	 	});
	}
}