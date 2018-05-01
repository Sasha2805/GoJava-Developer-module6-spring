<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>Role</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    <div class="container">
        <h3 class="page-title">Role</h3>
        <div class="block block-form">
            <div class="form-container">
                <%--@elvariable id="role" type="com.company.model.Role"--%>
                <form:form action="${contextPath}/new-role" modelAttribute="role" method="POST">
                    <form:input type="hidden" path="id" id="id"/>
                    <div class="form-group">
                        <form:label path="name" class="field-name">Name</form:label>
                        <form:input type="text" path="name" id="name" class="form-control"
                                    value="${edit ? role.name : ''}" />
                        <form:errors path="name" element="div" class="error"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-g" value="Save"/>
                        <a href="${contextPath}/list-roles" class="btn btn-r">Cancel</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>