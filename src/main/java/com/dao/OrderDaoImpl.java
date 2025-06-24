package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Order;

public class OrderDaoImpl implements OrderDao{
	private Connection conn;

	public OrderDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i=1;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from OrderDetail");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<Order> list) {
		boolean f = false;
		try {
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("Insert into OrderDetail(orderid,userName,email,address,phoneNo,bookName,author,price,paymentType) values(?,?,?,?,?,?,?,?,?)");
			for(Order order : list) {
				ps.setString(1, order.getOrderid());
				ps.setString(2, order.getUsername());
				ps.setString(3, order.getEmail());
				ps.setString(4, order.getAddress());
				ps.setString(5, order.getPhoneno());
				ps.setString(6, order.getBookname());
				ps.setString(7, order.getAuthor());
				ps.setFloat(8, order.getPrice());
				ps.setString(9, order.getPaymenttype());
				
				ps.addBatch();
			}
			
			int i[] = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Order> getBook(String email) {
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from OrderDetail where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				order = new Order();
				order.setId(rs.getInt(1));
				order.setOrderid(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setAddress(rs.getString(5));
				order.setPhoneno(rs.getString(6));
				order.setBookname(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getFloat(9));
				order.setPaymenttype(rs.getString(10));
				list.add(order);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> getBook() {
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from OrderDetail");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				order = new Order();
				order.setId(rs.getInt(1));
				order.setOrderid(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
				order.setAddress(rs.getString(5));
				order.setPhoneno(rs.getString(6));
				order.setBookname(rs.getString(7));
				order.setAuthor(rs.getString(8));
				order.setPrice(rs.getFloat(9));
				order.setPaymenttype(rs.getString(10));
				list.add(order);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
}
