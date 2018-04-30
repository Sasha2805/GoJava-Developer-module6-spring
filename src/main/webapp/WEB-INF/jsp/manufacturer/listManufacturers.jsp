<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>Manufacturers</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    <div class="container">
        <h3 class="page-title">List of all manufacturers</h3>
        <div class="block block-table">
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="manufacturer" items="${manufacturers}">
                        <tr>
                            <td><c:out value="${manufacturer.name}"/></td>
                            <td><a href="${contextPath}/edit-manufacturer-${manufacturer.id}">Edit</a></td>
                            <td><a href="${contextPath}/delete-manufacturer-${manufacturer.id}">Delete</a></td>
                            <td><a href="${contextPath}/manufacturer-products-${manufacturer.id}">Products</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btn-block">
            <a href="${contextPath}/new-manufacturer" class="btn btn-g">Add manufacturer</a>
            <a href="${contextPath}/" class="btn btn-r">Back</a>
        </div>
    </div>
</div>
</body>
</html>