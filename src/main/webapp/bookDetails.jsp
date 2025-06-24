<%@page import="com.entity.User"%>
<%@page import="com.entity.Book"%>
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
<title>Insert title here</title>
<%@include file="layout/css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="layout/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
	Book b = bookdao.getById(id);
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=b.getPhoto()%>"
					style="height: 150px; width: 110px"><br>
				<h6 class="mt-3">
					Book Name : <span class="text-success"><%=b.getBookname()%></span>
				</h6>
				<h6>
					Author Name : <span class="text-success"><%=b.getAuthor()%></span>
				</h6>
				<h6>
					Category : <span class="text-success"><%=b.getCategory()%></span>
				</h6>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>
				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<h7>Contact Seller</h7>
				<br>
				<h7 class="text-primary"> <i class="fa-solid fa-envelope"></i>
				Email : <%=b.getEmail()%></h7>
				<%
				}
				%>
				<div class="row mt-5">
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p style="font-size: small;">Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p style="font-size: small;">Return Available</p>
					</div>
					<div class="col-md-4 text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p style="font-size: small;">Free Shipping</p>
					</div>
				</div>
				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<div class="text-center">
					<a href="index.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a href=""
						class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i> 300</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center">
					<%
					if (user == null) {
					%>
					<a href="login.jsp" class="btn btn-primary "><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a>
					<%
					} else {
					%>
					<a
						href="addCart?bookid=<%=b.getBookid()%>&&userid=<%=user.getId()%>"
						class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>
						Add Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-indian-rupee-sign"></i> 300</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@include file="layout/footer.jsp"%>
</body>
</html>