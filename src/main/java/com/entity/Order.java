package com.entity;

public class Order {
	private int id;
	private String orderid;
	private String username;
	private String email;
	private String address;
	private String phoneno;
	private String bookname;
	private String author;
	private float price;
	private String paymenttype;
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
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

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderid=" + orderid + ", username=" + username + ", email=" + email + ", address="
				+ address + ", phoneno=" + phoneno + ", bookname=" + bookname + ", author=" + author + ", price="
				+ price + ", paymenttype=" + paymenttype + "]";
	}
	
}
