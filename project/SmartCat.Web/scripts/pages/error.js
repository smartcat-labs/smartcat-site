$(window).resize(function () {
	contentHeight();
});

$(document).ready(function () {
	contentHeight();
});

function contentHeight() {	
	var headerH = $('.header').height(),
		footerH = $('footer').outerHeight(),
		titleH = $('.page-title').outerHeight(),
		contentH = $('.content').outerHeight(),
		pageContentH = $('body').height() - headerH - footerH - titleH;

	if (pageContentH >= contentH) {
		$('.content').css({ 'min-height': pageContentH});
	} else {
		$('.content').css({ 'min-height': 10 });
	}
}