<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<c:url value="/" var="l_index"/>
<c:url value="/logged" var="lgd"/>
<c:url value="/register" var="rg"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<html>
<head>
    <title>Login</title>
    <!--bootstrap-->
    <link href="${css_boot}" rel="stylesheet" type="text/css"/>
    <!--css-->
    <link href="${css_style}" rel="stylesheet" type="text/css"/>
    <!--js-->
    <script src="${js_jquery}" type="text/javascript"></script>
    <script src="${js_bts}" type="text/javascript"></script>
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<!-- login-page -->
<div class="login-page">
    <div class="container">
        <div class="account_grid">
            <div class="col-md-6 login-left wow fadeInLeft">
                <h3>NEW CUSTOMERS</h3>
                <p>Please register to add recipes, view recipes and see other options in store!</p>
                <a class="acount-btn" href="${rg}">Create an Account</a>
            </div>
            <div class="col-md-6 login-right wow fadeInRight">
                <h3>REGISTERED CUSTOMERS</h3>
                <p>If you have an account with us, please log in.</p>
                <form id="log" action="${lgd}" method="POST">
                <div>
                    <span>Email Address<label>*</label></span>
                    <input type="email" name="email" required="required"/><br/>
                </div>
                <div>
                    <span>Password<label>*</label></span>
                    <input type="password" required="required" name="password"/><br/>
                </div>
                    <input type="submit" value="Login"/><b style="color:red;">${invalid}</b>
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //login-page -->
<jsp:include page="footer.jsp"/>
</body>
</html>