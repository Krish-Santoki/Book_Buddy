package com.User.servlet;

import java.io.File;
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

@WebServlet("/addOldBook")
@MultipartConfig
public class SellOldBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String author = req.getParameter("author");
			float price = Float.parseFloat(req.getParameter("price"));
			String category = "Old";
			String status = "Active";
			Part part = req.getPart("img");
			String photoName = part.getSubmittedFileName();
			String email = req.getParameter("useremail");
			
			Book b = new Book(bookname, author, price, category, status, photoName,email);
			BookDaoImpl bookdao = new BookDaoImpl(DBConnect.getConn());
			boolean f = bookdao.addBook(b);
			HttpSession session = req.getSession();
			

			if (f) {
				String path = getServletContext().getRealPath("") + "book";
				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + photoName);
				session.setAttribute("succMsg", "Book Added Successfully");
				resp.sendRedirect("allOldBooks.jsp");
			} else {
				session.setAttribute("errMsg", "Error occured while adding book");
				resp.sendRedirect("allOldBooks.jsp");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
