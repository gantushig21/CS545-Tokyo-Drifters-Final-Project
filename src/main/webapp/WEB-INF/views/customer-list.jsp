<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="parts/meta.jsp"%>

<title>Customer List</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<spring:url value="/resource/js/customers.js"/>"></script>
<link rel="stylesheet"
	href="<spring:url value="/resource/css/index.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resource/css/customer.css"/>" />
<link rel="stylesheet"
	href="<spring:url value="/resource/css/cars.css"/>" />
	<link rel="stylesheet"
	href="<spring:url value="/resource/css/list-car.css"/>" />
<%@ include file="parts/Header.jsp"%>

</head>
<body>

	<div id="popupWindow" style="display: none">
		<div id="windowMessage"></div>
		<button id="windowCloseBtn">Close Window</button>
	</div>
	<div id="container">
		<div id="left">
			<input type="text" id="search" />
			<button id="searchBtn">Search</button>
		</div>
		<form:form id="right" action="customer/add" method="get">
			<input type="submit" value="Add a Customer" />
		</form:form>
		<div id="center"></div>
	</div>
	<div class="container">
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
							<td id="customerData"><c:out value="${customer.passportId}" />
							</td>
							<td id="customerData"><c:out value="${customer.firstName}" /></td>
							<td id="customerData"><c:out value="${customer.lastName}" /></td>
							<td id="customerData"><c:out value="${customer.birthday}" /></td>
							<td id="customerData"><c:out value="${customer.email}" /></td>
							<td id="customerData"><c:out value="${customer.phoneNumber}" />
							</td>
							<form:form action="customer/details/${customer.id}" method="get">
								<td><input type="submit" value="Details" /></td>
							</form:form>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="wrapper-pagination">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${pages}" step="1">
					<li class="page-item"><a class="page-link"
						href="customer?page=${i-1}&limit=${limit}">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>