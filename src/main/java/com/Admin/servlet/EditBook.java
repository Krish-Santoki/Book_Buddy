package com.Admin.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.BookDaoImpl;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/edit_book")
public class EditBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idParam = req.getParameter("id");
		System.out.println(idParam);
		int id = Integer.parseInt(idParam);
		String bookname = req.getParameter("bname");
		String author = req.getParameter("author");
		float price = Float.parseFloat(req.getParameter("price"));
		String status = req.getParameter("status");
		BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
		Book book = new Book();
		book.setBookid(id);
		book.setBookname(bookname);
		book.setAuthor(author);
		book.setPrice(price);
		book.setStatus(status);

		Boolean f = bookdao.editBook(book);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("succMsg", "Book Edited Successfully");
			resp.sendRedirect("admin/all_books.jsp");
		}else {
			session.setAttribute("errMsg", "Error Occured While Editing Book");
			resp.sendRedirect("admin/all_books.jsp");
		}
	}
	
}
