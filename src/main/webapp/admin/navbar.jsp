<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3 bg-primary">
	<div class="row">
		<div class="col-md-3">
			<h3 style="color: white">
				<i class="fa-solid fa-book"></i> BOOK BUDDY
			</h3>
		</div>
		<div class="col-md-6">
		</div>
		<div class="col-md-3">
			<c:if test="${not empty userobj}">
				<a  class="btn btn-primary"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</c:if>
			<c:if test="${empty userobj}">
				<a href="../login.jsp" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>
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


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item active"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>

			</ul>
		</div>
	</div>
</nav>