<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/15/20
  Time: 7:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <meta name="_csrf_token" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_parameterName" content="${_csrf.parameterName}"/>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/cars.js"/>"></script>
</head>
<body>
    <div style="width: 100%;">
        <div style="width: 60%; float: left;">
            <img src="<c:url value="/resource/images/${car.imagePath}"></c:url>" alt="car" style="width: 100%;">
        </div>
        <div style="width: 40%; float: left; padding: 20px; box-sizing: border-box;">
            <form:form id="carForm" modelAttribute="car">
                <form:hidden path="id" />
                Factory: <form:input path="factory" id="factory" value="${car.factory}" /><p />
                Model: <form:input path="model" id="model" value="${car.model}" /><p />
                Number: <form:input path="number" id="number" value="${car.number}" /><p />
                Status:  <form:select path="status" id="type" value="${car.status}">
                <form:option value="available" label="Available" />
                <form:option value="notAvailable" label="Not Available" />
                <form:option value="repair" label="Repair" />
                </form:select><p />
                Type: <form:select path="type" id="type" value="${car.type}">
                    <form:option value="miniCar" label="Mini Car" />
                    <form:option value="familyCar" label="Family Car" />
                    <form:option value="pickup" label="Pick Up" />
                </form:select><p />
                Price Per Day: <form:input path="pricePerDay" id="pricePerDay" value="${car.pricePerDay}" /><p />
                Seats: <form:input path="seats" id="seats" value="${car.seats}" /><p />
                Overdue Per Day: <form:input path="overduePerDay" id="overduePerDay" value="${car.overduePerDay}" /><p />
                <form:hidden path="imagePath" />
            </form:form>
<%--            <ct:dateFormat date="${car.createdDate}"/><p />--%>
<%--            <ct:dateFormat date="${car.updatedDate}"/><p />--%>
            <a href="cars/delete?id=${car.id}">Delete</a>
            <button id="updateCar">Update</button>
        </div>
    </div>
</body>
</html>