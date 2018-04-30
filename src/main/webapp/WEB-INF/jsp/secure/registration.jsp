<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Registration</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    </sec:authorize>
    <div class="container">
        <h3 class="page-title">Registration form</h3>
        <div class="block block-form">
            <div class="form-container">
                <%--@elvariable id="user" type="com.company.model.User"--%>
                <form:form action="${contextPath}/registration" modelAttribute="user" method="POST">
                    <form:input type="hidden" path="id" id="id"/>
                    <div class="form-group">
                        <form:label path="email" class="field-name">Email</form:label>
                        <form:input type="text" path="email" id="email" class="form-control"/>
                        <form:errors path="email" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="password" class="field-name">Password</form:label>
                        <form:input type="password" path="password" id="password" class="form-control"/>
                        <form:errors path="password" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="confirmPassword" class="field-name">Confirm password</form:label>
                        <form:input type="password" path="confirmPassword" id="confirmPassword" class="form-control"/>
                        <form:errors path="confirmPassword" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="firstName" class="field-name">First name</form:label>
                        <form:input type="text" path="firstName" id="firstName" class="form-control"/>
                        <form:errors path="firstName" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <form:label path="lastName" class="field-name">Last name</form:label>
                        <form:input type="text" path="lastName" id="lastName" class="form-control"/>
                        <form:errors path="lastName" element="div" class="error"/>
                    </div>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <div class="form-group">
                            <form:label path="roles" class="field-name">Roles</form:label>
                            <select class="form-control" name="roles" size="1">
                                <c:forEach var="role" items="${listRoles}">
                                    <option value="${role.id}"
                                            <c:if test="${role.id == user.getRoles().iterator().next().getId()}"> selected </c:if>
                                    >${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </sec:authorize>
                    <div class="form-group">
                        <c:choose>
                            <c:when test="${edit}">
                                <input type="submit" class="btn btn-g" value="Update"/>
                                <a href="${contextPath}/list-users" class="btn btn-r">Cancel</a>
                            </c:when>
                            <c:otherwise>
                                <input type="submit" class="btn btn-g" value="Register"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>