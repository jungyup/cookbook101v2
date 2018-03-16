<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/css/style.css" var="css_style"/>
<c:url value="/css/bootstrap.css" var="css_boot"/>
<c:url value="/scripts/bootstrap.js" var="js_bts"/>
<c:url value="/images/" var="imageUr"/>
<c:url value="/scripts/jquery-1.11.1.min.js" var="js_jquery"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Home</title>
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
<h:choose>
<h:when test="${userList==null}">
	<!-- tels -->
	<div class="tels">
		<div class="container">
			<div class="col-md-4 tels-left">
				<h4>Pork Tenderloin with Chimichurri Sauce</h4>
				<img src="${imageUr}/Pork.jpg" class="img-responsive" alt="">
				<p>A crowd pleaser. This dish is made with aromatic herbs and spices such as garlic, jalapeno, parsley, oregano and lime juice. </p>
			</div>
			<div class="col-md-4 tels-left">
				<h4>Tequila Lime Chicken </h4>
				<img src="${imageUr}/Tequila.jpg" class="img-responsive" alt="">
				<p>Fantastic for family dinner! This dish is made by marinating the chicken with margarita mixer overnight.</p>
			</div>
			<div class="col-md-4 tels-left">
				<h4>Grilled Sea Scallops with Chickpea Salad </h4>
				<img src="${imageUr}/Grilled.jpg" class="img-responsive" alt="">
				<p>Ring in the new year with a healthy dish that will meet all of your diet goals. This dish consists of tahini, garlic and cumin for some guaranteed flavor.</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- tels -->
	<!-- special -->
	<div class="special">
		<div class="container">
			<div class="spe-info">
				<h3>Cookbook 101</h3>
				<p>This application is tailored for all your cooking needs. You will be able to add recipes, find recipes, time your meals, plan your meals weekly and if you need ingredients you will be able to add them to a shopping list for convenience. </p>
			</div>
		</div>
	</div>

</h:when>
<h:otherwise>
<br />
<div class="tels">
		<div class="container">
			<div class="col-md-4 tels-left">
				<h4>Pork Tenderloin with Chimichurri Sauce</h4>
				<img src="${imageUr}/Pork.jpg" class="img-responsive" alt="">
				<p>A crowd pleaser. This dish is made with aromatic herbs and spices such as garlic, jalapeno, parsley, oregano and lime juice. </p>
			</div>
			<div class="col-md-4 tels-left">
				<h4>Tequila Lime Chicken </h4>
				<img src="${imageUr}/Tequila.jpg" class="img-responsive" alt="">
				<p>Fantastic for family dinner! This dish is made by marinating the chicken with margarita mixer overnight.</p>
			</div>
			<div class="col-md-4 tels-left">
				<h4>Grilled Sea Scallops with Chickpea Salad </h4>
				<img src="${imageUr}/Grilled.jpg" class="img-responsive" alt="">
				<p>Ring in the new year with a healthy dish that will meet all of your diet goals. This dish consists of tahini, garlic and cumin for some guaranteed flavor.</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</h:otherwise>
</h:choose>
<jsp:include page="footer.jsp"/>
</body>
</html>