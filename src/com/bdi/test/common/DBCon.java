package com.bdi.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {

	private final static String URL;
	private final static String ID;
	private final static String PWD;
	private final static String DRIVER_NAME;
	
    static {
		URL = "jdbc:oracle:thin:@localhost:1521:xe";
		ID ="BDI";
		PWD="12345678";
		DRIVER_NAME="oracle.jdbc.driver.OracleDriver";
				
		try {
			Class.forName(DRIVER_NAME);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
		private static Connection con;
		// throws 던지다
		public static Connection getCon() {
			if(con==null) {
				try {
					con =DriverManager.getConnection(URL,ID,PWD);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return con;
		}
		
	
}
