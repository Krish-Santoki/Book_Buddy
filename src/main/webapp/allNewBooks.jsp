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
<title>New Books</title>
<style type="text/css">
.card-hover:hover {
	background-color: #fcf7f7;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${not empty succMsg }">
		<div id="toast">${succMsg}</div>

	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
	</script>
	<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty errMsg}">
		<div id="toast">${errMsg}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
	</script>
	<c:remove var="errMsg" scope="session"/>
	</c:if>
	<%@include file="layout/navbar.jsp"%>
	<div class="row p-3">
		<%
		BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
		List<Book> list = bookdao.getAllNewBooks();
		User user = (User)session.getAttribute("userobj");
		for (Book b : list) {
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
						<a href="bookDetails.jsp?id=<%=b.getBookid()%>"
							class="btn btn-primary btn-sm">Details</a> <a href=""
							class="btn btn-primary btn-sm"><%=b.getPrice()%></a>
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