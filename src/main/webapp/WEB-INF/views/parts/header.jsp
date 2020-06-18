<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div style="display: flex; justify-content: space-between; background-color: #36304a;">
  <ul class="header">
    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/cars?page=0&limit=10">Cars</a></li>
    <li><a href="${pageContext.request.contextPath}/customer?page=0&limit=10">Customers</a></li>
    <li><a href="${pageContext.request.contextPath}/checkouts?page=0&limit=10">Checkouts</a></li>
  </ul>
  <ul class="header">
    <li>
      <security:authorize access="isAuthenticated()">
        <spring:url value="/logout" var="logout_url" />
        <form:form action="${logout_url}" class="form-horizontal" method="POST" >
          <button type="submit" id="btnAdd" class="button button-default">Logout</button>
        </form:form>
      </security:authorize>
    </li>
<%--    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>--%>
  </ul>
</div>
