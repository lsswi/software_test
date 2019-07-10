 package com.ascent.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;
import com.ascent.dao.LoginDAO;
import com.ascent.util.PageBean;

public class LoginServlet extends HttpServlet {

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
	   //获取登录状态（登录或退出系统）；
	   String loginstate= request.getParameter("a");
	   if(loginstate.equals("out"))//为退出系统动作
	   {
	     this.Loginout(request, response);
	   }
	   if(loginstate.equals("login"))//为系统登录动作
	   {
	      this.Userlogin(request, response);
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

	  private void doError(HttpServletRequest request, HttpServletResponse response,String error) throws
	  ServletException, IOException{
	  request.setAttribute("error",error);
	   this.doBrowseErr(request, response);
	 }
	  //Clean up resources
	   public void destroy() {
		}
	   
	   public void Userlogin(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String name= request.getParameter("username");
		   String password=request.getParameter("password");
		   LoginDAO Ld = new LoginDAO();
		   Productuser puser= Ld.login(name, password);
		   if(puser==null)
		   {
			   this.doError(request, response,"productuserL_tip.login.fail");
		   }
		   else
		   {// 用户登录成功  这里开始判断权限 将用户保存到session
				
			   String superuser = puser.getSuperuser();
			   HttpSession mysession = request.getSession(false);
			   mysession.setAttribute("productuser", puser);
				if(superuser.equals("1")){//普通注册用户
					 this.doBrowse(request, response,"/product/products.jsp");
				}else if(superuser.equals("2")){//分配了能看到某些药品价格的用户
					 this.doBrowse(request, response,"/product/products.jsp");
				}else if(superuser.equals("3")){//admin 因为第一次来此页面 设置页数为1 
					List allProductList = Ld.getalluser();
					mysession.setAttribute("allproductlist", allProductList);
					this.doBrowse(request, response,"/product/products_showusers.jsp");
				}
		   }
		   
	   }
	   public void Loginout(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   HttpSession session = request.getSession(false);
		   //清空所有session；
		   session.invalidate();
		   //返回首页
		   this.doBrowse(request, response,"/index.jsp");
	   }
	   
}
