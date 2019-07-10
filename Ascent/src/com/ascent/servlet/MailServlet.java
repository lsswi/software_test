package com.ascent.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Mailtb;
import com.ascent.bean.Productuser;
import com.ascent.dao.MailDAO;

public class MailServlet extends HttpServlet {

	 private static final String CONTENT_TYPE = "text/html; charset=GBK";
	 private   ServletContext sc=null;
	 public void init() throws ServletException {
		 super.init();
		 sc=this.getServletContext();
	 }
//	Process the HTTP Post request
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    doGet(request, response);
	  }
	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   String state=request.getParameter("a");
	   if (state.equals("all"))//如果是查询产品，处理查询业务。（all表示查询所有）
	   {
		  try {
			this.mailall(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   }
	   if(state.equals("save"))
	   {
		   String pid= request.getParameter("productId");
		   try {
			this.savemail(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	   }
	  
	  return;
	  }

	  
	  private void doBrowse(HttpServletRequest request, HttpServletResponse response,String url) throws
	    ServletException, IOException{
	    RequestDispatcher rd=sc.getRequestDispatcher(url);
	    rd.forward(request,response); 
	  }
	  private void doBrowseErr(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException{
      RequestDispatcher rd=sc.getRequestDispatcher("/product/products.jsp");
      rd.forward(request,response);
      }

	  private void doError(HttpServletRequest request, HttpServletResponse response,String error)throws
	  ServletException, IOException{
	  request.setAttribute("error",error);
	   this.doBrowseErr(request, response);
		}
	  //Clean up resources
	   public void destroy() {
		}
	  //定义一些业务处理方法
	  //查询所有方法
	   public void mailall(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException,SQLException
	   {
		   MailDAO mb = new MailDAO();
		   Mailtb mail;
		
			mail = mb.findmail();
		
		   if(mail==null)
		   {
			   String dthtml="管理员还没有设置邮件"; //管理员邮箱还没设置过，请进行下面的设置操作
			   response.setContentType("text/html; charset=gb2312");  
			   response.getOutputStream().print(dthtml);//返回name到 页面；
		   }
		   else
		   {
				HttpSession mysession = request.getSession(false);
				String faddress = mail.getFromaddress();
				String taddress = mail.getToaddress();
				String dthtml="发件地址："+faddress+"<br>收件地址："+taddress+"<br>如果想修改，请进行下面的操作";
				response.setContentType("text/html; charset=gb2312");
				response.getOutputStream().print(dthtml);//返回name到 页面；
		   } 
	   }
	   
//	 保存方法
	   public void savemail(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException,SQLException{
		   String formaddr= request.getParameter("fromaddressname");
		   String fromaddrtype= request.getParameter("fromaddresstype");
		   String frompassword= request.getParameter("frompassword");
		   String toaddress= request.getParameter("toaddress");
		   String fromaddress =formaddr+fromaddrtype;
		   System.out.println(fromaddress);
		   Mailtb mail = new Mailtb();	
		   mail.setFromaddress(fromaddress);
		   mail.setFrompassword(frompassword);
		   mail.setToaddress(toaddress);
		   MailDAO mb = new MailDAO();
		   mb.Savemail(mail);
		   this.doBrowse(request, response,"/product/mailmanager.jsp");
	   }
	
}
