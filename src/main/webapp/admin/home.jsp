<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="css.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${userobj.email != 'admin@gmail.com'}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-plus fa-3x"></i>
							<h4>Add Book</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-3x"></i>
							<h4>All Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x"></i>
							<h4>Orders</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-bs-toggle="modal" data-bs-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x"></i>
							<h4>Logout</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- Start logout modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<h4>Are you sure ?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary ">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- End Logout Modal -->
	<%@include file="footer.jsp"%>
</body>
</html>