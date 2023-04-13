package utill;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.TestGenerator;

import util.DBConn;

public class DBConnTests {
	
	public static void main(String[] args) {
		testGetConnection();
	}
	public static  void testGetConnection() {
		System.out.println(DBConn.getConnection());
		
	}
}
