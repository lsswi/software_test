package com.ascent.util.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DatabaseConfigParser {
	
	  private static Properties props = null;
	  private static String url;
	  private static String user;
	  private static String pwd;
	static {
		
		props = new Properties();
		
		try {
			props.load(DatabaseConfigParser.class.getClassLoader().getResourceAsStream("database.conf.properties"));
		   
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
	}
	public static Properties getProps(){
		
		return props;
	}
	
}
