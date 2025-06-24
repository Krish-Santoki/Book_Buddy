package com.dao;

import java.util.List;

import com.entity.Order;

public interface OrderDao {
	
	public int getOrderNo();
	
	public boolean saveOrder(List<Order> list);
	
	public List<Order> getBook(String email);
	
	public List<Order> getBook();
}
