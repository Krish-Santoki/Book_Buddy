package com.entity;

public class Book {
	private int bookid;
	private String bookname;
	private String author;
	private float price;
	private String category;
	private String status;
	private String photo;
	private String email;
	public Book() {
		super();
	}
	
	public Book(String bookname, String author, float price, String category, String status, String photo,String email) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", status=" + status + ", photo=" + photo + ", email=" + email + "]";
	}
	
}
