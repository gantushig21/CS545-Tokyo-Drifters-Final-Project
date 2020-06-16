<%--
  Created by IntelliJ IDEA.
  User: gantushig
  Date: 6/15/20
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" uri="/WEB-INF/tlds/ct.tld" %>

<html>
<head>
    <title>Title</title>
    <%@ include file="parts/Header.jsp"%>

    <meta name="_csrf_token" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_parameterName" content="${_csrf.parameterName}"/>
    <link rel="stylesheet" href="<spring:url value="/resource/css/rent.css"/>" />
    <link rel="stylesheet" href="<spring:url value="/resource/css/main.css"/>" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/resource/js/rent.js"/>"></script>

</head>
<body>
<div class="form-container">
    <div class="rent-card">
        <h3>Car Information</h3>
        <div class="info-lines">
            <div class="info-line">
                <label><strong>Factory:</strong> ${rent.car.factory}</label>
                <label><strong>Model:</strong> ${rent.car.model}</label>
            </div>
            <div class="info-line">
                <label><strong>Status:</strong> ${rent.car.status}</label>
                <label><strong>Number:</strong> ${rent.car.number}</label>
            </div>
            <div class="info-line">
                <label><strong>Type:</strong> ${rent.car.type}</label>
                <label><strong>Seats:</strong> ${rent.car.seats}</label>
            </div>
            <div class="info-line">
                <label><strong>Price per Day:</strong> ${rent.car.pricePerDay}</label>
                <label><strong>Overdue per Day:</strong> ${rent.car.overduePerDay}</label>
            </div>
        </div>

        <h3>Customer Information</h3>
        <div class="info-lines">
            <div class="info-line">
                <label><strong>First Name:</strong> ${rent.customer.firstName}</label>
                <label><strong>Last Name:</strong> ${rent.customer.lastName}</label>
            </div>
            <div class="info-line">
                <label><strong>Passport ID:</strong> ${rent.customer.passportId}</label>
                <label><strong>Birthday:</strong> <ct:dateFormat date="${rent.customer.birthday}"/></label>
            </div>
            <div class="info-line">
                <label><strong>Phone Number:</strong> ${rent.customer.phoneNumber}</label>
                <label><strong>Email:</strong> ${rent.customer.email}</label>
            </div>
        </div>
        <h3>Rent Detail</h3>
        <form id="rentForm" style="width: 100%;" action="add?${_csrf.parameterName}=${_csrf.token}" method="post">
            <c:choose>
                <c:when test="${action eq 'return'}">
                    <input type="hidden" name="id" value="${rent.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="car_id" value="${rent.car.id}">
                    <input type="hidden" name="customer_id" value="${rent.customer.id}">
                </c:otherwise>
            </c:choose>
            <div class="info-lines">
                <div class="info-line">
                    <div class="date-div">
                        <label><strong>Checkout Date:</strong></label>
                        <div>
                            <input
                                    id="checkoutDate"
                                    value="${rent.checkoutDate}"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    disabled="true"
                            />
                            <span class="form-span">
                        </span>
                        </div>
                    </div>
                    <div class="date-div">
                        <label><strong>Due Date:</strong></label>
                        <div>
                            <input
                                    id="dueDate"
                                    value="<c:choose><c:when test="${action eq 'return'}">${rent.dueDate}</c:when><c:otherwise></c:otherwise></c:choose>"
                                    name="dueDate"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    <c:if test="${action eq 'return'}">disabled</c:if>
                                    onchange="dueDateChange(${rent.car.pricePerDay}, this.value)"
                            />
                        </div>
                    </div>
                </div>
                <div class="info-line">
                    <div class="date-div">
                        <label id="rentCost"><strong>Rent Cost:</strong>${rent.rentCost} $</label>
                    </div>
                    <c:if test="${action eq 'return'}">
                        <div class="date-div">
                            <label><strong>Return Date:</strong></label>
                            <div>
                                <input
                                        id="returnDate"
                                        value="${rent.returnDate}"
                                        name="returnDate"
                                        cssClass="form-control"
                                        required="true"
                                        type="date"
                                        onchange="returnDateChange(${rent.car.overduePerDay}, this.value)"
                                />
                            </div>
                        </div>
                    </c:if>
                </div>
                <c:if test="${action eq 'return'}">
                    <div class="info-line">
                        <div class="date-div">
                            <label id="overdueCost"><strong>Overdue Cost:</strong>${rent.feeForOverdue} $</label>
                            <input type="hidden" name="overdueCost" id="overdueCostInput">
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="form-group" style="text-align: right;">
                <c:choose>
                    <c:when test="${action eq 'return'}">
                        <button id="returnBtn" class="button button-default" type="button">Return</button>
                    </c:when>
                    <c:otherwise>
                        <button id="rentBtn" class="button button-default" type="submit">Submit</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
    </div>
</div>
</body>
</html>
