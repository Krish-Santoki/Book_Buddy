package com.User.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.entity.Book;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addCart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookid = Integer.parseInt(req.getParameter("bookid"));
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
		Book book = bookdao.getById(bookid);
		
		Cart c = new Cart();
		c.setBookid(bookid);
		c.setUserid(userid);
		c.setBookName(book.getBookname());
		c.setAuthor(book.getAuthor());
		c.setPrice(book.getPrice());
		c.setTotalPrice(book.getPrice());
		
		CartDaoImpl cartdao = new CartDaoImpl(DBConnect.getConn());
		boolean f = cartdao.addCart(c);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Book Added To Cart");
			resp.sendRedirect("allNewBooks.jsp");
		}else {
			session.setAttribute("errMsg", "Error Occured While Adding Book To Cart");
			resp.sendRedirect("allNewBooks.jsp");
		}
	}
	
}
