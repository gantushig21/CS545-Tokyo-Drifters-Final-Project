<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customer List</title>
	<%@ include file="parts/meta.jsp"%>
	<%@ include file="parts/Header.jsp"%>
</head>
<body>
	<div class="container">
		<div class="section">
			<form:form action="customer/add" method="get">
				<input type="submit" value="Add a Customer" />
			</form:form>

			<table id="customer_table">
				<thead>
					<tr>
						<th>Passport Id</th>
						<th>First name</th>
						<th>Last name</th>
						<th>Birthday</th>
						<th>Email</th>
						<th>Phone number</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customers}" var="customer" varStatus="theCount">
						<tr>
							<td><c:out value="${customer.passportId}"/></td>
							<td><c:out value="${customer.firstName}" /></td>
							<td><c:out value="${customer.lastName}" /></td>
							<td><c:out value="${customer.birthday}" /></td>
							<td><c:out value="${customer.email}" /></td>
							<td><c:out value="${customer.phoneNumber}" /></td>
							<td>
								<a href="${pageContext.request.contextPath}/customer/details/${customer.id}">Details</a>
							</td>
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
</body>
</html>