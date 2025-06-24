<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.entity.Book"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
<%@include file="css.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<c:if test="${userobj.email != 'admin@gmail.com'}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row m-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						
						<%
							BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
							int id = Integer.parseInt(request.getParameter("id"));
							Book book = bookdao.getById(id);
						%>
						<form action="../edit_book" method="post" >
							<div class="mb-3">
								<input type="hidden" name="id" value="<%=book.getBookid()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book
									Name </label> <input type="text" class="form-control" name="bname"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" value="<%=book.getBookname()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name </label> <input type="text" class="form-control" name="author"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" value="<%=book.getAuthor()%>">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price
								</label> <input type="number" class="form-control" name="price"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" value="<%=book.getPrice()%>">
							</div>
							<div class="mb-3">
								<label for="inputstate">Book Status</label> <select
									id="inputstate" name="status" class="form-control">
									<%if(book.getStatus().equals("Active")){%>
									<option selected="active">Active</option>
									<option value="inactive">Inactive</option>	
									<% }else{%>
									<option selected="inactive">Inactive</option>
									<option value="active">Active</option>
									<%} %>	
								</select>
							</div>
							<!-- <div class="mb-3">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="img" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div> -->
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Edit</button>
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