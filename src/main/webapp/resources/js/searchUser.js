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
            $('.info').html("<p style='color:red'>User not exist. Please create new user <a alt='' href='/CS545-Tokyo-Drifters-Final-Project/customer/add'>Register User</a></p>");
        }
    });
}

$(function () {
    $(window).on('load', function () {
        $('#searchUserGroup').hide();
    })

    $("#searchUser").click(function () {
        console.log("asdsa")
        searchUser();
    })
})

