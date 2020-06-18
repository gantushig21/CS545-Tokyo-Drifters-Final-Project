<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home Page</title>
<jsp:include page="parts/head.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resource/css/clock.css"/>" />
<script type="text/javascript"
	src="<spring:url value="/resource/js/clock.js"/>"></script>
</head>
<body>

	<jsp:include page="parts/header.jsp" />
	<div class="home-background">

		<jsp:include page="parts/clock.jsp" />

	</div>
	<jsp:include page="parts/footer.jsp" />
</body>
</html>