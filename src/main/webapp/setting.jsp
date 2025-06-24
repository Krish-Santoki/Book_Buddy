<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting</title>
<%@include file="layout/css.jsp"%>
<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		text-decoration: none;	
	}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellOldBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4 >
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="oldBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div>
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h4>My Books</h4 >
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>(Track Your Order)</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div >
								<i class="fa-solid fa-headset fa-3x"></i>
							</div>
							<h4>Help Centre</h4>
							<p>(24*7 Service)</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<%@include file="layout/footer.jsp"%>
</body>
</html>