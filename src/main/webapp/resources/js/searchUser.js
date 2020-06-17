const contextRoot = "/" + window.location.pathname.split('/')[1];

function searchUser() {
    const passportID = $("#passportID").val();

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");
    $.ajax({
        url: contextRoot + "/check-out/find" + `?passportId=${passportID}&${parameterName}=${token}`,
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (response) {
            $('#searchUserGroup').show();
            $('.info').html(`<fieldset style="padding:20px;">
						<legend>Customer Detail:</legend>
						<label for="fname">First name:</label> <p style="display:inline">${response.firstName}</p><br>
						<br> <label for="lname">Last name:</label> <p style="display:inline">${response.lastName}</p><br>
						<br> <label for="email">Email:</label> <p style="display:inline">${response.email}</p><br>
						<br> <label for="passportId">Passport:</label> <p style="display:inline">${response.passportId}</p><br>
						<br> <label for="phone">Phone:</label> <p style="display:inline">${response.phoneNumber}</p><br>
					</fieldset>`);
        },

        error: function (error) {
            $('.user-form').show();
            $('.info').html("<p style='color:red'>User not exist. Please create new user </p>");
        }
    });
}

function createUser() {
    const inputJSON = JSON.stringify(serializeObject($("#userForm")));

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

    $.ajax({
        url: contextRoot + `/check-out/add-user?${parameterName}=${token}`,
        type: "POST",
        data: inputJSON,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (response) {
            $('.user-form').hide();
            $('#searchUserGroup').show();
            $('.info').html(`<fieldset style="padding:20px;">
						<legend>Customer Detail:</legend>
						<label for="fname">First name:</label> <p style="display:inline">${response.firstName}</p><br>
						<br> <label for="lname">Last name:</label> <p style="display:inline">${response.lastName}</p><br>
						<br> <label for="email">Email:</label> <p style="display:inline">${response.email}</p><br>
						<br> <label for="passportId">Passport:</label> <p style="display:inline">${response.passportId}</p><br>
						<br> <label for="phone">Phone:</label> <p style="display:inline">${response.phoneNumber}</p><br>
					</fieldset>`);
        },

        error: function (error) {
            $(".error").append('<p>');
            if (error.responseJSON.errorType == "ValidationError") {
                var errorList = error.responseJSON.errors;
                $.each(errorList, function (i, error) {
                    $(".error").append(error.message + '<br>');
                });
                $(".error").append('</p>');
            } else {
                alert(error.responseJSON.errors(0));
            }
        }
    });
}

function serializeObject(form) {
    const jsonObject = {};
    const array = form.serializeArray();
    $.each(array, function () {
        jsonObject[this.name] = this.value;
    });
    return jsonObject;
};

$(function () {
    $(window).on('load', function () {
        $('#searchUserGroup').hide();
        $('.user-form').hide();
    });

    $("#searchUser").click(function () {
        console.log("asdsa")
        searchUser();
    });

     $("#create-user").click(function () {
        console.log("asdsa")
        createUser();
    });
})

