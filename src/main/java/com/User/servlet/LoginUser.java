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

@WebServlet("/login")
public class LoginUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			UserDaoImpl userdao = new UserDaoImpl(DBConnect.getConn());
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User user = new User();
				user.setName("Admin");
				user.setEmail("admin@gmail.com");
				session.setAttribute("userobj", user);
				resp.sendRedirect("admin/home.jsp");
			}else {
				User user = userdao.loginUser(email, password);
				if(user!=null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("index.jsp");
					
				}else {
					session.setAttribute("errMsg", "Invalid email or password");
					resp.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
