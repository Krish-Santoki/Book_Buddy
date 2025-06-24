package com.User.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.UserDaoImpl;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editProfile")
@MultipartConfig
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = null;
		try {
			int userid = Integer.parseInt(req.getParameter("userid"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");
			
			UserDaoImpl userdao = new UserDaoImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			if(userdao.checkPassword(password, userid)) {
				user = new User();
				user.setId(userid);
				user.setName(name);
				user.setEmail(email);
				user.setPhoneno(phoneno);
				boolean f = userdao.editUser(user);
				if(f) {
					session.setAttribute("succMsg", "Profile Updated");
					resp.sendRedirect("editProfile.jsp");
				}else {
					session.setAttribute("errMsg", "Error Occured While Editing Profile");
					resp.sendRedirect("editProfile.jsp");
				}
				
			}else {
				session.setAttribute("errMsg", "Incorrect Password");
				resp.sendRedirect("editProfile.jsp");
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
}
