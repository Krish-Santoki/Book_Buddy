<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Buddy</title>
<%@include file="layout/css.jsp"%>
<style type="text/css">
.back-img {
	background: url(img/girl_book.jpg);
	height: 80vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.card-hover:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%
		User user = (User)session.getAttribute("userobj");
	%>
	<%@include file="layout/navbar.jsp"%>
	<div class="container-fluid back-img"></div>
	<!-- Start Recent Books -->
	<div class="container-fluid mt-3">
		<h3 class="text-center">Recent Books</h3>
		<div class="row mb-3">
			<%
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			List<Book> list1 = bookdao.getRecentBooks();
			for (Book b : list1) {
			%>
			<div class="col-md-3">
				<div class="card-hover card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							<%
							if (b.getCategory().equals("New")) {
								if(user==null){ %>
								<a href="login.jsp" class="btn btn-primary btn-sm">Add Cart</a>
								<%}else{ %>
								<a href="addCart?bookid=<%=b.getBookid()%>&&userid=<%=user.getId()%>" class="btn btn-primary btn-sm">Add Cart</a>
								<%}
							}
							%>
							<a href="bookDetails.jsp?id=<%=b.getBookid()%>"
								class="btn btn-primary btn-sm">Details</a> <a
								class="btn btn-primary btn-sm">399</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allRecentBooks.jsp" class="btn btn-primary btn-sm">View
				All</a>
		</div>
	</div>
	<!-- End Recent Books -->
	<hr>
	<!-- Start New Books -->
	<div class="container-fluid">
		<h3 class="text-center">New Books</h3>
		<div class="row mb-3">

			<%
			List<Book> list2 = bookdao.getNewBooks();
			for (Book b : list2) {
			%>
			<div class="col-md-3">
				<div class="card-hover card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :
							<%=b.getCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							<%if(user==null){ %>
							<a href="login.jsp" class="btn btn-primary btn-sm">Add Cart</a>
							<%}else{ %>
							<a href="addCart?bookid=<%=b.getBookid()%>&&userid=<%=user.getId()%>" class="btn btn-primary btn-sm">Add Cart</a>
							<%} %> 
							<a href="bookDetails.jsp?id=<%=b.getBookid()%>" class="btn btn-primary btn-sm">Details</a> 
							<a href="" class="btn btn-primary btn-sm"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allNewBooks.jsp" class="btn btn-primary btn-sm">View All</a>
		</div>
	</div>
	<!-- End New Books -->
	<hr>

	<!-- Start Old Books -->
	<div class="container-fluid">
		<h3 class="text-center">Old Books</h3>
		<div class="row mb-3">

			<%
			List<Book> list3 = bookdao.getOldBooks();
			for (Book b : list3) {
			%>
			<div class="col-md-3">
				<div class="card-hover card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Category : <%=b.getCategory() %></p>
						<div class="d-flex justify-content-center gap-2">
							<a href="bookDetails.jsp?id=<%=b.getBookid()%>" class="btn btn-primary btn-sm">Details</a> <a href=""
								class="btn btn-primary btn-sm">399</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<a href="allOldBooks.jsp" class="btn btn-primary btn-sm">View All</a>
		</div>
	</div>
	<!-- End Old Books -->
	<%@include file="layout/footer.jsp"%>
</body>
</html>