$(document).ready(function () {

	//sticky header
	$(".header").sticky({
		topSpacing: 0
	});

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

	$(".open-search").click(function () {
		$(".search-desktop").toggleClass('active');
		$(".btn-search").fadeToggle();
	});

	$('.scroll-top').click(function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});

	$('#searchForm > input').on('keyup', function (e) {
	    if (e.keyCode === 13) {
	        $('#searchForm').submit();
	    }
	});

	$('#msearchForm > input').on('keyup', function (e) {
	    if (e.keyCode === 13) {
	        $('#msearchForm').submit();
	    }
	});


});

var theForm = document.getElementById('theForm');

if (theForm !== null && theForm !== undefined)
{
    var stepsForm = new stepsForm(theForm, {
        onSubmit: function (form) {

            // hide form
            classie.addClass(theForm.querySelector('.simform-inner'), 'hide');

            $.post("/umbraco/surface/email/processstepsform", $('form').serialize(), function (data, textStatus, jqXHR) {

                if (textStatus === "success")
                {
                    var messageEl = theForm.querySelector('.final-message');
                    messageEl.innerHTML = data;
                    classie.addClass(messageEl, 'show');
                }

            }, "text").fail(function() {
                  var messageEl = theForm.querySelector('.final-message');
                  messageEl.innerHTML = "We're having trouble processing your request, please try again later.";
                  classie.addClass(messageEl, 'show');
            });
        }
    });
}


