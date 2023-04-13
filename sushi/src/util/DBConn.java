package util;

import java.sql.Connection;
import java.sql.DriverManager;



public class DBConn {
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
//				connection = DriverManager.getConnection("jdbc:oracle:thin:@human.lepelaka.net:1521:xe","USER29","USER29");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@db.pointman.site:1521:xe","SYSTEM","fx77131548");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	} 
	public static void main(String[] args) {
		getConnection();
	}

}
