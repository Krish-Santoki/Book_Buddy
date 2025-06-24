package com.User.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.dao.BookDaoImpl;
import com.dao.CartDaoImpl;
import com.dao.OrderDaoImpl;
import com.entity.Cart;
import com.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderDetail extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymenttype = req.getParameter("paymenttype");
			String fulladdress = address+","+landmark+","+city+","+state+","+pincode;
			
			CartDaoImpl cartdao = new CartDaoImpl(DBConnect.getConn());
			List<Cart> list = cartdao.getBookByUser(id);
			
			if(list.isEmpty()) {
				session .setAttribute("errMsg", "Cart Is Empty");
				resp.sendRedirect("cart.jsp");
			}else {
				OrderDaoImpl orderdao = new OrderDaoImpl(DBConnect.getConn());
				Order order = null;
				int i = orderdao.getOrderNo();
				
				ArrayList<Order> orderList = new ArrayList<Order>();
				for(Cart c :list) {
					i++;
					order = new Order();
					order.setOrderid("Book-ORD-00"+i);
					order.setUsername(name);
					order.setEmail(email);
					order.setPhoneno(phoneno);
					order.setAddress(fulladdress);
					order.setBookname(c.getBookName());
					order.setAuthor(c.getAuthor());
					order.setPrice(c.getPrice());
					order.setPaymenttype(paymenttype);
					orderList.add(order);
				}
				
				if("notselected".equals(paymenttype)) {
					session .setAttribute("errMsg", "Please Select Payment Type");
					resp.sendRedirect("cart.jsp");
				}else {
					boolean f = orderdao.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("orderSuccess.jsp");
					}else {
						session .setAttribute("errMsg", "Order Failed");
						resp.sendRedirect("cart.jsp");
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
}
