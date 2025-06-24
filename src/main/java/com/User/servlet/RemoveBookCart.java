package com.User.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.CartDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int cartid = Integer.parseInt(req.getParameter("cartid"));
			CartDaoImpl cartdao = new CartDaoImpl(DBConnect.getConn());
			boolean f = cartdao.removeBookCart(cartid);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Book Removed Successfully");
				resp.sendRedirect("cart.jsp");
			}else {
				session.setAttribute("errMsg", "Error Occured While Removing Book");
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
