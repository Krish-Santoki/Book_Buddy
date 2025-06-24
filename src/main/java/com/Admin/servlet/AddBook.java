package com.Admin.servlet;

import com.conn.DBConnect;
import com.dao.BookDaoImpl;
import com.entity.*;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_book")
@MultipartConfig
public class AddBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String author = req.getParameter("author");
			float price = Float.parseFloat(req.getParameter("price"));
			String category = "New";
			String status = req.getParameter("status");
			Part part = req.getPart("img");
			String photoName = part.getSubmittedFileName();

			Book b = new Book(bookname, author, price, category, status, photoName, "admin@gmail.com");
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			boolean f = bookdao.addBook(b);
			HttpSession session = req.getSession();
			

			if (f) {
				String path = getServletContext().getRealPath("") + "book";
				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + photoName);
				session.setAttribute("succMsg", "Book added successfully");
				resp.sendRedirect("admin/add_book.jsp");
			} else {
				session.setAttribute("errMsg", "Error occured while adding book");
				resp.sendRedirect("admin/add_book.jsp");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
