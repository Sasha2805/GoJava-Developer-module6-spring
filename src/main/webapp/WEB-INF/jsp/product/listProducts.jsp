<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta content="text/html; charset=UTF-8">
    <title>Products</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>

<body>
<div class="wrapper">
    <%@include file="/WEB-INF/jsp/secure/authHeader.jsp" %>
    <div class="container">
        <h3 class="page-title">List of all products</h3>
        <div class="block block-table">
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Cost</th>
                            <th scope="col">Manufacturer</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td><c:out value="${product.name}"/></td>
                            <td><c:out value="${product.cost}"/></td>
                            <td><c:out value="${product.manufacturer.name}"/></td>
                            <td><a href="${contextPath}/edit-product-${product.id}">Edit</a></td>
                            <td><a href="${contextPath}/delete-product-${product.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btn-block">
            <a href="${contextPath}/new-product" class="btn btn-g">Add product</a>
            <a href="${contextPath}/" class="btn btn-r">Back</a>
        </div>
    </div>
</div>
</body>
</html>