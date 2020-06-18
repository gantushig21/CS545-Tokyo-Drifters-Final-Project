const contextRoot = "/" + window.location.pathname.split('/')[1];

function searchUser() {
    const passportID = $("#passportID").val();

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");
    $.ajax({
        url: contextRoot + "/checkouts/find" + `?passportId=${passportID}&${parameterName}=${token}`,
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (response) {
            searchUserGroup();
            customerFoundForm(response);
        },

        error: function (error) {
            createCustomerForm(passportID);
            $('#searchUserGroup').html(``);
            $('.info').html("<p style='color:red'>User not exist. Please create new user </p>");
        }
    });
}

function createUser() {
    const inputJSON = JSON.stringify(serializeObject($("#userForm")));

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

    $.ajax({
        url: contextRoot + `/checkouts/add-user?${parameterName}=${token}`,
        type: "POST",
        data: inputJSON,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (response) {
            // $('.user-form').hide();
            console.log(response);
            searchUserGroup();
            customerFoundForm(response);
        },

        error: function (error) {
            $(".error").append('<p>');
            if (error.responseJSON.errorType == "ValidationError") {
                var errorList = error.responseJSON.errors;
                $(".error").html(``);
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

function customerFoundForm(response) {
    $('#customerSection').html(`
        <div class="rent-card" style="max-width: 450px;">
            <div class="row">
                <div class="col-5"><strong>First name:</strong></div>
                <div class="col-7">${response.firstName}</div>
            </div>
            <div class="row">
                <div class="col-5"><strong>Last name:</strong></div>
                <div class="col-7">${response.lastName}</div>
            </div>
            <div class="row">
                <div class="col-5"><strong>Email:</strong></div>
                <div class="col-7">${response.email}</div>
            </div>
            <div class="row">
                <div class="col-5"><strong>Passport:</strong></div>
                <div class="col-7">${response.passportId}</div>
            </div>
            <div class="row">
                <div class="col-5"><strong>Phone:</strong></div>
                <div class="col-7">${response.phoneNumber}</div>
            </div>
        </div>`);
}

function createCustomerForm(passportID) {
    $('#customerSection').html(`
<div class="rent-card" style="max-width: 450px;">
        <div class="info" style="margin-bottom: 20px;"></div>
        <div class="user-form" style="width: 100%;">
        <form id="userForm" >
        <div class="error" style="color:red"></div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="firstName"><strong>First name:</strong></label></div>
    <div class="col-7"><input type="text" id="firstName" name="firstName" class="form-control"></div>
        </div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="lastName"><strong>Last name:</strong></label></div>
    <div class="col-7"><input type="text" id="lastName" name="lastName" class="form-control"></div>
        </div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="email"><strong>Email:</strong></label></div>
    <div class="col-7"><input type="email" id="email" name="email" class="form-control"></div>
        </div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="birthday"><strong>Birthday:</strong></label></div>
    <div class="col-7"><input type="date" id="birthday" name="birthday" class="form-control"></div>
        </div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="passportId"><strong>Passport ID:</strong></label></div>
    <div class="col-7"><input type="text" id="passportId" name="passportId" class="form-control" value="${passportID}"></div>
        </div>
        <div class="row">
        <div class="col-5"><label class="form-label" for="phoneNumber"><strong>Phone Number:</strong></label></div>
    <div class="col-7"><input type="text" id="phoneNumber" name="phoneNumber" class="form-control"></div>
        </div>
        <button
            id="create-user"
            style="display: inline-block; float:right;"
            class="button button-default"
            type="button"
            onclick="createUser()"
            id="button-addon2"
        >
        Create User
    </button>
    </form>
    </div>
    </div>
    `);
}

function searchUserGroup() {
    $('#searchUserGroup').html(`
        <div style="text-align: center; float: right; margin-top: 30px">
            <div style="display: inline;">
                <a href="${contextRoot}/cars?page=0&limit=10" style="display: inline-block;" class="button button-default button-link" type="button"
                    id="button-addon2">Cancel</a>
            </div>
            <div style="display: inline;">
                <a href="detail" style="display: inline-block;"
                    class="button button-default button-link" type="button" id="button-addon2">Next</a>
            </div>
        </div>
    `);
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
    $("#searchUser").click(function () {
        console.log("asdsa")
        searchUser();
    });
})

