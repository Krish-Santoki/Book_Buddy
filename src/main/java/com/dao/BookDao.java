package com.dao;

import java.util.List;

import com.entity.Book;

public interface BookDao {
	public boolean addBook(Book book);
	
	public List<Book> getAllBooks();
	
	public Book getById(int id);
	
	public boolean editBook(Book book);
	
	public boolean deleteBook(int id);
	
	public List<Book> getNewBooks();
	
	public List<Book> getRecentBooks();
	
	public List<Book> getOldBooks();
	
	public List<Book> getAllRecentBooks();
	
	public List<Book> getAllNewBooks();
	
	public List<Book> getAllOldBooks();
	
	public List<Book> getOldBookByUser(String email);
	
	public List<Book> getBookBySearch(String str);
}
