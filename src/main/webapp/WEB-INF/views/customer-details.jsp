<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Detail</title>
	<jsp:include page="parts/head.jsp" />

	<link rel="stylesheet" href="<spring:url value="/resource/css/cars.css"/>" />
	<script type="text/javascript" src="<spring:url value="/resource/js/customers.js"/>"></script>
</head>
<body>
	<jsp:include page="parts/header.jsp" />
	<div class="form-container">
		<div class="car-card">
		<form:form
				cssStyle="width: 100%;"
				modelAttribute="updatedcustomer"
				id="customerForm"
		>
			<%--				action="update?${_csrf.parameterName}=${_csrf.token}" method="POST"--%>
		<form:hidden path="id" value="${customer.id}" />
		<div class="form-group">
			First Name:
			<form:input path="firstName" id="firstName" cssClass="form-control"
				value="${customer.firstName}" />
			<form:errors path="firstName" cssStyle="color : red;" />
		</div>
		<div class="form-group">
			Last Name:
			<form:input path="lastName" id="lastName" cssClass="form-control"
				value="${customer.lastName}" />
			<form:errors path="lastName" cssStyle="color : red;" />
		</div>
		<div class="form-group">
			Passport Id:
			<form:input path="passportId" id="passportId" cssClass="form-control"
				value="${customer.passportId}" />
			<form:errors path="passportId" cssStyle="color : red;" />
		</div>
		<div class="form-group">
			Phone:
			<form:input path="phoneNumber" id="phoneNumber" cssClass="form-control"
				value="${customer.phoneNumber}" />
			<form:errors path="phoneNumber" cssStyle="color : red;" />
		</div>
		<div class="form-group">
			Email:
			<form:input path="email" id="email" cssClass="form-control" value="${customer.email}" />
			<form:errors path="email" cssStyle="color : red;" />
		</div>
		<div class="form-group">
			Birthday:
			<form:input path="birthday" id="birthday" cssClass="form-control" type="date"
				value="${birthday}" />
			<form:errors path="birthday" cssStyle="color : red;" />
		</div>
<%--		<input type = "submit" value = "Update" />--%>
	</form:form>
		<div style="display: flex; justify-content: flex-end; width: 100%;">
			<a href="delete?id=${customer.id}" class="button button-default button-link">Delete</a>
			<button id="updateCustomer" class="button button-default" style="margin-right: 0;">Update</button>
		</div>
<%--			<a href="/CS545-Tokyo-Drifters-Final-Project/customer?page=0&limit=10">Back</a>--%>
	</div>
	</div>
	<jsp:include page="parts/footer.jsp" />
</body>
</html>