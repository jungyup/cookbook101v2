<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<c:url value="/login" var="lg"/>
<c:url value="/registration" var="rgt"/>
<c:url value="/" var="inx"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<html lang="en">
<head>
    <title>REGISTER</title>
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
            <h3>PERSONAL INFORMATION</h3>
            <p>Welcome, please enter the following details to continue.</p>
            <p>If you have previously registered with us, <a href="${lg}">Click Here</a></p>
            <springform:form id="register" action="${rgt}" modelAttribute="reg"  method="POST">
                <ul>
                    <li class="text-info">User Name:</li>
                    <li><springform:input path="userName"/></li>
                    <li><springform:errors cssStyle="color:red;" path="userName"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Gender :</li>
                    <li>Male : <springform:radiobutton path="gender" value="M"/>
                        Female :<springform:radiobutton path="gender" value="F"/></li>
                    <li><springform:errors cssStyle="color:red;" path="gender"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Phone Number:</li>
                    <li><springform:input path="phoneNumber"/></li>
                     <li><springform:errors cssStyle="color:red;" path="phoneNumber"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Home Address:</li>
                    <li><springform:input path="homeAddress"/></li>
                    <li><springform:errors cssStyle="color:red;" path="homeAddress"/>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Email:</li>
                    <li><springform:input path="email"/></li>
                    <li><springform:errors cssStyle="color:red;" path="email"/><b style="color: red"></b>
                    </li>
                </ul>
                <ul>
                    <li class="text-info">Password:</li>
                    <li><springform:password id="pass" path="password"/></li>
                    <li><springform:errors cssStyle="color:red;" path="password"/>
                    </li>
                </ul>
                <input type="submit" value="Register Now"><b style="color: green"></b>
            </springform:form>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>