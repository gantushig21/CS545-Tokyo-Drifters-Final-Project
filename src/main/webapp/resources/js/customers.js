const contextRoot = "/" + window.location.pathname.split( '/' )[1];
const token = $("meta[name='_csrf_token']").attr("content");
const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

function updateCar(){
    const inputJSON = JSON.stringify(serializeObject($("#customerForm")));

    console.log(token);
    console.log(parameterName);
    console.log(inputJSON);

    $.ajax({
        url: contextRoot + "/customer/update" + JSON.parse(inputJSON).id + `?${parameterName}=${token}`,
        type: "PUT",
        data: inputJSON,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(response) {
            console.log(response)
        },

        error: function(error){
            alert(error);
        }
    });
}

function getCustomer() {
    const passportId = document.getElementById("searchPassportId").value;

    $.ajax({
        url: contextRoot + "/customer/" + passportId,
        type: "GET",
        dataType: 'json',
        success: function(response) {
            for (let key in response) {
                const input = document.getElementById(key);
                if (input) {
                    input.value = response[key] || "";
                }
            }
        },

        error: function(error){
            alert(error);
        }
    });
}

function findCustomer() {

	const passportId = $('#search').val();
	const token = $("meta[name='_csrf_token']").attr("content");
	const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

	// console.log(token);
	// console.log(parameterName);
	console.log(passportId);
	console.log(contextRoot + "/customer/search?passportId=" + passportId
			+ `?${parameterName}=${token}`);

	$.ajax({
		url : contextRoot + "/customer/search?passportId=" + passportId,
		// + `?${parameterName}=${token}`,
		type : "GET",
		contentType : 'application/json; charset=utf-8',

		success : function(response) {

			if (response === "" || response == null) {
				alert("Customer is not found");
			} else {
				displayCustomer(response);
			}

		},

		error : function(error) {
			alert(error);
		}
	});
}

function serializeObject(form) {
	const jsonObject = {};
	const array = form.serializeArray();
	$.each(array, function() {
		jsonObject[this.name] = this.value;
	});
	return jsonObject;
};

function displayCustomer(customer){
	$("#windowMessage").html("");
	$("#windowMessage").append('<p class="form-control"> Firstname  : '+'  '+ customer.firstName +'</p>' +
							'<p class="form-control"> Lastname  : '+'  '+ customer.lastName +'</p>' +
							'<p class="form-control"> Birthday  : '+'  '+ customer.birthday +'</p>' +
							'<p class="form-control"> Email  : '+'  '+ customer.email +'</p>' +
							'<p class="form-control"> Phone Number  : '+'  '+ customer.phoneNumber +'</p>' + 
							'<p class="form-control"> Passport ID  : '+'  '+ customer.passportId +'</p>');
							
	$("#popupWindow").show("slow");
}

$(function() {
	const searchBtn = document.getElementById("searchBtn");

    if (updateBtn)
        updateBtn.onclick = updateCar;

    const searchByPassport = document.getElementById("searchByPassport");

    if (searchByPassport)
        searchByPassport.onclick = getCustomer;
	searchBtn.onclick = findCustomer;
	
	$("#windowCloseBtn").click(function(){
		$("#popupWindow").hide();
	});
})