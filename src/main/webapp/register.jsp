<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<%@include file="layout/css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Form</h4>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg"/>
						</c:if>
						<c:if test="${not empty errMsg}">
							<p class="text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg"/>
						</c:if>
						
						<form action="register" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name
								</label> <input type="text" class="form-control" name="name"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									Number</label> <input type="number" class="form-control" name="phoneno"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									id="exampleInputPassword1" required="required">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree to terms and conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="layout/footer.jsp"%>
</body>
</html>