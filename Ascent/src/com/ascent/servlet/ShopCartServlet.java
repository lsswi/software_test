package com.ascent.servlet;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Product;
import com.ascent.dao.ProductDAO;
import com.ascent.util.ShopCart;

public class ShopCartServlet extends HttpServlet {
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
	   String state= request.getParameter("a");
	   if(state.equals("add"))//向购物车添加产品动作
	   {
		   this.addtoShopCart(request, response);
	   }
	   if(state.equals("find"))//查找购物车添加产品动作
	   {
		   this.findShopCart(request, response);
	   }
	   if(state.equals("checkout"))//结帐
	   {
		   this.checkout(request, response);
	   }
	   if(state.equals("move"))
	   {
		   this.delShopCartProduct(request, response);
	   }
	   if(state.equals("updateNum"))
	   {
		   this.updateCartProductNum(request, response);
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
	 //想客户端返回提示信息 
	  private void dostate(HttpServletRequest request, HttpServletResponse response,String state) throws
	  ServletException, IOException{
	  request.setAttribute("temp",state);
	   this.doBrowseErr(request, response);
	 }
	  //Clean up resources
	   public void destroy() {
		}
	  private void addtoShopCart(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  
		   HttpSession session = request.getSession(false);
		   ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		   if(ShopCart==null)
		   {
			   ShopCart= new ShopCart();
			   System.out.println("不存在 。。。。");
		   }
		   String pid = request.getParameter("pid");
		   int ppid =Integer.parseInt(pid);
		   boolean bl = ShopCart.CheckHashMapid(pid);//判断购物车是否已经添加
		   System.out.println(pid+" ture wei 存在 "+bl);
		   if(bl)//该产品已经添加
		   {
//			 Ajax返回该商品已经添加过的提示
				String dthtml ="该产品已经保存在购物车里";//"该商品已经添加过";
				response.setContentType("text/html; charset=gb2312");
				response.getWriter().print(dthtml);//返回页面
		   }else//没有添加
		   {
			   ProductDAO pd = new ProductDAO();
			   Product product= pd.getProductbyPid(ppid);
			   product.setStructure("5g");
			   ShopCart.addProduct(pid,product);
			   String dthtml ="添加成功";//"该商品已经添加过";
			   response.setContentType("text/html; charset=gb2312");			   
			   response.getWriter().print(dthtml);//返回页面
			   response.getWriter().flush();
			  
		   }
		   response.getWriter().flush();
		   session.setAttribute("shopcart", ShopCart);
	  }
	  private void findShopCart(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		   ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		   if(ShopCart==null)
		   {
			   ShopCart= new ShopCart();
		   } 
		   Collection ShopCartlist =  ShopCart.getHashmap().values();//返回购物车里value的视图（collection）
		   session.setAttribute("shopcartlist", ShopCartlist);
		   this.doBrowse(request, response, "/product/cartshow.jsp");
	  }
	  private void delShopCartProduct(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  String pid = request.getParameter("pid");
		  ShopCart.removeHashMap(pid);
		  Collection ShopCartlist = ShopCart.getHashmap().values();//返回购物车里value的视图（collection）
		  session.setAttribute("shopcartlist", ShopCartlist);
		  this.doBrowse(request, response, "/product/cartshow.jsp");
	  }
	  
	  private void updateCartProductNum(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  String pid = request.getParameter("pid");
		  String number = request.getParameter("quantity");
		  ShopCart.UpdateProductNumbedr(pid, number);
		  //session.setAttribute("shopcart", ShopCart);
		  //Ajax返回该商品已经添加过的提示
		  String dthtml ="该产品已经修改";//"该商品已经添加过";
		  response.setContentType("text/html; charset=gb2312");
		  response.getWriter().print(dthtml);//返回页面 
	  }
	  
	  private void checkout(HttpServletRequest request, HttpServletResponse response) throws
	  ServletException, IOException{
		  HttpSession session = request.getSession(false);
		  ShopCart ShopCart = (ShopCart)session.getAttribute("shopcart");
		  Collection ShopCartlist = ShopCart.getHashmap().values();//返回购物车里value的视图（collection）
		  session.setAttribute("shopcartlist", ShopCartlist);
		  this.doBrowse(request, response, "/product/checkout.jsp");
	  }
}

