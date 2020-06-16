<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/11/20
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table>
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
                    <td>${car.pricePerDay} $</td>
                    <td>${car.seats}</td>
                    <td>${car.overduePerDay }$</td>
                    <td><ct:dateFormat date="${car.createdDate}"/></td>
                    <td><ct:dateFormat date="${car.updatedDate}"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
