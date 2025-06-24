package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(
					"jdbc:sqlserver://Krish\\SQLEXPRESS:1433;databaseName=BookBuddy;encrypt=true;trustServerCertificate=true;",
					"root", "new_password");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
}
