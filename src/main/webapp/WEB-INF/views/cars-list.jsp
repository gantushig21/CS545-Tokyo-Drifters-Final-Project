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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/cars.js"/>"></script>
    
</head>
<body>

	<div class="container">
	<div class="flex-container">
	<c:forEach items="${cars}" var="car" >
		<div class="card" style="width: 18%;">
			<img class="card-img-top" src="<c:url value="/resource/images/${car.imagePath}"></c:url>" alt="car" style="width: 100%;">
			<div class="card-body">
				<h2 class="card-title">${car.model}</h2>
				<p>${car.pricePerDay}</p>
				<p>${car.status}</p>
				<a href="cars/detail?id=${car.id}" class="btn">Detail</a>
				<a href="cars/detail?id=${car.id}" class="btn">Checkout</a>
			</div>
		</div>
		</c:forEach>
		</div>
		<div class="wrapper-pagination">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${pages}" step="1">
					<li class="page-item"><a class="page-link" href="cars?page=${i-1}&limit=${limit}">${i}</a></li>
				</c:forEach>
  			</ul>
		</div>
	</div>
	<%@ include file="parts/Footer.jsp"%>
</body>
</html>
