package com.dao;

import java.util.List;

import com.entity.Book;
import com.entity.Cart;

public interface CartDao {
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userid);
	
	public boolean removeBookCart(int cartid);
}
