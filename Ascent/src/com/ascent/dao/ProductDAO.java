package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ascent.bean.Product;
import com.ascent.util.DataAccess;

public class ProductDAO {

	public List getallProduct()
	{
		 List list=new ArrayList();
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p  order by p.pid ";
		 Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setStock(rs.getString("stock"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setNote(rs.getString("note"));
		         pu.setDelFlag(rs.getInt("del_flag"));
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
	//	根据商品编号查询商品
	public List getbyProductId(String productid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p.product_id='"+productid+"' order by p.pid ";
		 Statement stmt;
		  List list = new ArrayList();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		        	 Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setStock(rs.getString("stock"));
		         pu.setRealstock(rs.getString("realstock"));
		        // pu.setNumber(rs.getString("number"));
		         pu.setNote(rs.getString("note"));
		         pu.setDelFlag(rs.getInt("del_flag"));
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
	
	//根据pid主键查询商品
	public Product getProductbyPid(int pid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p.pid="+pid+" order by p.pid ";
		 Statement stmt;
		  Product pu= new Product();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		             pu.setPid(rs.getInt("pid"));
			         pu.setProductId(rs.getString("product_id"));
			         pu.setProductname(rs.getString("productname"));
			         pu.setCatalogno(rs.getString("catalogno"));
			         pu.setCas(rs.getString("cas"));
			         pu.setFormula(rs.getString("formula"));
			         pu.setMdlnumber(rs.getString("mdlnumber"));
			         pu.setMw(rs.getString("mw"));
			         pu.setNewproduct(rs.getString("newproduct"));
			         pu.setStructure(rs.getString("structure"));
			         pu.setRealstock(rs.getString("realstock"));
			         pu.setPrice1(rs.getString("price1"));
			         pu.setPrice2(rs.getString("price2"));
			         pu.setCategory(rs.getString("category"));
			        
			         pu.setStock(rs.getString("stock"));
			         pu.setRealstock(rs.getString("realstock"));
			        // pu.setNumber(rs.getString("number"));
			        // pu.setNewproduct(rs.getInt("newproduct"));
			         pu.setNote(rs.getString("note"));
			         pu.setDelFlag(rs.getInt("del_flag"));
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
	//删除商品
//	根据pid主键查询商品
	public void DelProductbyPid(int pid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="delete from product where pid="+pid;
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
//	批量添加excel中产品
	/*public void saveExcelProduct(ArrayList arrayList)throws SQLException
	{
		Connection con = DataAccess.getConnection();
		Statement stmt;
		stmt = con.createStatement();
		for(int i=0;i<arrayList.size();i++){//for(1)
			//取出每个Sheet的内容
			ArrayList arrayList_Sheet=(ArrayList)arrayList.get(i);
			for(int j=0;j<arrayList_Sheet.size();j++){//for(2)
				//取出每个Row的内容
				ArrayList arrayList_Row=(ArrayList)arrayList_Sheet.get(j);
				Product p = new Product();
				String sqlStr="";
				///for(int k=0;k<arrayList_Row.size();k++){//for(3)
					p.setProductId((String)arrayList_Row.get(0));
					p.setProductname((String)arrayList_Row.get(1));
					p.setAuthor((String)arrayList_Row.get(2));
					p.setPublisher((String)arrayList_Row.get(3));
					p.setImage((String)arrayList_Row.get(4));
					p.setPrice1((String)arrayList_Row.get(5));
					p.setStock((String)arrayList_Row.get(6));
					p.setRealstock((String)arrayList_Row.get(7));
					p.setCategory((String)arrayList_Row.get(8));
					String a= (String)(arrayList_Row.get(9));
					p.setNewproduct(Integer.valueOf(a));	
				
				//}//for(3)
				sqlStr = "insert into product (product_id,productname,author,publisher,price1,category,image,stock,realstock,note,newproduct,del_flag) "
                    + "  values ('" + p.getProductId()+"',"
                                  + "'"+p.getProductname()+"',"
                                  + "'"+p.getAuthor()+"',"
                                  + "'"+p.getPublisher()+"',"
                                  + "'"+p.getPrice1()+"',"
                                  + "'"+p.getCategory()+"',"
                                  + "'"+p.getImage()+"',"
                                  + "'"+p.getStock()+"',"
                                  + "'"+p.getRealstock()+"',"
                                  + "'"+p.getNote()+"',"
                                  + p.getNewproduct()+","
                                  + "1"
                                  +" )";
				stmt.executeUpdate(sqlStr);   
				
			}//for(2)
			
		}//for(1)

		stmt.close();
		con.close();  
	}*/
	
	//保存产品信息
	public void Saveproduct(Product pdt)throws SQLException
	{
		 Connection con = DataAccess.getConnection();
		    String sqlStr = "insert into product (product_id,productname,catalogno,cas,price1,price2,mdlnumber,newproduct,formula," 
		    		+"mw,category,structure,stock,realstock,note,del_flag) "
		                    + "  values ('" + pdt.getProductId()+"',"
		                                  + "'"+pdt.getProductname()+"',"
		                                  + "'"+pdt.getCatalogno()+"',"
		                                  + "'"+pdt.getCas()+"',"
		                                  + "'"+pdt.getPrice1()+"',"
		                                  + "'"+pdt.getPrice2()+"',"
		                                  + "'"+pdt.getMdlnumber()+"',"
		                                  + "'"+pdt.getNewproduct()+"',"
		                                  + "'"+pdt.getFormula()+"',"
		                                  + "'"+pdt.getMw()+"',"
		                                  + "'"+pdt.getCategory()+"',"
		                                  + "'"+pdt.getStructure()+"',"
		                                  + "'"+pdt.getStock()+"',"
		                                  + "'"+pdt.getRealstock()+"',"
		                                  + "'"+pdt.getNote()+"',"
		                                  + "1"
		                                  +" )";
		    Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sqlStr);
			stmt.close();
			con.close();   
		   
	}
	//修改产品信息
	public void Updateproduct(Product pdt)throws SQLException
	{
		 Connection con = DataAccess.getConnection();
		    String sqlStr = "update product  set  product_id='"+pdt.getProductId()+"',"
		    +"productname='"+pdt.getProductname()+"',catalogno='"+pdt.getCatalogno()+"',"
		    +"cas='"+pdt.getCas()+"',price1='"+pdt.getPrice1()+"',price2='"+pdt.getPrice2()+"'," 
		    +"mdlnumber='"+pdt.getMdlnumber()+"',newproduct='"+pdt.getNewproduct()+"'," 
		    +"formula='"+pdt.getFormula()+"',mw='"+pdt.getMw()+"',"
		    +"category='"+pdt.getCategory()+"',"
		    +"stock='"+pdt.getStock()+"',realstock='"+pdt.getRealstock()+"',"
		    +"note='"+pdt.getNote()+"'";
		    if (pdt.getStructure()!=null&&!pdt.getStructure().equals(""))
		    {
		    	sqlStr = sqlStr+",structure='"+pdt.getStructure()+"'";
		    }
		    sqlStr = sqlStr+" where pid="+pdt.getPid(); 
		    Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sqlStr);
			stmt.close();
			con.close();   
		   
	}
	
//	根据pid主键查询商品
	public List SearchProcuct(String searchName, String searchValue)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p."+searchName+" like '%%"+searchValue+"%' and p.del_flag=1 ";
		 Statement stmt;
		 List productlist = new ArrayList();
			try {
				 stmt = con.createStatement();
				 ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setNote(rs.getString("note"));
		         pu.setStock(rs.getString("stock"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         productlist.add(pu);
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return productlist;
		
	}

}
