<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="<spring:url value="/resource/css/modal.css"/>">

<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="modal-body">
            <p id="messageModal"></p>
        </div>
        <div class="modal-footer">
            <button id="actionModal" class="button button-default"></button>
            <button id="okayModal" class="button button-default">Okay</button>
        </div>
    </div>
</div>