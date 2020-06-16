<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>

<style>
</style>

</head>
<body>
	<!-- <a href = "CS545-Tokyo-Drifters-Final-Project/customer/save" >Add a customer</a> -->

	<form:form action="add" method="get">
		<input type="submit" value="Add a Customer" />
	</form:form>

	<table id="customer_table" style="border: 1px solid black;">

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
				<form:form action="details/${customer.id}" method="get">
					<td><input type="submit" value="Details" /></td>
				</form:form>

			</tr>
		</c:forEach>
	</table>

</body>
</html>