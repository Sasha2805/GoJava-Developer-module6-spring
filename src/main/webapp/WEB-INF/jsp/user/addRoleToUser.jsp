<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>Add role</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    <div class="container">
        <h3 class="page-title">Add role</h3>
        <div class="block block-form">
            <div class="form-container">
                <%--@elvariable id="role" type="com.company.model.Role"--%>
                <form:form action="${contextPath}/add-role-to-user-${userId}" modelAttribute="role" method="POST">
                    <div class="form-group">
                        <c:forEach var="role" items="${roles}">
                            <input type="hidden" name="id" value="${role.id}">
                        </c:forEach>
                        <select class="form-control" name="name" size="1">
                            <c:forEach var="role" items="${roles}">
                                <option>${role.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-g" value="Save"/>
                        <a href="${contextPath}/user-roles-${userId}" class="btn btn-r">Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>