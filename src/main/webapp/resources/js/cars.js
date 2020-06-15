const contextRoot = "/" + window.location.pathname.split( '/' )[1];

function updateCar(){
    const inputJSON = JSON.stringify(serializeObject($("#carForm")));

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

    console.log(token);
    console.log(parameterName);
    console.log(inputJSON);

    $.ajax({
        url: contextRoot + "/cars/" + JSON.parse(inputJSON).id + `?${parameterName}=${token}`,
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

function serializeObject (form) {
    const jsonObject = {};
    const array = form.serializeArray();
    $.each(array, function() {
        jsonObject[this.name] = this.value;
    });
    return jsonObject;
};

$(function(){
    const updateBtn = document.getElementById("updateCar");

    updateBtn.onclick = updateCar;
})

