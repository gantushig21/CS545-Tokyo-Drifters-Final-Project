<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">
@import url("<spring:url value="resource/css/index.css"/>");
</style>

<%@ include file="parts/meta.jsp"%>
<title>Home Page</title>
<meta name="_csrf_token" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_parameterName" content="${_csrf.parameterName}" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resource/js/searchUser.js"/>"></script>
</head>
<body>
	<%@ include file="parts/Header.jsp"%>
	<div class="container">
		<div class="content-wrapper">
			<div class="input-group mb-3">
				<input id="passportID" type="text" class="text-field"
					placeholder="Please input Passport ID" aria-label="Passport ID"
					aria-describedby="button-addon2">
				<button id="searchUser" style="margin-left: 10px" class="btn"
					type="button" id="button-addon2">Search</button>
			</div>
			<div class="info" style="margin-top: 20px;"></div>
			<div class="user-form">
				<form id="userForm" >
					<fieldset style="padding:20px;">
						<legend>Create User</legend>
						<div class="error" style="color:red"></div>
						<label for="firstName">First name:</label> <input type="text"
							id="firstName" name="firstName"><br>
						<br> <label for="lastName">Last name:</label> <input type="text"
							id="lastName" name="lastName"><br>
						<br> <label for="email">Email:</label> <input type="email"
							id="email" name="email"><br>
						<br> <label for="birthday">Birthday:</label> <input
							type="date" id="birthday" name="birthday"><br>
							<br> <label for="passportId">Passport ID:</label> <input
							type="text" id="passportId" name="passportId"><br>
							<br> <label for="phoneNumber">Phone Number:</label> <input
							type="text" id="phoneNumber" name="phoneNumber"><br>
						<br> 
						<button id="create-user" style="display: inline-block; float:right;" class="btn" type="button"
							id="button-addon2">Create User</button>
					</fieldset>
				</form>
			</div>
			<div id="searchUserGroup" class="searchUser-content">
				<div style="text-align: center; float: right; margin-top: 30px">
					<div style="display: inline;">
						<a href="/CS545-Tokyo-Drifters-Final-Project/cars?page=0&limit=10" style="display: inline-block;" class="btn" type="button"
							id="button-addon2">Cancel</a>
					</div>
					<div style="display: inline;">
						<a href="check-out/detail" style="display: inline-block;"
							class="btn" type="button" id="button-addon2">Next</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>