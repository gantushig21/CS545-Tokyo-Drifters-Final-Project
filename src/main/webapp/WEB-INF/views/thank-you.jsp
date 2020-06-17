<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">
@import url("<spring:url value="http://localhost:8080/CS545-Tokyo-Drifters-Final-Project/resource/css/index.css"/>");
</style>

<%@ include file="parts/meta.jsp" %>  
<title>Home Page</title>

</head>
<body>
<%@ include file="parts/Header.jsp" %> 
<div class="container"> 
		<div class="content-wrapper">
			<div style="width:100%;margin:0 auto;text-align:center;">
				<p style="margin-bottom:20px">Thank you for using our services</p>
			<div style="display:inline; ">
					<a href="/CS545-Tokyo-Drifters-Final-Project/cars?page=0&limit=10" style="display:inline-block;" class="btn" type="button" id="button-addon2">Home Page</a>
				</div>
			</div>
		</div>
</div>
 <%@ include file="parts/Footer.jsp" %>  
</body>
</html>