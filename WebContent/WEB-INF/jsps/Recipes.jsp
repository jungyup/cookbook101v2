<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="inx"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/searching" var="sch"/>
<c:url value="/shopping" var="sc"/>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<h:choose>
    <h:when test="${userList==null}">
        <h:redirect url="${inx}" />
    </h:when>
    <h:otherwise>
<html>
<head>
    <title>Recipes</title>
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
    <br/>
        <form  action="${sch}" method="post">
            <input style="padding: 7px 29px;" name="title" type="text" required="required"/>
            <select name="cuisine" style="padding: 7px 29px;">
                <option value="">Select</option>
                <option value="Pakistani">Pakistani</option>
                <option value="Indian">Indian</option>
                <option value="Italian">Italian</option>
                <option value="Canadian">Canadian</option>
                <option value="Turkish">Turkish</option>
            </select>
            <input type="submit" value="Search"/>
        </form>
        <div class="bs-docs-example">
            <table class="table table-bordered">
            <thead>
            <tr><th colspan="7" style="text-align:center; font-weight: bolder;">Recipe</th></tr>
            <tr>
                <th>Title</th>
                <th>Cuisine</th>
                <th>Description</th>
                <th>Preparation Time</th>
                <th>Ingredients</th>
                <th>Steps</th>
                <th colspan="2" halign="center">Action</th>
            </tr>
            </thead>
            <tbody>
            <h:forEach items="${repList}" var="r">
                <tr class="success">
                    <td>${r.title}</td>
                    <td>${r.cuisine}</td>
                    <td>${r.description}</td>
                    <td>${r.preparationTime}</td>
                    <td>${r.ingredients}</td>
                    <td>${r.steps}</td>
                    <td><a href="${sc}/${r.recipeId}">Add to Shopping-List</a> </td>
                </tr>
            </h:forEach>
            <tr><th>${added}</th></tr>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
    </h:otherwise>
</h:choose>