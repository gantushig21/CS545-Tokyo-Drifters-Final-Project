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
    <title>Checkout List</title>
    <jsp:include page="parts/head.jsp" />
</head>
<body>
    <jsp:include page="parts/header.jsp" />

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
                    <c:forEach items="${checkouts}" var="checkout">
                        <tr>
                            <td>${checkout.customer.firstName} ${checkout.customer.lastName}</td>
                            <td>${checkout.car.factory}</td>
                            <td>${checkout.car.model}</td>
                            <td>${checkout.car.number}</td>
                            <td>${checkout.checkoutDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${checkout.returnDate eq null}">--</c:when>
                                    <c:otherwise>${checkout.returnDate}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${checkout.returnDate eq null}">Rented</c:when>
                                    <c:otherwise>Returned</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/checkouts/return?checkout_id=${checkout.id}">Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <jsp:include page="parts/pagination.jsp">
                <jsp:param name="pages" value="${pages}" />
                <jsp:param name="page" value="${page}" />
                <jsp:param name="type" value="checkouts" />
            </jsp:include>
        </div>
    </div>
    <jsp:include page="parts/footer.jsp" />

</body>
</html>
