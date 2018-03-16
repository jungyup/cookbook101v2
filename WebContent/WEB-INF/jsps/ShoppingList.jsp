<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="inx"/>
<c:url value="/deleteShoppingList" var="dsp"/>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<h:choose>
    <h:when test="${userList==null}">
        <h:redirect url="${inx}" />
    </h:when>
    <h:otherwise>
<html>
<head>
    <title>Shopping List</title>
    <!--bootstrap-->
    <link href="${css_boot}" rel="stylesheet" type="text/css"/>
    <!--css-->
    <link href="${css_style}" rel="stylesheet" type="text/css"/>
    <!--js-->
    <script src="${js_jquery}" type="text/javascript"></script>
    <script src="${js_bts}" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="bs-docs-example">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Title</th>
                <th>Cuisine</th>
                <th>Description</th>
                <th>Ingredients</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <h:forEach items="${shop}" var="r">
                <tr class="success">
                    <td>${r.title}</td>
                    <td>${r.cuisine}</td>
                    <td>${r.description}</td>
                    <td>${r.ingredients}</td>
                    <td><a href="${dsp}/${r.cart_Id}" style="color:red;">Remove</a> </td>
                </tr>
            </h:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
</h:otherwise>
</h:choose>