<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="inx"/>
<c:url value="/addrecipes" var="adrep"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<h:choose>
    <h:when test="${userList==null}">
        <h:redirect url="${inx}" />
    </h:when>
    <h:otherwise>
<html>
<head>
    <title>Add Recipes</title>
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
<!-- register-form -->
<div class="reg-form">
    <div class="container">
        <div class="reg">
            <h3>Add New Recipe</h3>
            <p>Welcome, please enter the following details to continue.</p>
            <springform:form id="register" modelAttribute="rep" action="${adrep}"  method="POST">
                <ul>
                    <li class="text-info">Title : </li>
                    <li><springform:input path="title"/></li>
                    <li><springform:errors cssStyle="color:red;" path="title"/></li>
                </ul>
                <ul>
                    <li class="text-info">Cuisine : </li>
                    <li><springform:select path="cuisine">
                        <springform:option value="">select</springform:option>
                        <springform:option value="Pakistani"/>
                        <springform:option value="Indian"/>
                        <springform:option value="Italian"/>
                        <springform:option value="Canadian"/>
                        <springform:option value="Turkish"/>
                        </springform:select></li>
                    <li><springform:errors cssStyle="color:red;" path="cuisine"/></li>
                </ul>
                <ul>
                    <li class="text-info">Description : </li>
                    <li><springform:textarea path="description"/></li>
                    <li><springform:errors cssStyle="color:red;" path="description"/></li>
                </ul>
                <ul>
                    <li class="text-info">Preparation Time : </li>
                    <li><springform:input path="preparationTime"/></li>
                    <li><springform:errors cssStyle="color:red;" path="preparationTime"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Ingredients : </li>
                    <li><springform:textarea id="pass" path="ingredients"/></li>
                    <li><springform:errors cssStyle="color:red;" path="ingredients"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Steps : </li>
                    <li><springform:textarea id="pass" path="steps"/></li>
                    <li><springform:errors cssStyle="color:red;" path="steps"/>
                    </li>
                </ul>
                <input type="submit" value="Add Recipe">
            </springform:form>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
    </h:otherwise>
</h:choose>