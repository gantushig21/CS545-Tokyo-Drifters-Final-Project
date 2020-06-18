import { startModal, showModal, closeModal } from './modal.js';

const contextRoot = "/" + window.location.pathname.split( '/' )[1];
const token = $("meta[name='_csrf_token']").attr("content");
const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

function updateCar(){
    const inputJSON = JSON.stringify(serializeObject($("#carForm")));

    $.ajax({
        url: contextRoot + "/cars/" + JSON.parse(inputJSON).id + `?${parameterName}=${token}`,
        type: "PUT",
        data: inputJSON,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(response) {
            if (response.status === "success") {
                showModal({
                    msg: "Car detail updated successful",
                    status: "success",
                    action: function() {
                        window.location.replace(contextRoot + "/cars?page=0&limit=10");
                    },
                    actionTxt: "Go to car list",
                    okayTxt: "Okay"
                });
            }

            console.log(response)
        },

        error: function(error){
            alert(error);
        }
    });
}

function deleteCar() {
    const carId = document.getElementById("id").value;

    console.log(carId);
    closeModal();
    $.ajax({
        url: contextRoot + "/cars/" + carId + `?${parameterName}=${token}`,
        type: "DELETE",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(response) {
            if (response.status === "success") {
                window.location.replace(contextRoot + "/cars?page=0&limit=10");
            } else {
                alert(response.message);
            }

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
    const deleteBtn = document.getElementById("deleteCar");

    startModal();
    updateBtn.onclick = updateCar;
    deleteBtn.onclick = function () {
        showModal({
            msg: "Are you sure to delete this car?",
            status: "success",
            action: deleteCar,
            actionTxt: "Delete",
            okayTxt: "Cancel"
        });
    }
})