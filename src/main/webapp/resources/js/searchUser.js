const contextRoot = "/" + window.location.pathname.split( '/' )[1];

function searchUser(){
   const passportID = $("#passportID").val();

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");
    $.ajax({
        url: contextRoot + "/cars/" + `?passportID=${passportID}&${parameterName}=${token}`,
        type: "GET",
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

$(function(){
	$("#searchUser").click(function(){
		console.log("asdsa")
		searchUser();
	})
})

