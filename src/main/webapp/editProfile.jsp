<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="layout/css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row m-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg" scope="session" />
						</c:if>
						<form action="editProfile" method="post">
							<input type="hidden" value="${userobj.id}" name="userid">
							<div class="mb-3">
								<label class="form-label">Name </label> <input type="text"
									class="form-control" name="name" required="required" value="${userobj.name}">
							</div>
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input
									type="email" class="form-control" name="email" value="${userobj.email}"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">Phone noumber</label> <input type="number"
									class="form-control" name="phoneno" required="required" value="${userobj.phoneno}">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input name="password"
									type="text" class="form-control" placeholder="Enter Password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block">Edit</button>
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