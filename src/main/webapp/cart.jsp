<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.CartDaoImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@include file="layout/css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="layout/navbar.jsp"%>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty errMsg }">
		<div class="alert alert-danger text-center" role="alert">${errMsg }</div>
		<c:remove var="errMsg" scope="session"/>
	</c:if>
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<h3 class="text-center text-success mt-3">Your Selected Items</h3>
				<div class="card bg-white">
					<div class="card-body text-center">
						<table class="table table-striped ">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							
							<tbody>
							<% 
								User user = (User)session.getAttribute("userobj");
								CartDaoImpl cartdao = new CartDaoImpl(DBConnect.getConn());
								List<Cart> list = cartdao.getBookByUser(user.getId());
								float totalPrice = 0;
								for(Cart c :list){
									totalPrice = c.getTotalPrice();
							%>							
								<tr style="font-size: small;">
									<td scope="row"><%=c.getBookName() %></td>
									<td scope="row"><%=c.getAuthor() %></td>
									<td scope="row"><%=c.getPrice()%></td>
									<td scope="row">
										<a href="removeBook?cartid=<%=c.getCartid()%>" class="btn btn-sm btn-danger">Remove</a>
									</td>
								</tr>
							<%}%>
								<tr>
									<th>Total Price</th>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<h3 class="text-center text-success mt-3">Your Order Details</h3>
				<div class="card bg-white">
					<div class="card-body">
						<form action="order" method="post">
							<div class="form-group row mt-1">
								<input type="hidden" name="id" value="<%=user.getId()%>">
								<label class="col-sm-3 col-form-label">Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control"
										value="<%=user.getName()%>" name="username" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" value="<%=user.getEmail()%>" name="email" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">Phone No.</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" value="<%=user.getPhoneno()%>" name="phoneno" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">Address</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="address" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">Landmark</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="landmark" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">City</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="city" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">State</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="state" required="required">
								</div>
							</div>
							<div class="form-group row mt-1">
								<label class="col-sm-3 col-form-label">Pin Code</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" value="" name="pincode" required="required">
								</div>
							</div>
							<div class="form-group row mt-1 mb-1">
								<label col-sm-3>Payment Mode</label>
								<div>
									<select class="form-centrol col-sm-9" name="paymenttype" required="required">
									<option value="notselected">--select--</option>
									<option value="cod">Cash On Delivery</option>
								</select>
								</div>
							</div>
							<button class="btn btn-primary">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="layout/footer.jsp"%>
</body>
</html>