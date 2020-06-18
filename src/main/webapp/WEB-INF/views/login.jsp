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
    <link rel="stylesheet" href="<spring:url value="/resource/css/main.css"/>">
    <link rel="stylesheet" href="<spring:url value="/resource/css/index.css"/>">
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div>
                <div>
                    <img src="<spring:url value="/resource/images/logo.png"/>" style="width: 100%">
                </div>
                <form action="<spring:url value="/login"></spring:url>" method="post">
                    <div class="form-group">
                        <input class="form-control" placeholder="User Name" name='username' type="text">
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="Password" name='password'  type="password" value="">
                    </div>
                    <div class="form-group">
                        <input id="keepMe" type='checkbox' name="keepMe"/> <label for="keepMe">Remember Me?</label> <br/>
                    </div>
                    <div style="text-align: right;">
                        <input class="button button-default" style="margin-right: 0;" type="submit" value="Login">
                    </div>
                    <security:csrfInput />
                </form>
            </div>
        </div>
    </div>

</body>
</html>
