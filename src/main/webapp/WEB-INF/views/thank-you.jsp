<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<title>Thank You Page</title>
	<jsp:include page="parts/head.jsp" />
</head>
<body>
<jsp:include page="parts/header.jsp" />
<div class="container"> 
		<div class="content-wrapper">
			<div style="width:100%;margin:0 auto;text-align:center;">
				<p style="margin-bottom:20px">Thank you for using our services</p>
			<div style="display:inline; ">
					<a href="${pageContext.request.contextPath}/cars?page=0&limit=10" style="display:inline-block;" class="button button-default" type="button" id="button-addon2">Go back to car list</a>
				</div>
			</div>
		</div>
</div>
<jsp:include page="parts/footer.jsp" />
</body>
</html>