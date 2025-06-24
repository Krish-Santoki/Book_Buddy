<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<%@include file="css.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${userobj.email != 'admin@gmail.com'}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row m-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Book</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errMsg }">
							<p class="text-center text-danger">${errMsg}</p>
							<c:remove var="errMsg" scope="session"/>
						</c:if>
						<form action="../add_book" method="post" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book
									Name </label> <input type="text" class="form-control" name="bname"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name </label> <input type="text" class="form-control" name="author"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price
								</label> <input type="number" class="form-control" name="price"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">
							</div>
							<div class="mb-3">
								<label for="inputstate">Book Status</label> <select
									id="inputstate" name="status" class="form-control">
									<option selected="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="img" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>