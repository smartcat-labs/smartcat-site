$(document).ready(function () {

	$('select').sSelect();

});

$(window).load(function () {

	var $container = $('.blog-inner-wrap');
		$container.packery({
			transitionDuration: '0.5s',
		  	itemSelector: '.item',
			stamp: '.stamp',
			isResizeBound: true
		});

});