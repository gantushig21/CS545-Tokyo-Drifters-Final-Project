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

function rentCar() {
    console.log("Rent button clicked");
}

$(function () {
    const rentBtn = document.getElementById("rentBtn");
    rentBtn.onclick = rentCar;
})