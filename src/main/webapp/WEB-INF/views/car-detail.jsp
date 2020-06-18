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
    <title>Car Detail</title>
    <jsp:include page="parts/head.jsp" />
    <script type="module" src="<spring:url value="/resource/js/cars.js"/>"></script>
</head>
<body>
    <jsp:include page="parts/header.jsp" />
    <div style="width: 100%;">
        <div style="width: 60%; float: left;">
            <img src="<c:url value="/resource/images/${car.imagePath}"></c:url>" alt="car" style="width: 100%;">
        </div>
        <div style="width: 40%; float: left; padding: 20px; box-sizing: border-box;">
            <form:form id="carForm" modelAttribute="car">
                <form:hidden id="id" path="id" />
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Factory:</strong></label></div>
                    <div class="col-7"><form:input path="factory" id="factory" value="${car.factory}" cssClass="form-control"/></div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Model:</strong></label></div>
                    <div class="col-7"><form:input path="model" id="model" value="${car.model}" cssClass="form-control"/></div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Number:</strong></label></div>
                    <div class="col-7"><form:input path="number" id="number" value="${car.number}" cssClass="form-control"/></div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Status:</strong></label></div>
                    <div class="col-7">
                        <form:select path="status" id="status" value="${car.status}" cssClass="form-control">
                            <form:options items="${status}" />
                        </form:select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Type:</strong></label></div>
                    <div class="col-7">
                        <form:select path="type" id="type" value="${car.type}" cssClass="form-control">
                            <form:options items="${types}" />
                        </form:select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Price per Day:</strong></label></div>
                    <div class="col-7"><form:input path="pricePerDay" id="pricePerDay" value="${car.pricePerDay}" cssClass="form-control"/></div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Seats:</strong></label></div>
                    <div class="col-7"><form:input path="seats" id="seats" value="${car.seats}" cssClass="form-control" /></div>
                </div>
                <div class="row">
                    <div class="col-5"><label class="form-label"><strong>Overdue Per Day:</strong></label></div>
                    <div class="col-7"><form:input path="overduePerDay" id="overduePerDay" value="${car.overduePerDay}"  cssClass="form-control"/></div>
                </div>
                <form:hidden path="imagePath" />
            </form:form>
<%--            <ct:dateFormat date="${car.createdDate}"/><p />--%>
<%--            <ct:dateFormat date="${car.updatedDate}"/><p />--%>
<%--            <a href="cars/delete?id=${car.id}" class="button button-default">Delete</a>--%>
            <div class="row" style="justify-content: flex-end;">
                <button id="deleteCar" class="button button-default">Delete</button>
                <button id="updateCar" class="button button-default" style="margin-right: 0;">Update</button>
            </div>
        </div>
    </div>
    <jsp:include page="parts/modal.jsp" />
    <jsp:include page="parts/footer.jsp" />
</body>
</html>