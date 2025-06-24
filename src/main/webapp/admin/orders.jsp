<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.OrderDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<%@include file="css.jsp"%>
</head>
<body>
	<c:if test="${userobj.email != 'admin@gmail.com'}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center mt-3">Orders</h3>
	<table class="table table-striped text-center">
		<thead style="font-size: small;">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody style="font-size: small;">
			<%
			User user = (User) session.getAttribute("userobj");
			OrderDaoImpl orderdao = new OrderDaoImpl(DBConnect.getConn());
			List<Order> list = orderdao.getBook();
			for (Order o : list) {
			%>
			<tr>
				<td scope="row"><%=o.getOrderid()%></td>
				<td scope="row"><%=o.getUsername()%></td>
				<td scope="row"><%=o.getEmail()%></td>
				<td scope="row"><%=o.getAddress()%></td>
				<td scope="row"><%=o.getPhoneno()%></td>
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
	<div style="margin-top: 175px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>