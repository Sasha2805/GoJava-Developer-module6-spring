<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <div class="container">
        <h3 class="page-title">Log in to Spring MVC</h3>
        <div class="block block-form">
            <div class="form-container">
                <form action="${contextPath}/login" method="POST">
                    <c:if test="${param.error != null}">
                        <div class="error">
                            <span>Incorrect login or password</span>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label class="field-name">Email</label>
                        <input type="text" class="form-control" name="username">
                    </div>
                    <div class="form-group">
                        <label class="field-name">Password</label>
                        <input type="password" class="form-control" name="password">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-r">Log in</button>
                </form>
            </div>
         </div>
    </div>
</div>
</body>
</html>