<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">@import url("<spring:url value="http://localhost:8080/CS545-Tokyo-Drifters-Final-Project/resource/css/index.css"/>");
</style>

<%@ include file="parts/meta.jsp"%>
<title>Home Page</title>
<meta name="_csrf_token" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_parameterName" content="${_csrf.parameterName}" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resource/js/CheckOutDetail.js"/>"></script>
</head>
<body>
	<%@ include file="parts/Header.jsp"%>
	<div class="container">
		<div class="content-wrapper">
			<div>
				<h1>Check Out Detail</h1>
			</div>
			<div style="margin-top:20px;">
				<form action="/action_page.php">
					<fieldset style="padding:20px">
						<legend>Customer Detail:</legend>
						<label for="fname">First name:</label> <p style="display:inline-block">${car.model}</p>
						<br> <label for="lname">Last name:</label> <input type="text"
							id="lname" name="lname"><br>
						<br> <label for="email">Email:</label> <input type="email"
							id="email" name="email"><br>
						<br> <label for="birthday">Birthday:</label> <input
							type="date" id="birthday" name="birthday"><br>
					</fieldset>
				</form>
			</div>
			<div  style="margin-top:20px;">
				<form action="/action_page.php">
					<fieldset style="padding:20px">
						<legend>Car Detail:</legend>
						<label for="fname">Model:</label> <p style="display:inline">${car.model}</p><br>
						<br> <label for="lname">Factory:</label> <p style="display:inline">${car.factory}</p><br>
						<br> <label for="email">Type:</label> <p style="display:inline">${car.type}</p><br>
						<br> <label for="birthday">Price Per Day:</label> <p style="display:inline">${car.pricePerDay}</p><br>
					</fieldset>
				</form>
			</div>
			
			<div class="searchUser-content"></div>
			<div style="text-align: center; float:right;margin-top:30px">
				<div style="display:inline;">
					<button style="display:inline-block;" class="btn" type="button" id="button-addon2">Cancel</button>
				</div>
				<div style="display:inline;">
					<a href="/CS545-Tokyo-Drifters-Final-Project/check-out/payment" style="display:inline-block;" class="btn" type="button" id="button-addon2">Next</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>