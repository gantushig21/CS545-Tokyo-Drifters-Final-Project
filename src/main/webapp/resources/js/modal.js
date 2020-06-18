export function showModal(data) {
    const actionBtn = document.getElementById("actionModal");
    const okayBtn = document.getElementById("okayModal");

    actionBtn.onclick = data.action;
    actionBtn.innerHTML = data.actionTxt;
    okayBtn.innerHTML = data.okayTxt;

    if (data.status == 'success') {
        actionBtn.style.display = "inline-block";
    } else {
        actionBtn.style.display = "none";
    }
    document.getElementById("messageModal").innerHTML = data.msg;
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
}

export function closeModal() {
    const modal = document.getElementById("myModal");

    modal.style.display = "none";
}

export function startModal() {
    const modal = document.getElementById("myModal");

    const okayBtn = document.getElementById("okayModal");

    if (okayBtn) {
        okayBtn.onclick = function() {
            modal.style.display = "none";
        }
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
}