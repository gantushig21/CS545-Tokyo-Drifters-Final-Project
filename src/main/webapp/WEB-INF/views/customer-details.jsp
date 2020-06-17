<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Detail</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resource/js/customers.js"/>"></script>
</head>
<body>

	<form:form modelAttribute="updatedcustomer" id="customerForm"
		action="update?${_csrf.parameterName}=${_csrf.token}" method="POST">
		<form:hidden path="id" value="${customer.id}" />
		<p>
			First Name:
			<form:input path="firstName" id="firstName"
				value="${customer.firstName}" />
			<form:errors path="firstName" cssStyle="color : red;" />
		<p />
		<p>
			Last Name:
			<form:input path="lastName" id="lastName"
				value="${customer.lastName}" />
			<form:errors path="lastName" cssStyle="color : red;" />
		<p />
		<p>
			Passport Id:
			<form:input path="passportId" id="passportId"
				value="${customer.passportId}" />
			<form:errors path="passportId" cssStyle="color : red;" />
		<p />
		<p>
			Phone:
			<form:input path="phoneNumber" id="phoneNumber"
				value="${customer.phoneNumber}" />
			<form:errors path="phoneNumber" cssStyle="color : red;" />
		<p />
		<p>
			Email:
			<form:input path="email" id="email" value="${customer.email}" />
			<form:errors path="email" cssStyle="color : red;" />
		<p />
		<p>
			Birthday:
			<form:input path="birthday" id="birthday"
				value="${birthday}" />
			<form:errors path="birthday" cssStyle="color : red;" />
		<p />
		<input type = "submit" value = "Update" />
	</form:form>
	<a href="/CS545-Tokyo-Drifters-Final-Project/customer/">Back</a>
	<a href="delete?id=${customer.id}">Delete</a>

</body>
</html>