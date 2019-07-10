package com.ascent.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;
import com.ascent.dao.UserManagerDAO;

public class UserManagerServlet extends HttpServlet{
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
	   if(loginstate.equals("all"))//为退出系统动作
	   {
	   this.findAllUser(request, response);
	   }
	   if(loginstate.equals("regis"))//为退出系统动作
	   {
	   this.AddUser(request, response);
	   }
	   if(loginstate.equals("finduser"))//查找用户
	   {
		   this.findProductUserbyid(request, response);
	   }
	   if(loginstate.equals("update"))//更新用户信息
	   {
		this.UpdateProductUser(request, response);
	   }
	   if(loginstate.equals("updatesuper"))//更新用户信息
	   {
		this.UpdateUserSuper(request, response);
	   }
	   if(loginstate.equals("delsuser"))//更新用户信息
	   {
		this.DelSoftUser(request, response);
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
      RequestDispatcher rd=sc.getRequestDispatcher("/product/register.jsp");
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
	   //查询所有用户
	   public void findAllUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		  UserManagerDAO um = new UserManagerDAO();
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		   this.doBrowse(request, response,"/product/products_showusers.jsp");
	   }
	   //更改用户的权限
	   public void UpdateUserSuper(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   String supers = request.getParameter("superuser");
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   um.UpdateSuperuser(uid, supers);
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		   this.doBrowse(request, response,"/product/products_showusers.jsp");
	   }
	   
//	 软删除用户
	   public void DelSoftUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   String valuea=request.getParameter("value");
		   int a = Integer.valueOf(valuea);
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   um.Delsoftuser(uid,a);
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		   this.doBrowse(request, response,"/product/products_showusers.jsp");
	   }
	   public void findProductUserbyid(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   HttpSession mysession = request.getSession(false);
		   Productuser allProductuser = um.getproductuserbyid(uid);
		   mysession.setAttribute("UID_Productuser", allProductuser);
		   this.doBrowse(request, response,"/product/updateproductuser.jsp");
	   }
	   
	   public void UpdateProductUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		  String uids = request.getParameter("uid");
		  String citys =request.getParameter("city");
		  String usernames =request.getParameter("username");
		  String fullnames =request.getParameter("fullname");
		  String titles =request.getParameter("title");
		  String tels =request.getParameter("tel");
		  String passwords =request.getParameter("password");
		  String zips =request.getParameter("zip");
		  String jobs =request.getParameter("job");
		  String emails =request.getParameter("email");
		  String countrys =request.getParameter("country");
		  String companynames =request.getParameter("companyname");
		  String companyaddresss= request.getParameter("companyaddress");
		  String notes =request.getParameter("note");
		  Productuser productuser = new Productuser();
		  productuser.setUid(Integer.valueOf(uids));
		  productuser.setCity(citys);
		  productuser.setUsername(usernames);
		  productuser.setFullname(fullnames);
		  productuser.setTitle(titles);
		  productuser.setTel(tels);
		  productuser.setPassword(passwords);
		  productuser.setZip(zips);
		  productuser.setJob(jobs);
		  productuser.setEmail(emails);
		  productuser.setCountry(countrys);
		  productuser.setCompanyname(companynames);
		  productuser.setCompanyaddress(companyaddresss);
		  productuser.setNote(notes);
		  UserManagerDAO um = new UserManagerDAO();
		  um.UpdateProductuser(productuser);
		  HttpSession mysession = request.getSession(false);
		  List allProductList = um.getAllProductUser();
		  mysession.setAttribute("allproductlist", allProductList);
		  this.doBrowse(request, response,"/product/products_showusers.jsp");
	   }
	   public void AddUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   HttpSession session = request.getSession(false);
		   UserManagerDAO um = new UserManagerDAO();
//		 从session中取验证码
		      String code_temp = (String)session.getAttribute("CODE");
		      //获取页面form里的属性值
		      String codes =request.getParameter("code");
		      String usernames =request.getParameter("username");
			  String passwords =request.getParameter("password");
			  String companynames =request.getParameter("companyname");
			  String companyaddresss= request.getParameter("companyaddress");
			  String countrys =request.getParameter("country");
			  String citys =request.getParameter("city");
			  String jobs =request.getParameter("job");
			  String tels =request.getParameter("tel");
			  String zips =request.getParameter("zip");
			  String emails =request.getParameter("email");
			  
			//将session中验证码强行清空，更安全
		   session.setAttribute("CODE", null);
		   if(!code_temp.equalsIgnoreCase(codes.trim())){
				this.doError(request, response, "regist_tip.code.error");//"您输入的验证码不匹配，请重新注册"
			}else{
				Productuser pu= um.findProductUserbyusername(usernames);
				if(pu!=null){
					this.doError(request, response, "regist_tip.username.used");//"您使用的用户名已经被占用了，请重新注册"
				}else
				{
				  Productuser productuser = new Productuser();
				  productuser.setCity(citys);
				  productuser.setUsername(usernames);
				  productuser.setTel(tels);
				  productuser.setPassword(passwords);
				  productuser.setZip(zips);
				  productuser.setJob(jobs);
				  productuser.setEmail(emails);
				  productuser.setCountry(countrys);
				  productuser.setCompanyname(companynames);
				  productuser.setCompanyaddress(companyaddresss);
				  productuser.setSuperuser("1");
				  um.AddProductuser(productuser);
				  this.doBrowse(request, response,"/product/regist_succ.jsp");
				}
	   }
	   }
	
}
