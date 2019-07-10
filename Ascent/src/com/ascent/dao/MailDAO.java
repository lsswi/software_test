package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ascent.bean.Mailtb;
import com.ascent.util.DataAccess;


public class MailDAO {
	
	public Mailtb findmail() throws SQLException
	{
		Connection conn = DataAccess.getConnection();
		Statement st;
		st=conn.createStatement();
		String sql="select * from mailtb";
		ResultSet rs= st.executeQuery(sql);
		Mailtb mt= new Mailtb();
		while(rs.next())
		{
			 mt.setFromaddress(rs.getString("fromaddress"));
			 mt.setFrompassword(rs.getString("frompassword"));
			 mt.setToaddress(rs.getString("toaddress"));
		}
		st.close();
		conn.close();
		return mt;
	}
	
	public void Savemail(Mailtb mt) throws SQLException
	{
		Connection conn =	(Connection) DataAccess.getConnection();
		Statement st;
		st=conn.createStatement();
		String sql="insert into mailtb values (1,'"+mt.getFromaddress()+"','"+mt.getFrompassword()+"','"+mt.getToaddress()+"','"
		+"','"+"','"+"','"+"')";
		st.execute("truncate mailtb");
		st.executeUpdate(sql);
		st.close();
		conn.close();
		
	}

}
