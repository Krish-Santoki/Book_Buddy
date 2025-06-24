package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;

public class BookDaoImpl implements BookDao {

	private Connection conn;

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBook(Book book) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(
					"Insert into BookDetail(bookname,author,price,category,status,photo,email) values(?,?,?,?,?,?,?)");
			ps.setString(1, book.getBookname());
			ps.setString(2, book.getAuthor());
			ps.setDouble(3, book.getPrice());
			;
			ps.setString(4, book.getCategory());
			ps.setString(5, book.getStatus());
			ps.setString(6, book.getPhoto());
			ps.setString(7, book.getEmail());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return f;
	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public Book getById(int id) {
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where bookid=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return b;
	}

	@Override
	public List<Book> getNewBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where category=? and status=?  order by bookid DESC");
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				i++;
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public List<Book> getRecentBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where status=? order by bookid DESC");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				i++;
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Book> getOldBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where category=? and status=?  order by bookid DESC");
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				i++;
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	@Override
	public List<Book> getAllRecentBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where status=? order by bookid DESC");
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book> getAllNewBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where category=? and status=?  order by bookid DESC");
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				i++;
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public List<Book> getAllOldBooks() {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where category=? and status=?  order by bookid DESC");
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				i++;
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	@Override
	public List<Book> getOldBookByUser(String email) {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where category=? and email=? order by bookid DESC");
			ps.setString(1, "Old");
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public boolean editBook(Book book) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Update BookDetail set bookname=?,author=?,price=?,status=? where bookid=?");
			ps.setString(1, book.getBookname());
			ps.setString(2, book.getAuthor());
			ps.setDouble(3, book.getPrice());
			ps.setString(4, book.getStatus());
			ps.setInt(5, book.getBookid());
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
	public boolean deleteBook(int id) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement("Delete from BookDetail where bookid=?");
			ps.setInt(1, id);
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
	public List<Book> getBookBySearch(String str) {
		List<Book> list = new ArrayList<Book>();
		Book b = null;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from BookDetail where bookname like ? or author like ? or category like ? and status like ?");
			ps.setString(1, "%"+str+"%");
			ps.setString(2, "%"+str+"%");
			ps.setString(3, "%"+str+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Book();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getFloat(4));
				b.setCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
	
}
