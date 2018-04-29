<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Spring Security</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <sec:authorize access="isAuthenticated()">
        <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    </sec:authorize>
    <div class="container">
        <div class="block block-presentation">
            <h1>Spring MVC</h1>
            <p>Welcome to my first Spring application!</p>
            <sec:authorize access="!isAuthenticated()">
                <div class="block-lg">
                    <a class="btn btn-r" href="${contextPath}/login" role="button">Log in</a>
                    <a class="btn btn-g" href="${contextPath}/registration" role="button">Create an account</a>
                </div>
            </sec:authorize>
        </div>

        <sec:authorize access="isAuthenticated()">
            <div class="block block-actions">
                <div class="row">
                    <div class="col-sm-3 action">
                        <h3>Manufacturer</h3>
                        <p><a href="">Add manufacturer</a></p>
                        <p><a href="">Edit manufacturer</a></p>
                        <p><a href="${contextPath}/list_manufacturers">List manufacturers</a></p>
                        <p><a href="">Delete manufacturer</a></p>
                    </div>
                    <div class="col-sm-3 action">
                        <h3>Product</h3>
                        <p><a href="">Add product</a></p>
                        <p><a href="">Edit product</a></p>
                        <p><a href="">List products</a></p>
                        <p><a href="">Delete product</a></p>
                    </div>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <div class="col-sm-3 action">
                            <h3>User</h3>
                            <p><a href="">Add user</a></p>
                            <p><a href="">Edit user</a></p>
                            <p><a href="">List users</a></p>
                            <p><a href="">Delete user</a></p>
                        </div>
                        <div class="col-sm-3 action">
                            <h3>Role</h3>
                            <p><a href="">Add role</a></p>
                            <p><a href="">Edit role</a></p>
                            <p><a href="">List roles</a></p>
                            <p><a href="">Delete role</a></p>
                        </div>
                    </sec:authorize>
                </div>
            </div>
        </sec:authorize>
    </div>
</div>
</body>
</html>