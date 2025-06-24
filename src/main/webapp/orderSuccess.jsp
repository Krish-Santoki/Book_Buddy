<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>
<%@include file="layout/css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>
	<div class="container text-center mt-3">
		<div class="text-success">
			<i class="fa-solid fa-circle-check fa-4x"></i>
			<h1>Thank You</h1>
			<h2>Order Successfully Placed</h2>
			<h5>Within 7 days your product will be delivered at your address</h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
				href="order.jsp" class="btn btn-primary mt-3">View Order</a>
		</div>
	</div>
	<%@include file="layout/footer.jsp"%>
</body>
</html>