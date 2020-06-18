const contextRoot = "/" + window.location.pathname.split( '/' )[1];

function dueDateChange(pricePerDay, value) {
    const checkoutDate = new Date(document.getElementById("checkoutDate").value);
    const dueDate = new Date(value);

    const day = (dueDate.getTime() - checkoutDate.getTime()) / (24 * 60 * 60 * 1000);
    let rentCost = `<strong>Rent Cost:</strong>`;
    if (checkoutDate > dueDate || day === 0) {
        document.getElementById("dueDate").value = "";
        rentCost += '0 $';
    } else {
        rentCost +=  (pricePerDay * day) + " $";
    }
    document.getElementById("rentCost").innerHTML = rentCost;
}

function returnDateChange(overduePerDay, value) {
    const dueDate = new Date(document.getElementById("dueDate").value);
    const returnDate = new Date(value);

    const day = (returnDate.getTime() - dueDate.getTime()) / (24 * 60 * 60 * 1000);
    let overdueCost = `<strong>Overdue Cost:</strong>`;
    if (day > 0) {
        overdueCost +=  (overduePerDay * day) + " $";
        document.getElementById("overdueCostInput").value = overduePerDay * day;
    }
    document.getElementById("overdueCost").innerHTML = overdueCost;
}

function returnCar() {
    console.log("Return button clicked");
    const inputJSON = JSON.stringify(serializeObject($("#rentForm")));

    const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");

    $.ajax({
        url: contextRoot + "/checkouts/return/" + JSON.parse(inputJSON).id + `?${parameterName}=${token}`,
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

$(function () {
    const rentBtn = document.getElementById("returnBtn");
    rentBtn.onclick = returnCar;
})