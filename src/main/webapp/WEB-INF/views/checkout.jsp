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
    <title>Checkout Information</title>
    <jsp:include page="parts/head.jsp" />
    <link rel="stylesheet" href="<spring:url value="/resource/css/rent.css"/>" />
    <link rel="stylesheet" href="<spring:url value="/resource/css/list-car.css"/>" />
    <script type="text/javascript" src="<spring:url value="/resource/js/rent.js"/>"></script>
</head>
<body>
<jsp:include page="parts/header.jsp" />

<div class="form-container">
    <div class="rent-card">
        <h3>Car Information</h3>
        <div class="info-lines">
            <div class="row">
                <div class="col-6"><label><strong>Factory:</strong> ${checkout.car.factory}</label></div>
                <div class="col-6"><label><strong>Model:</strong> ${checkout.car.model}</label></div>
            </div>
            <div class="row">
                <div class="col-6"><label><strong>Status:</strong> ${checkout.car.status}</label></div>
                <div class="col-6"><label><strong>Number:</strong> ${checkout.car.number}</label></div>
            </div>
            <div class="row">
                <div class="col-6"><label><strong>Type:</strong> ${checkout.car.type}</label></div>
                <div class="col-6"><label><strong>Seats:</strong> ${checkout.car.seats}</label></div>
            </div>
            <div class="row">
                <div class="col-6"><label><strong>Price per Day:</strong> ${checkout.car.pricePerDay}</label></div>
                <div class="col-6"><label><strong>Overdue per Day:</strong> ${checkout.car.overduePerDay}</label></div>
            </div>
        </div>

        <h3>Customer Information</h3>
        <div class="info-lines">
            <div class="row">
                <div class="col-6"><label><strong>First Name:</strong> ${checkout.customer.firstName}</label></div>
                <div class="col-6"><label><strong>Last Name:</strong> ${checkout.customer.lastName}</label></div>
            </div>
            <div class="row">
                <div class="col-6"><label><strong>Passport ID:</strong> ${checkout.customer.passportId}</label></div>
                <div class="col-6"><label><strong>Birthday:</strong> checkout.customer.birthday</label></div>
            </div>
            <div class="row">
                <div class="col-6"><label><strong>Phone Number:</strong> ${checkout.customer.phoneNumber}</label></div>
                <div class="col-6"><label><strong>Email:</strong> ${checkout.customer.email}</label></div>
            </div>
        </div>
        <h3>Checkout Detail</h3>
        <form id="rentForm" style="width: 100%;" action="add?${_csrf.parameterName}=${_csrf.token}" method="post">
            <c:choose>
                <c:when test="${action eq 'return'}">
                    <input type="hidden" name="id" value="${checkout.id}">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="car_id" value="${checkout.car.id}">
                    <input type="hidden" name="customer_id" value="${checkout.customer.id}">
                </c:otherwise>
            </c:choose>
            <div class="info-lines">
                <div class="row">
                    <div class="col-6">
                        <div class="date-div">
                            <label><strong>Checkout Date: </strong></label>
                            <input
                                    id="checkoutDate"
                                    value="${checkout.checkoutDate}"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    disabled="true"
                            />
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="date-div">
                            <label><strong>Due Date: </strong></label>
                            <input
                                    id="dueDate"
                                    value="<c:choose><c:when test="${action eq 'return'}">${checkout.dueDate}</c:when><c:otherwise></c:otherwise></c:choose>"
                                    name="dueDate"
                                    cssClass="form-control"
                                    required="true"
                                    type="date"
                                    <c:if test="${action eq 'return'}">disabled</c:if>
                                    onchange="dueDateChange(${checkout.car.pricePerDay}, this.value)"
                            />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="date-div">
                            <label id="rentCost"><strong>Checkout Cost: </strong>${checkout.rentCost} $</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <c:if test="${action eq 'return'}">
                            <div class="date-div">
                                <label><strong>Return Date: </strong></label>
                                <input
                                        id="returnDate"
                                        value="${checkout.returnDate}"
                                        name="returnDate"
                                        cssClass="form-control"
                                        required="true"
                                        type="date"
                                        onchange="returnDateChange(${checkout.car.overduePerDay}, this.value)"
                                />
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <c:if test="${action eq 'return'}">
                            <div class="date-div">
                                <label id="overdueCost"><strong>Overdue Cost: </strong>${checkout.feeForOverdue} $</label>
                                <input type="hidden" name="overdueCost" id="overdueCostInput">
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="form-group" style="text-align: right;">
                <c:choose>
                    <c:when test="${action eq 'return'}">
                        <button id="returnBtn" class="button button-default" type="button">Return Car</button>
                    </c:when>
                    <c:otherwise>
                        <button id="rentBtn" class="button button-default" type="submit">Submit</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
    </div>
</div>
<jsp:include page="parts/footer.jsp" />
</body>
</html>
