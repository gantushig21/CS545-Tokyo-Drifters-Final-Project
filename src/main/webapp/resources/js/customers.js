const contextRoot = "/" + window.location.pathname.split('/')[1];

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

	searchBtn.onclick = findCustomer;
	
	$("#windowCloseBtn").click(function(){
		$("#popupWindow").hide();
	});
})