<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/15/20
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<spring:url value="/resource/css/rent.css"/>" />
    <link rel="stylesheet" href="<spring:url value="/resource/css/main.css"/>" />
</head>
<body>
<div class="form-container">
    <div class="rent-card">
        <form:form
                cssStyle="width: 100%;"
                modelAttribute="rent"
                action="add?${_csrf.parameterName}=${_csrf.token}"
        >
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
<%--            <div class="form-group">--%>
<%--                <form:input path="checkoutDate" id="checkoutDate" cssClass="form-control" required="true" />--%>
<%--                <span class="form-span">--%>
<%--                        <form:errors path="checkoutDate" cssClass="error" />--%>
<%--                </span>--%>
<%--            </div>--%>
        </form:form>
    </div>
</div>
</body>
</html>
