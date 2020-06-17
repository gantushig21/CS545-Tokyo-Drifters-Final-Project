<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Add</title>
<%@ include file="parts/meta.jsp"%>
<%@ include file="parts/Header.jsp"%>
<link rel="stylesheet"
	href="<spring:url value="/resource/css/main.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resource/css/cars.css"/>" />
</head>
<body>
	<div class="form-container">
		<div class="car-card">
			<form:form cssStyle="width: 100%;" modelAttribute="newCustomer"
				action="add?${_csrf.parameterName}=${_csrf.token}" method="post">
				<div class="form-group">
					<form:input path="firstName" value="Sergelen"
						cssClass="form-control" />
					<span class="form-span"> <form:errors path="firstName"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="lastName" value="Harry" cssClass="form-control" />
					<span class="form-span"> <form:errors path="lastName"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="birthday" value="2000/01/01"
						cssClass="form-control" />
					<span class="form-span"> <form:errors path="birthday"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="passportId" value="123456780"
						cssClass="form-control" />
					<span class="form-span"> <form:errors path="passportId"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="phoneNumber" value="88888888"
						cssClass="form-control" />
					<span class="form-span"> <form:errors path="phoneNumber"
							cssStyle="color : red;" />
					</span>
				</div>
				<div class="form-group">

					<form:input path="email" value="abc@abc.com"
						cssClass="form-control" />
					<span class="form-span"> <form:errors path="email"
							cssStyle="color : red;" />
					</span>
				</div>
				<input type="submit" value="Submit">
			</form:form>
		</div>
	</div>

</body>
</html>