<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/16/20
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>Title</title>
    <%@ include file="parts/meta.jsp"%>
    <%@ include file="parts/Header.jsp"%>
</head>
<body>
    <div class="container">
        <div class="section">
            <table>
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Car Factory</th>
                        <th>Model</th>
                        <th>Number</th>
                        <th>Checkout</th>
                        <th>Returned</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${rents}" var="rent">
                        <tr>
                            <td>${rent.customer.firstName} ${rent.customer.lastName}</td>
                            <td>${rent.car.factory}</td>
                            <td>${rent.car.model}</td>
                            <td>${rent.car.number}</td>
                            <td>${rent.checkoutDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${rent.returnDate eq null}">--</c:when>
                                    <c:otherwise>${rent.returnDate}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${rent.returnDate eq null}">Rented</c:when>
                                    <c:otherwise>Returned</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/rent/return?rent_id=${rent.id}">Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <jsp:include page="parts/pagination.jsp">
                <jsp:param name="pages" value="${pages}" />
                <jsp:param name="page" value="${page}" />
                <jsp:param name="type" value="rent" />
            </jsp:include>
        </div>
    </div>
</body>
</html>
