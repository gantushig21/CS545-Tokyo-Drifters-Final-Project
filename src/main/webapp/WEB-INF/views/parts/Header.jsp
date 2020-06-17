<%@ page language="java"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="<spring:url value="/resource/css/header.css"/>" />
  <link rel="stylesheet" href="<spring:url value="/resource/css/index.css"/>" />
<%--  <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">--%>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
<ul class="header">
  <li><a href="${pageContext.request.contextPath}/cars?page=0&limit=10">Cars</a></li>
  <li><a href="${pageContext.request.contextPath}/cars/add">Add Car</a></li>
  <li><a href="${pageContext.request.contextPath}/customer?page=0&limit=10">Customers</a></li>
  <li><a href="${pageContext.request.contextPath}/rent?page=0&limit=10">Rents</a></li>
</ul>
</body>
</html>