<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/addingMealPlanning" var="amp"/>
<c:url value="/deleteMealPlan" var="dmp"/>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Meal Planning</title>
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
<div class="main-1">
    <div class="container">
        <div class="register">
            <springform:form action="${amp}" modelAttribute="mpForm" method="post">
                <div class="register-top-grid">
                    <h3>Weekly Meal Planner</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Days<label>*</label>
                            <b>&nbsp;<springform:errors path="days" cssStyle="color:red;"/> </b>
                        </span>
                        <springform:select cssStyle="padding: 0.5em;width: 55%;" path="days" required="required">
                            <springform:option value="">Select</springform:option>
                            <springform:option value="Monday"/>
                            <springform:option value="Tuesday"/>
                            <springform:option value="Thursday"/>
                            <springform:option value="Wednesday"/>
                            <springform:option value="Friday"/>
                            <springform:option value="Saturday"/>
                            <springform:option value="Sunday"/>
                        </springform:select>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>BreakFAST<label>*</label>
                            <b>&nbsp;<springform:errors path="breakFast" cssStyle="color:red;"/> </b>
                        </span>
                        <springform:input path="breakFast" required="required"/>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Lunch<label>*</label>
                            <b>&nbsp;<springform:errors path="lunch" cssStyle="color:red;"/> </b>
                        </span>
                        <springform:input path="lunch" required="required"/>
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Dinner<label>*</label>
                            <b>&nbsp;<springform:errors path="dinner" cssStyle="color:red;"/> </b>
                        </span>
                        <springform:input path="dinner" required="required"/>
                    </div>
                    <input type="submit" style="width: 75%;" value="Add Weekly Plan">
            </springform:form>
        </div>
    </div>
        <div class="bs-docs-example">
            <b>${delMeal}</b>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Days</th>
                    <th>Breakfast</th>
                    <th>Lunch</th>
                    <th>Dinner</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <h:forEach items="${mpList}" var="r">
                    <tr class="success">
                        <td>${r.days}</td>
                        <td>${r.breakFast}</td>
                        <td>${r.lunch}</td>
                        <td>${r.dinner}</td>
                        <td><a style="color: red;" href="${dmp}/${r.p_id}">Remove</a></td>
                    </tr>
                </h:forEach>
                </tbody>
            </table>
        </div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>