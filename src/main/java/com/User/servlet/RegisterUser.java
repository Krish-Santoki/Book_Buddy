package com.User.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhoneno(phoneno);
			user.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check!=null) {
				UserDaoImpl userDao = new UserDaoImpl(DBConnect.getConn());
				if(userDao.checkUser(email)) {
					boolean f = userDao.registerUser(user);
					if(f) {
						session.setAttribute("succMsg", "User Registered Successfully");
						resp.sendRedirect("register.jsp");
					}else {
						session.setAttribute("errMsg", "Cannot Register User");
						resp.sendRedirect("register.jsp");
					}
				}else {
					session.setAttribute("errMsg", "User already Exists");
					resp.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("errMsg", "Please Agree to Terms and Conditions");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
}
