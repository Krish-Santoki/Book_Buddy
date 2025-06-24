package com.dao;

import com.entity.User;

public interface UserDao {
	public boolean registerUser(User user);
	
	public User loginUser(String email,String password);
	
	public boolean editUser(User user);
	
	public boolean checkPassword(String password,int id);
	
	public boolean checkUser(String email);
}
