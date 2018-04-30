<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>Manufacturer</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    <div class="container">
        <h3 class="page-title">Product</h3>
        <div class="block block-form">
            <div class="form-container">
                <%--@elvariable id="product" type="com.company.model.Product"--%>
                <form:form action="${contextPath}/new-product" modelAttribute="product" method="POST">
                    <form:input type="hidden" path="id" id="id"/>
                    <div class="form-group">
                        <form:label path="name" class="field-name">Name</form:label>
                        <form:input type="text" path="name" id="name" class="form-control"
                                    value="${edit ? product.name : ''}" />
                        <form:errors path="name" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="cost" class="field-name">Cost</form:label>
                        <form:input type="text" path="cost" id="cost" class="form-control"
                                    value="${edit ? product.cost : ''}" />
                        <form:errors path="cost" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="manufacturer" class="field-name">Manufacturer</form:label>
                        <select class="form-control" name="manufacturer" size="1">
                            <c:forEach var="manufacturer" items="${manufacturers}">
                                <option value="${manufacturer.id}"
                                        <c:if test="${manufacturer.id == product.manufacturer.id}"> selected </c:if>
                                >${manufacturer.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-g" value="Save"/>
                        <a href="${contextPath}/list-products" class="btn btn-r">Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>