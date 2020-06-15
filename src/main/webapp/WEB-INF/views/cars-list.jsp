<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/11/20
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<style type="text/css">
@import url("<spring:url value="resource/css/index.css"/>");
</style>
<style type="text/css">
@import url("<spring:url value="resource/css/list-car.css"/>");
</style>
<%@ include file="parts/meta.jsp"%>
<title>Title</title>
<%@ include file="parts/Header.jsp"%>
</head>
<body>

	<div class="container">
	<div class="flex-container">
	<c:forEach begin="0" end="11" varStatus="loop">
	
		<div class="card" style="width: 188px;">
			<img class="card-img-top" src="..." alt="Card image cap">
			<div class="card-body">
				<p class="card-title">Card title</p>
				<p>Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<a href="#" class="btn">Go somewhere</a>
			</div>
			
		</div>
		
		
		</c:forEach>
		</div>
	</div>
<%-- 	<table>
		<thead>
			<tr>
				<th>Factory</th>
				<th>Model</th>
				<th>Number</th>
				<th>Status</th>
				<th>Type</th>
				<th>Price per Day</th>
				<th>Seats</th>
				<th>Overdue per Day</th>
				<th>Created</th>
				<th>Updated</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cars}" var="car">
				<tr>
					<td>${car.factory}</td>
					<td>${car.model}</td>
					<td>${car.number}</td>
					<td>${car.status}</td>
					<td>${car.type}</td>
					<td>${car.pricePerDay}$</td>
					<td>${car.seats}</td>
					<td>${car.overduePerDay }$</td>
					<td><ct:dateFormat date="${car.createdDate}" /></td>
					<td><ct:dateFormat date="${car.updatedDate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>
