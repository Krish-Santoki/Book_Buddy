package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImpl implements UserDao{
	private Connection conn;

	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean registerUser(User user) {
		boolean f=false;
		try {
			
			PreparedStatement ps = conn.prepareStatement("Insert into UserDetail(name,email,phoneno,password) values(?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneno());
			ps.setString(4, user.getPassword());
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return f;
	}

	@Override
	public User loginUser(String email, String password) {
		User user = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from UserDetail where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhoneno(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setPincode(rs.getString(10));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	@Override
	public boolean editUser(User user) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Update UserDetail set name=?,email=?,phoneno=? where id=?");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneno());
			ps.setInt(4, user.getId());
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return f;
	}

	@Override
	public boolean checkPassword(String password,int id) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from UserDetail where id=? and password=?");
			ps.setInt(1, id);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f = true;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from UserDetail where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				f = false;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return f;
	}
	
	
}
