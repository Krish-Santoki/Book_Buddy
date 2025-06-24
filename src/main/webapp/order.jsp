<%@page import="com.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.OrderDaoImpl"%>
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
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="layout/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container mt-3">
		<h3 class="text-center text-primary">Your Order Details</h3>
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("userobj");
				OrderDaoImpl orderdao = new OrderDaoImpl(DBConnect.getConn());
				List<Order> list = orderdao.getBook(user.getEmail());
				for (Order o : list) {
				%>
				<tr>
					<td scope="row"><%=o.getOrderid()%></td>
					<td scope="row"><%=o.getUsername()%></td>
					<td scope="row"><%=o.getBookname()%></td>
					<td scope="row"><%=o.getAuthor()%></td>
					<td scope="row"><%=o.getPrice()%></td>
					<td scope="row"><%=o.getPaymenttype()%></td>
				</tr>

				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div style="margin-top: 180px">
		<%@include file="layout/footer.jsp"%>
	</div>
</body>
</html>