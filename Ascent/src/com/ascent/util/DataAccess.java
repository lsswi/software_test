package com.ascent.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class DataAccess {
  private static String driver;
  private static String url;
  private static String user;
  private static String pwd;
  static{
	  
	  DatabaseConfigParser databaseConfig=new DatabaseConfigParser();
		try {
			databaseConfig.parse("database.conf.xml");
			Properties dbProps=databaseConfig.getProps();
			driver=dbProps.getProperty("driver");
			url=dbProps.getProperty("url");
			user=dbProps.getProperty("user");
			pwd=dbProps.getProperty("password");
		} catch (Exception e) {
			e.printStackTrace();
		}
  }
  
  public DataAccess() throws Exception {
     
  }

  public static Connection getConnection(){
     Connection con=null;
     try {
      Class.forName(driver);
      con = DriverManager.getConnection(url, user, pwd);
     }
     catch (Exception ex) {
    	 ex.printStackTrace();
     }
     return con;
  }
  
  public static Connection getConnectionByDS(){
	  Connection con = null;  
	  try{
	    Context ctx = new InitialContext();
	    DataSource ds = (DataSource)ctx.lookup("ebsDS");
	    con = ds.getConnection();
	  }catch(Exception e){e.printStackTrace();}
	  
	  return con;
  }
}
