<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Add</title>
</head>
<body>

	<form:form modelAttribute="newCustomer"
		action="add?${_csrf.parameterName}=${_csrf.token}" method="post">
		<p>
			First name:
			<form:input path="firstName" value="Sergelen" />
			<form:errors path="firstName" cssStyle="color : red;" />
		</p>
		<p>
			Last name:
			<form:input path="lastName" value="Harry" />
			<form:errors path="lastName" cssStyle="color : red;" />
		</p>
		<p>
			Birthday:
			<form:input path="birthday" value="2000/01/01" />
			<form:errors path="birthday" cssStyle="color : red;" />
		</p>
		<p>
			Passport Id:
			<form:input path="passportId" value="123456780" />
			<form:errors path="passportId" cssStyle="color : red;" />
		</p>
		<p>
			Phone Number:
			<form:input path="phoneNumber" value="88888888" />
			<form:errors path="phoneNumber" cssStyle="color : red;" />
		</p>
		<p>
			Email:
			<form:input path="email" value="abc@abc.com" />
			<form:errors path="email" cssStyle="color : red;" />
		</p>
		<input type="submit" value="Submit">
	</form:form>


</body>
</html>