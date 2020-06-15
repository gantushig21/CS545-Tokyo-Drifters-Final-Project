<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/11/20
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login page</h1>
    <form action="<spring:url value="/login"></spring:url>" method="post">
        <fieldset>
            <div class="form-group">
                <input class="form:input-large" placeholder="User Name" name='username' type="text">
            </div>
            <div class="form-group">
                <input class=" form:input-large" placeholder="Password" name='password'  type="password" value="">
            </div>
            <div class="form-group">
                <input type='checkbox' name="keepMe"/>Remember Me? <br/>
            </div>
            <input class="btn btn-lg btn-success btn-mini" type="submit" value="Login">
        </fieldset>
        <security:csrfInput />
    </form>
</body>
</html>
