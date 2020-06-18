<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>New Customer</title>
	<jsp:include page="parts/head.jsp" />
	<link rel="stylesheet" href="<spring:url value="/resource/css/cars.css"/>" />
</head>
<body>
	<jsp:include page="parts/header.jsp" />
	<div class="form-container">
		<div class="car-card">
			<form:form cssStyle="width: 100%;" modelAttribute="newCustomer"
				action="add?${_csrf.parameterName}=${_csrf.token}" method="post">
				<div class="form-group">
					<form:input path="firstName"
						cssClass="form-control" required="true" placeholder="First Name"/>
					<span class="form-span"> <form:errors path="firstName"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="lastName" cssClass="form-control" required="true" placeholder="Last Name" />
					<span class="form-span"> <form:errors path="lastName"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="birthday" type="date"
						cssClass="form-control" required="true" />
					<span class="form-span"> <form:errors path="birthday"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="passportId"
						cssClass="form-control" required="true" placeholder="Passport ID" />
					<span class="form-span"> <form:errors path="passportId"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="phoneNumber"
						cssClass="form-control" required="true" placeholder="Phone Number" />
					<span class="form-span"> <form:errors path="phoneNumber"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">
					<form:input path="email"
						cssClass="form-control" placeholder="Email" />
					<span class="form-span"> <form:errors path="email"
							cssStyle="color : red;" />
					</span>
				</div>
				<div style="display: flex; justify-content: flex-end; ">
					<input type="submit" value="Submit" class="button button-default button-link button-right">
				</div>
			</form:form>
		</div>
	</div>
	<jsp:include page="parts/footer.jsp" />
</body>
</html>