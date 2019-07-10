package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.ascent.bean.Productuser;
import com.ascent.util.DataAccess;

public class UserManagerDAO {
	
	 public Productuser getproductuserbyid(int uid) {
		 Connection con = DataAccess.getConnection();
		 String sql="select * from productuser p where p.uid="+uid;
		 Statement stmt;
		 Productuser pu = new Productuser();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         pu.setUid(rs.getInt("uid"));
		         pu.setUsername(rs.getString("username"));
		         pu.setPassword(rs.getString("password"));
		         pu.setFullname(rs.getString("fullname"));
		         pu.setCountry(rs.getString("country"));
		         pu.setCity(rs.getString("city"));
		         pu.setEmail(rs.getString("email"));
		         pu.setZip(rs.getString("zip"));
		         pu.setJob(rs.getString("job"));
		         pu.setTitle(rs.getString("title"));
		         pu.setNote(rs.getString("note"));
		         pu.setCompanyname(rs.getString("companyname"));
		         pu.setCompanyaddress(rs.getString("companyaddress"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         pu.setTel(rs.getString("tel"));
		         pu.setSuperuser(rs.getString("superuser"));
		        }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return pu;
	 }
	 
	 public Productuser findProductUserbyusername(String username) {
		 Connection con = DataAccess.getConnection();
		 String sql="select * from productuser p where p.username='"+username+"'";
		 
		 Statement stmt;
		 Productuser pu = null;
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         pu.setUid(rs.getInt("uid"));
		         pu.setUsername(rs.getString("username"));
		         pu.setPassword(rs.getString("password"));
		         pu.setFullname(rs.getString("fullname"));
		         pu.setCountry(rs.getString("country"));
		         pu.setCity(rs.getString("city"));
		         pu.setEmail(rs.getString("email"));
		         pu.setZip(rs.getString("zip"));
		         pu.setJob(rs.getString("job"));
		         pu.setTitle(rs.getString("title"));
		         pu.setNote(rs.getString("note"));
		         pu.setCompanyname(rs.getString("companyname"));
		         pu.setCompanyaddress(rs.getString("companyaddress"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         pu.setTel(rs.getString("tel"));
		         pu.setSuperuser(rs.getString("superuser"));
		        }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return pu;
	 }
//	添加用户信息
	 public void AddProductuser(Productuser pu) {
		 Connection con = DataAccess.getConnection();
		 
		 String sqlStr = "insert into productuser (username,password,country,tel,email,zip,job,superuser,companyname,companyaddress,del_flag) "
             + "  values ('" + pu.getUsername()+"',"
                           + "'"+pu.getPassword()+"',"
                           + "'"+pu.getCountry()+"',"
                           + "'"+pu.getTel()+"',"
                           + "'"+pu.getEmail()+"',"
                           + "'"+pu.getZip()+"',"
                           + "'"+pu.getJob()+"',"
                           + "'"+pu.getSuperuser()+"',"
                           + "'"+pu.getCompanyname()+"',"
                           + "'"+pu.getCompanyaddress()+"',"
                           + "1"
                           +" )";

		 Statement stmt;
		 try {
			stmt = con.createStatement();
			stmt.executeUpdate(sqlStr);
			stmt.close();
			con.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
	 }
	 
	//更新用户信息
	 public void UpdateProductuser(Productuser pu) {
		 Connection con = DataAccess.getConnection();
		 String sql="update productuser set username='"+pu.getUsername()+"'," 
		                                   +"password='"+pu.getPassword()+"',"
		                                   +"fullname='"+pu.getFullname()+"',"
		                                   +"country='"+pu.getCountry()+"',"
		                                   +"tel='"+pu.getTel()+"',"
		                                   +"city='"+pu.getCity()+"',"
		                                   +"email='"+pu.getEmail()+"',"
		                                   +"zip='"+pu.getZip()+"',"
		                                   +"job='"+pu.getJob()+"',"
		                                   +"note='"+pu.getNote()+"',"
		                                   +"title='"+pu.getTitle()+"',"
		                                   +"companyname='"+pu.getCompanyname()+"',"
		                                   +"companyaddress='"+pu.getCompanyaddress()
		                                   +"' where uid="+pu.getUid();
		 Statement stmt;
				try {
					stmt = con.createStatement();
					 stmt.executeUpdate(sql);
					 stmt.close();
			         con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	 }
	 
//	更新用户权限
	 public void UpdateSuperuser(int uid,String supers) {
		 Connection con = DataAccess.getConnection();
		 String sql="update productuser set superuser='"+supers+"' where uid="+uid;
		 Statement stmt;
				try {
					 stmt = con.createStatement();
					 stmt.executeUpdate(sql);
					 stmt.close();
			         con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	 }
	  
	 
//		屏蔽用户（软删除用户0为删除）
	 public void Delsoftuser(int uid,int a) {
		 Connection con = DataAccess.getConnection();
		 String sql="update productuser set del_flag="+a+" where uid="+uid;
		 Statement stmt;
				try {
					 stmt = con.createStatement();
					 stmt.executeUpdate(sql);
					 stmt.close();
			         con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	 }
	  
//查询所有用户
	 public List getAllProductUser() {
		 Connection con = DataAccess.getConnection();
		 String sql="select * from productuser p order by p.uid";
		 Statement stmt;
		 List list = new ArrayList();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()){
				 Productuser pu = new Productuser();
		         pu.setUid(rs.getInt("uid"));
		         pu.setUsername(rs.getString("username"));
		         pu.setFullname(rs.getString("fullname"));
		         pu.setCompanyname(rs.getString("companyname"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         pu.setTel(rs.getString("tel"));
		         pu.setSuperuser(rs.getString("superuser"));
		         pu.setEmail(rs.getString("email"));
		         list.add(pu);
		        }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	 }
}
