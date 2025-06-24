<%@page import="com.entity.User"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="layout/css.jsp"%>
<meta charset="UTF-8">
<title>Search Books</title>
<style type="text/css">
.card-hover:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>
	<div class="row p-3">
			<%
			User user = (User)session.getAttribute("userobj");
			String str = request.getParameter("str");
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			List<Book> list1 = bookdao.getBookBySearch(str);
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
							<a href="bookDetails.jsp?id=<%=b.getBookid()%>" class="btn btn-primary btn-sm">Details</a> <a
								class="btn btn-primary btn-sm">399</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
			<%@include file="layout/footer.jsp"%>
</body>
</html>