<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Books</title>
<%@include file="layout/css.jsp"%>
</head>
<body>
	<%@include file="layout/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center mt-3">All Books</h3>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty errMsg }">
		<p class="text-center text-danger">${errMsg}</p>
		<c:remove var="errMsg" scope="session" />
	</c:if>
	<table class="table table-striped text-center">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Book ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			User user = (User)(session.getAttribute("userobj"));
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			List<Book> list = bookdao.getOldBookByUser(user.getEmail());
			for (Book b : list) {
			%>
			<tr>
				<td scope="row"><%=b.getBookid()%></td>
				<td scope="row"><img src="book/<%=b.getPhoto()%>"
					style="width: 40px; height: 50px;"></td>
				<td scope="row"><%=b.getBookname()%></td>
				<td scope="row"><%=b.getAuthor()%></td>
				<td scope="row"><%=b.getPrice()%></td>
				<td scope="row">
					<a href="deleteOldBook?id=<%=b.getBookid()%>" class="btn btn-sm btn-danger">Delete</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 175px">
		<%@include file="layout/footer.jsp"%>
	</div>
</body>
</html>