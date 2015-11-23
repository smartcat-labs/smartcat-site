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

    $('.scroll-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 800);
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

    equalHeight($('.one-half-list.technologies li'), 4);

    if ($(window).width() < 1024) {
       equalHeight($('.one-half-list.technologies li'), 2);
    }

});

$(window).resize(function () {
    equalHeight($('.one-half-list.technologies li'), 4);
    if ($(window).width() < 1024) {
       equalHeight($('.one-half-list.technologies li'), 2);
    }
});

// steps form
var theForm = document.getElementById('theForm');

if (theForm !== null && theForm !== undefined) {
    var stepsForm = new stepsForm(theForm, {
        onSubmit: function (form) {

            // hide form
            classie.addClass(theForm.querySelector('.simform-inner'), 'hide');

            $.post("/umbraco/surface/email/processstepsform", $('form').serialize(), function (data, textStatus, jqXHR) {

                if (textStatus === "success") {
                    var messageEl = theForm.querySelector('.final-message');
                    messageEl.innerHTML = data;
                    classie.addClass(messageEl, 'show');
                }

            }, "text").fail(function () {
                var messageEl = theForm.querySelector('.final-message');
                messageEl.innerHTML = "We're having trouble processing your request, please try again later.";
                classie.addClass(messageEl, 'show');
            });
        }
    });
}

function equalHeight (arrayItems, count) {
    if (arrayItems != undefined && arrayItems.length > 0) {

        arrayItems.height('');

        var maxH = 0;

        if (count) {
            var arrays = [];
            while (arrayItems.length > 0)
                arrays.push(arrayItems.splice(0, count));

            for (var i = 0; i < arrays.length; i++) {
                var data = arrays[i];
                maxH = 0;
                for (var j = 0; j < data.length; j++) {
                    var currentH = $(data[j]).outerHeight(true);
                    if (currentH > maxH) {
                        maxH = currentH;
                    }
                };

                for (var j = 0; j < data.length; j++) {
                    $(data[j]).css('height', maxH);
                }
            };
        } else {
            arrayItems.each(function () {
                var currentH = $(this).outerHeight(true);
                if (currentH > maxH) {
                    maxH = currentH;
                }
            });

            arrayItems.css('height', maxH);
        }
    }
}

