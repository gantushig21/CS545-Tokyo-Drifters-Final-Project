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
	<title>List of Cars</title>
	<jsp:include page="parts/head.jsp" />
	<link rel="stylesheet" href="<spring:url value="/resource/css/list-car.css"/>" />
</head>
<body>
	<jsp:include page="parts/header.jsp" />
	<div class="container">
		<div class="flex-container">
		<c:forEach items="${cars}" var="car" >
			<div class="card car-card">
				<img class="card-img-top" src="<c:url value="/resource/images/${car.imagePath}"></c:url>" alt="car" style="width: 100%;">
				<div class="card-body">
					<h2 class="card-title">${car.model}</h2>
					<p><strong>Price: </strong> ${car.pricePerDay}</p>
					<p><strong>Status: </strong>${car.status}</p>
					<div class="row">
						<a href="cars/detail?id=${car.id}" class="button button-default">Detail</a>
						<c:if test="${car.status eq 'available'}">
							<a href="checkouts/search?carId=${car.id}" class="button button-default">Check Out</a>
						</c:if>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		<jsp:include page="parts/pagination.jsp">
			<jsp:param name="pages" value="${pages}" />
			<jsp:param name="page" value="${page}" />
			<jsp:param name="type" value="cars" />
		</jsp:include>
	</div>
	<%@ include file="parts/footer.jsp"%>
</body>
</html>
