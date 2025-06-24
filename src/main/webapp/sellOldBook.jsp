<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
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
						<h4 class="text-center">Sell Book</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg" scope="session"/>
						</c:if>
						<form action="addOldBook" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email }" name="useremail">
							<div class="mb-3">
								<label class="form-label">Book
									Name </label> <input type="text" class="form-control" name="bname"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name </label> <input type="text" class="form-control" name="author"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price
								</label> <input type="number" class="form-control" name="price"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="img" type="file" class="form-control-file">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Sell</button>
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