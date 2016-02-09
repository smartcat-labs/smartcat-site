$(document).ready(function () {

    $('select').sSelect();

    $('#search').on('keyup', function (e) {
        if (e.keyCode === 13) {
            $('#blogForm').submit();
        }
    });

    $('select#tag').change(function () {
        $(this.selectedOptions[0]).attr('selected','selected');
        $('#blogForm').submit();
    });

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