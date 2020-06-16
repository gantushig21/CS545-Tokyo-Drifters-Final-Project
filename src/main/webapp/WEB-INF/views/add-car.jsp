<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/11/20
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<html>
<head>
    <title>Add Car</title>
</head>
<body>
    <form:form modelAttribute="newCar" action="add">
        Factory: <form:input path="factory" id="factory" value="Toyota" /><p />
        Model: <form:input path="model" id="model" value="corolla" /><p />
        Number: <form:input path="number" id="number" value="KF8 457" /><p />
        Status:  <form:select path="status" id="type" value="available">
            <form:option value="available" label="Available" />
            <form:option value="notAvailable" label="Not Available" />
            <form:option value="repair" label="Repair" />
        </form:select><p />
        Type: <form:select path="type" id="type" value="miniCar">
            <form:option value="miniCar" label="Mini Car" />
            <form:option value="familyCar" label="Family Car" />
            <form:option value="pickup" label="Pick Up" />
        </form:select><p />
        Price Per Day: <form:input path="pricePerDay" id="pricePerDay" value="12" /><p />
        Seats: <form:input path="seats" id="seats" value="2" /><p />
        Overdue Per Day: <form:input path="overduePerDay" id="overduePerDay" value="14" /><p />
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
