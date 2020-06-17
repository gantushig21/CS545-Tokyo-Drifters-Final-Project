<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/17/20
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/customers.js"/>"></script>
</head>
<body>
    <input type="text" id="searchPassportId" placeholder="Passport Id">
    <button id="searchByPassport">Search</button>

    <form:form modelAttribute="newCustomer"
               action="customer?${_csrf.parameterName}=${_csrf.token}" method="post">
        <form:hidden path="id" />
        <p>
            First name:
            <form:input path="firstName" id="firstName" />
            <form:errors path="firstName" cssStyle="color : red;" />
        </p>
        <p>
            Last name:
            <form:input path="lastName" id="lastName" />
            <form:errors path="lastName" cssStyle="color : red;" />
        </p>
        <p>
            Birthday:
            <form:input path="birthday" id="birthday" />
            <form:errors path="birthday" cssStyle="color : red;" />
        </p>
        <p>
            Passport Id:
            <form:input path="passportId" id="passportId" />
            <form:errors path="passportId" cssStyle="color : red;" />
        </p>
        <p>
            Phone Number:
            <form:input path="phoneNumber" id="phoneNumber" />
            <form:errors path="phoneNumber" cssStyle="color : red;" />
        </p>
        <p>
            Email:
            <form:input path="email" id="email" />
            <form:errors path="email" cssStyle="color : red;" />
        </p>
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
