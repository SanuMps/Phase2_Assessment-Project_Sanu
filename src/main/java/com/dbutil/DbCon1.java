
package com.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon1 {
	public static final String DB_URL = "jdbc:mysql://localhost:3306/learnersacademy";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "123456";

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		// register my driver
		Class.forName("com.mysql.jdbc.Driver");
		// establish connection with DB
		Connection con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		return con;
	}

}