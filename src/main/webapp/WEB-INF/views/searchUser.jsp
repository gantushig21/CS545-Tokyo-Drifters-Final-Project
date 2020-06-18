<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<title>Checkout Car for Customer</title>
	<jsp:include page="parts/head.jsp" />
	<script src="<spring:url value="/resource/js/searchUser.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resource/css/rent.css"/>" />
</head>
<body>
	<jsp:include page="parts/header.jsp" />

	<div class="container">
		<div class="content-wrapper">
			<div class="input-group mb-3">
				<input
						id="passportID"
						type="text"
						class="form-control"
						style="max-width: 200px;"
						placeholder="Please input Passport ID"
				>
				<button
						id="searchUser"
						class="button button-default"
				>
					Search
				</button>
			</div>
			<div style="width: 100%;" id="customerSection">

			</div>
			<div id="searchUserGroup" class="searchUser-content">

			</div>
		</div>
	</div>
	<jsp:include page="parts/footer.jsp" />
</body>
</html>