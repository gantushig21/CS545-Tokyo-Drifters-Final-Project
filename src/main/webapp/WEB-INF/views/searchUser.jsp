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
 <meta name="_csrf_token" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_parameterName" content="${_csrf.parameterName}"/>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/searchUser.js"/>"></script>
</head>
<body>
	<%@ include file="parts/Header.jsp"%>
	<div class="container">
		<div class="content-wrapper">
			<div class="input-group mb-3">
				<input id="passportID" type="text" class="text-field"
					placeholder="Please input Passport ID" aria-label="Passport ID"
					aria-describedby="button-addon2">
				<button id="searchUser" style="margin-left:10px" class="btn" type="button" id="button-addon2">Search</button>
			</div>
			<div class="info" style="margin-top:20px;"></div>
			<div id="searchUserGroup" class="searchUser-content">
			<div style="text-align: center; float:right;margin-top:30px">
				<div style="display:inline;">
					<button style="display:inline-block;" class="btn" type="button" id="button-addon2">Cancel</button>
				</div>
				<div style="display:inline;">
					<a href="check-out/detail" style="display:inline-block;" class="btn" type="button" id="button-addon2">Next</a>
				</div>
			</div>
			</div>
		</div>
		</div>
		<%@ include file="parts/Footer.jsp"%>
</body>
</html>