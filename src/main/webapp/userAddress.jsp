<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Address</title>
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
						<h4 class="text-center">Add Address</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg" scope="session" />
						</c:if>
						<form action="" method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label class="form-label">Address</label> <input type="text"
									class="form-control" name="address" required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">Landmark</label> <input
									type="email" class="form-control" name="landmark"
									required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">City</label> <input type="number"
									class="form-control" name="city" required="required">
							</div>
							<div class="mb-3">
								<label class="form-label">State</label> <input name="state"
									type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Pincode</label> <input name="pincode"
									type="text" class="form-control">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block">Add</button>
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