<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="<spring:url value="/resource/js/payment.js"/>"></script>
</head>
<body>
	<%@ include file="parts/Header.jsp"%>
	<div class="container">
		<div class="content-wrapper">
			<div>
				<h1>Payment</h1>
			</div>
			<div  style="margin:20px 0px 20px 0px;" class="error">
				
			</div>
			<div style="margin:20px 0px 20px 0px;">
			<fieldset style="padding:20px">
						<legend>Payment Detail:</legend>
			<form:form cssStyle="width: 100%;" action="add?${_csrf.parameterName}=${_csrf.token}">
			<c:forEach items="${payments}" var="payment" >
			<input style="margin:10px" type="radio" id="age1${payment.id}" name="paymentType" value="${payment.id}">
  <label for="age1">${payment.paymentType}</label><br>
			</c:forEach>
			</form:form>
			</fieldset>
			</div>
			
			<div style="text-align: center; float:right;margin-top:30px">
				<div style="display:inline;">
					<button style="display:inline-block;" class="btn" type="button" id="button-addon2">Cancel</button>
				</div>
				<div style="display:inline;">
					<button id="btnAddPayment" style="display:inline-block;" class="btn" type="button" id="button-addon2">Finish</button>
				</div>
			</div>
			
		</div>
	</div>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>