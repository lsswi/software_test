package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ascent.bean.Product;
import com.ascent.bean.Productuser;
import com.ascent.util.test.DataAccess;




public class LoginDAO {

	public Productuser login(String user, String password) {
		
         Connection con = DataAccess.getConnection();
         String sql = "select * from productuser where username='"
                      + user+"' AND password ='"
                      + password+"' and del_flag=1" ;
         Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
	         while (rs.next()){
	         Productuser pu= new Productuser();
	         pu.setUid(rs.getInt("uid"));
	         pu.setSuperuser(rs.getString("superuser"));
	         pu.setUsername(rs.getString("username"));
	         pu.setEmail(rs.getString("email"));
	        
	         return pu;
	         }
	        
	         rs.close();
	         stmt.close();
	         con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
         return null;
   }
	 public List getalluser() {
		 Connection con = DataAccess.getConnection();
		 String sql="select * from productuser p  order by p.uid ";
		 List list= new ArrayList();
		 Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         Productuser pu= new Productuser();
		         pu.setUid(rs.getInt("uid"));
		         pu.setCompanyname(rs.getString("companyname"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         pu.setTel(rs.getString("tel"));
		         pu.setSuperuser(rs.getString("superuser"));
		         pu.setUsername(rs.getString("username"));
		         pu.setEmail(rs.getString("email"));
		         list.add(pu);
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
	 }

}
