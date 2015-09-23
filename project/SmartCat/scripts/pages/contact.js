$(document).ready(function () {

// contact form
$('#mainContactForm').validate({

    rules: {
        senderName: {
            required: true
        },
        senderEmail: {
            required: true,
            email: true
        },
        subject: {
            required: true,
        },
        message: {
            required: true
        }
    },

    showErrors: function (errorMap, errorList) {
       
        if (errorList.length > 0) {
            $.each(errorList, function (index, value) {
                $(value.element).parent('div.contact-info').addClass('has-error');
            });
        }
        else {
            $(this.currentElements[0]).parent('div.contact-info').removeClass('has-error');
        }

        this.defaultShowErrors();
    }

});

$('.js_mainContactFormSubmit').click(function (e) {
    e.preventDefault();

    var mainForm = $('#mainContactForm');

    if (mainForm.valid()) {
        $.post("/umbraco/surface/email/processcontactform", mainForm.serialize(), function (data, textStatus, jqXHR) {

            if (textStatus === "success") {

                $('#mainContactForm').trigger("reset");
                $('.js_mainContactFormSubmit').after("<h2>" + data + "</h2>");
                $('.js_mainContactFormSubmit').remove();

            }
            else {
                $('#mainContactForm').trigger("reset");
                $('.js_mainContactFormSubmit').after("<h2>" + data + "</h2>");
                $('.js_mainContactFormSubmit').remove();
            }


        }, "text").fail(function () {
            $('#mainContactForm').trigger("reset");
            $('.js_mainContactFormSubmit').after("<h2>We are having trouble processing your request, please try again later.</h2>");
            $('.js_mainContactFormSubmit').remove();
        });
    }
});

function whoSelected(ctrl) {

    $(ctrl).siblings().removeClass('active');
    $(ctrl).addClass('active');

    $('#contactMemberId option').removeAttr('selected');
    $('#contactMemberId option[value=' + ctrl.id + ']').attr('selected', 'selected');
}

});