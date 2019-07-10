package com.ascent.util.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;



public class DataAccess {
	
	  private static String driver;
	  private static String url;
	  private static String user;
	  private static String pwd;
	  static{
		  
		 
			try {
				
				Properties dbProps=DatabaseConfigParser.getProps();
				driver=dbProps.getProperty("dataSource.driver");				
				url=dbProps.getProperty("dataSource.url");
				user=dbProps.getProperty("dataSource.user");
				pwd=dbProps.getProperty("dataSource.password");
				
				Class.forName(driver);
			} catch (Exception e) {
				e.printStackTrace();
			}
	  }
	  
	  public DataAccess() throws Exception {
	     
	  }

	  public static Connection getConnection(){
	     Connection con=null;
	     try {
	      con = DriverManager.getConnection(url, user, pwd);
	     }
	     catch (Exception ex) {
	    	 ex.printStackTrace();
	     }
	     return con;
	  }

}
