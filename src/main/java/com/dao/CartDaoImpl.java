package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
import com.entity.Cart;

public class CartDaoImpl implements CartDao{
	
	Connection conn = null;
	
	
	public CartDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Insert into CartDetail(bookid,userid,bookname,author,price,totalprice) values(?,?,?,?,?,?)");
			ps.setInt(1, c.getBookid());
			ps.setInt(2, c.getUserid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setFloat(5, c.getPrice());
			ps.setFloat(6, c.getTotalPrice());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		float totalPrice = 0;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from CartDetail where userid=?");
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cart = new Cart();
				cart.setCartid(rs.getInt(1));
				cart.setBookid(rs.getInt(2));
				cart.setUserid(rs.getInt(3));
				cart.setBookName(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getFloat(6));
				
				totalPrice += rs.getFloat(7);
				cart.setTotalPrice(totalPrice);
				list.add(cart);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean removeBookCart(int cartid) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Delete from CartDetail where cartid=?");
			ps.setInt(1, cartid);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return f;
	}
	
}
