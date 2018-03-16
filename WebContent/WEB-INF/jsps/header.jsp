<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="inx"/>
<c:url value="/addrecipe" var="adrep"/>
<c:url value="/recipes" var="r_p"/>
<c:url value="/mealPlanning" var="m_p"/>
<c:url value="/shoppingCart" var="shopCart"/>
<c:url value="/logout" var="logout"/>
<c:url value="/login" var="lg"/>
<c:url value="/images/" var="imageUr"/>
<c:url value="/register" var="rg"/>
<h:choose>
<h:when test="${userList==null}">
<!--header-->
<div class="header">
    <div class="container">
        <div class="logo">
            <img src="${imageUr}/COOKBOOK101.png" class="img-responsive" alt="">
        </div>
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!--/.navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${inx}">Home </a></li>
                    <li><a href="${lg}">Login</a></li>
                    <li><a href="${rg}">Register</a></li>
                </ul>
            </div>
        </nav>
        <div class="clearfix"> </div>
    </div>
</div>
<!--header end-->
</h:when>
<h:otherwise>
    <!--header-->
    <div class="header">
    <div class="container">
        <div class="logo">
            <img src="${imageUr}/COOKBOOK101.png" class="img-responsive" alt="">
        </div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!--/.navbar-header-->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
            <ul class="nav navbar-nav">
                <li><a href="${inx}">Home </a></li>
                <li><a href="${adrep}">Add Recipes</a></li>
                <li><a href="${r_p}">Recipes</a></li>
                <li><a href="${m_p}">Meal Planner</a></li>
                <li><a href="${shopCart}">Shopping List</a></li>
                <li><a href="${logout}">Logout</a></li>
            </ul>
        </div>
    </nav>
    <div class="clearfix"> </div>
    </div>
    </div>
</h:otherwise>
</h:choose>