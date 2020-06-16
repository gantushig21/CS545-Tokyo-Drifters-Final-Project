<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/15/20
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<spring:url value="/resource/css/rent.css"/>" />
    <link rel="stylesheet" href="<spring:url value="/resource/css/main.css"/>" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/rent.js"/>"></script>

</head>
<body>
<div class="form-container">
    <div class="rent-card">
        <h3>Car Information</h3>
        <div class="info-lines">
            <div class="info-line">
                <label><strong>Factory:</strong> ${rent.car.factory}</label>
                <label><strong>Model:</strong> ${rent.car.model}</label>
            </div>
            <div class="info-line">
                <label><strong>Status:</strong> ${rent.car.status}</label>
                <label><strong>Number:</strong> ${rent.car.number}</label>
            </div>
            <div class="info-line">
                <label><strong>Type:</strong> ${rent.car.type}</label>
                <label><strong>Seats:</strong> ${rent.car.seats}</label>
            </div>
            <div class="info-line">
                <label><strong>Price per Day:</strong> ${rent.car.pricePerDay}</label>
                <label><strong>Overdue per Day:</strong> ${rent.car.overduePerDay}</label>
            </div>
        </div>

        <h3>Customer Information</h3>
        <div class="info-lines">
            <div class="info-line">
                <label><strong>First Name:</strong> ${rent.customer.firstName}</label>
                <label><strong>Last Name:</strong> ${rent.customer.lastName}</label>
            </div>
            <div class="info-line">
                <label><strong>Passport ID:</strong> ${rent.customer.passportId}</label>
                <label><strong>Birthday:</strong> <ct:dateFormat date="${rent.customer.birthday}"/></label>
            </div>
            <div class="info-line">
                <label><strong>Phone Number:</strong> ${rent.customer.phoneNumber}</label>
                <label><strong>Email:</strong> ${rent.customer.email}</label>
            </div>
        </div>
        <h3>Rent Detail</h3>
        <form id="rentForm" style="width: 100%;">
            <div class="info-lines">
                <div class="info-line">
                    <div class="date-div">
                        <label><strong>Checkout Date:</strong></label>
                        <div>
                            <fmt:formatDate value="${rent.checkoutDate}" pattern="yyyy-MM-dd" var="checkoutDate"/>
                            <input
                                    id="checkoutDate"
                                    value="${checkoutDate}"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    disabled="true"
                            />
                            <span class="form-span">
                        </span>
                        </div>
                    </div>
                    <div class="date-div">
                        <label><strong>Due Date:</strong></label>
                        <div>
                            <input
                                    id="dueDate"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    onchange="dueDateChange(${rent.car.pricePerDay}, this.value)"
                            />
                            <span class="form-span">
                        </span>
                        </div>
                    </div>
                </div>
                <div class="date-div">
                    <label id="rentCost"><strong>Rent Cost:</strong>0 $</label>
                </div>
            </div>
            <div class="form-group" style="text-align: right;">
                <button id="rentBtn" type="button">Submit</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
