package com.Admin.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import com.conn.DBConnect;
import com.dao.BookDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			boolean f = bookdao.deleteBook(id);
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("errMsg", "Error Occured While Deleting Book");
				resp.sendRedirect("admin/all_books.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
