<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<title>Customer List</title>
	<jsp:include page="parts/head.jsp" />

	<link rel="stylesheet" href="<spring:url value="/resource/css/customer.css"/>" />
	<script type="module" src="<spring:url value="/resource/js/customers.js"/>"></script>

<%--	<script type="text/javascript"--%>
<%--	src="<spring:url value="/resource/js/customers.js"/>"></script>--%>
<%--<link rel="stylesheet"--%>
<%--	href="<spring:url value="/resource/css/customer.css"/>" />--%>
<%--<link rel="stylesheet"--%>
<%--	href="<spring:url value="/resource/css/cars.css"/>" />--%>
<%--	<link rel="stylesheet"--%>
<%--	href="<spring:url value="/resource/css/list-car.css"/>" />--%>
<%--<%@ include file="parts/header.jsp"%>--%>

</head>
<body>
	<jsp:include page="parts/header.jsp" />

	<div id="popupWindow" style="display: none">
		<div id="windowMessage" style="width: 100%;"></div>
		<div style="text-align: right; width: 100%;">
			<button id="windowCloseBtn" class="button button-default">Close Window</button>
		</div>
	</div>

	<div class="container">
		<div class="section">
			<div style="display: flex; justify-content: space-between;">
				<a href="customer/add" class="button button-default button-link">Add a Customer</a>
				<div id="left">
					<input type="text" class="form-control" id="search" />
					<button id="searchBtn" class="button button-default" >Search</button>
				</div>
			</div>
		</div>
		<div class="section">
			<table>
				<thead>
					<tr>
						<th>Passport Id</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Birthday</th>
						<th>Email</th>
						<th>Phone number</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customers}" var="customer" varStatus="theCount">
						<tr>
							<td><c:out value="${customer.passportId}" /></td>
							<td><c:out value="${customer.firstName}" /></td>
							<td><c:out value="${customer.lastName}" /></td>
							<td><c:out value="${customer.birthday}" /></td>
							<td><c:out value="${customer.email}" /></td>
							<td><c:out value="${customer.phoneNumber}" /></td>
							<td><a href="customer/details/${customer.id}" class="button button-default button-link">Details</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<jsp:include page="parts/pagination.jsp">
				<jsp:param name="pages" value="${pages}" />
				<jsp:param name="page" value="${page}" />
				<jsp:param name="type" value="customer" />
			</jsp:include>
		</div>
	</div>
	<jsp:include page="parts/footer.jsp" />

</body>
</html>