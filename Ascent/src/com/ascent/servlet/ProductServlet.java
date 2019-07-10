package com.ascent.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Product;
import com.ascent.bean.Productuser;
import com.ascent.dao.ProductDAO;
import com.jspsmart.upload.SmartUpload;


public class ProductServlet extends HttpServlet {
	 private static final String CONTENT_TYPE = "text/html; charset=GBK";
	 private   ServletContext sc=null;
	 private ServletConfig config=null;
	 private String uploadPath = "upload"; // 用于存放上传文件的目录
	 public void init() throws ServletException {
		 super.init();
		 sc=this.getServletContext();
		 config=this.getServletConfig();
			
		    // 文件夹不存在就自动创建：
		    if(!new File(uploadPath).isDirectory())
		        new File(uploadPath).mkdirs();
	 }
	

//	Process the HTTP Post request
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    doGet(request, response);
	  }
	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   String state=request.getParameter("a");
	   if (state.equals("all"))//如果是查询产品，处理查询业务。（all表示查询所有）
	   {
		  this.produceall(request, response);
	   }
	   if(state.equals("save"))
	   {
		   this.productadd(request, response);
	   }
	   if(state.equals("search"))
	   {
		   this.productSerach(request, response);
	   }
	   if(state.equals("updateProduct"))//执行更新的查询
	   {
		 this.productSerachbyid(request, response);
	   }
	   if(state.equals("update"))//保存更新信息
	   {
		 this.updateproduct(request, response);
	   }
	   if(state.equals("del"))//保存更新信息
	   {
		 this.deleteproduct(request, response);
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
	   public void produceall(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   ProductDAO Pd = new ProductDAO();
		   List ProcuctList= Pd.getallProduct();
		   if(ProcuctList==null)
		   {
			   this.doError(request, response,"productuserL_tip.login.fail");
		   }
		   else
		   {
				HttpSession mysession = request.getSession(false);
				Productuser pu= (Productuser)mysession.getAttribute("productuser");
				mysession.setAttribute("productlist", ProcuctList);
				if(pu==null)//如果是游客
				{
					this.doBrowse(request, response,"/product/products_show.jsp");
				}else// 如果是注册用户
				{
					if(pu.getSuperuser().equals("3"))//判断是否管理员浏览产品页（分为管理员和非管理员浏览产品）
					{
					this.doBrowse(request, response,"/product/admin_products_show.jsp");	
					}
					else
					{	
					this.doBrowse(request, response,"/product/products_show.jsp");
					}
				}
		   } 
	   }
	   //修改方法；
	   //保存产品
	   public void productadd(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		 
		      SmartUpload mySmartUpload =new SmartUpload();
		      try { 
		       // Initialization
		       mySmartUpload.initialize(config, request, response);
		       mySmartUpload.setMaxFileSize(500 * 1024);
		       // Upload
		       mySmartUpload.upload();
		       //取得text框中的数据
		       String proid= mySmartUpload.getRequest().getParameter("productId");
			   String pname= mySmartUpload.getRequest().getParameter("productname");
			   String pcatalogno= mySmartUpload.getRequest().getParameter("catalogno");
			   String pcas= mySmartUpload.getRequest().getParameter("cas");
			   String pmdlnumber= mySmartUpload.getRequest().getParameter("mdlnumber");
			   String pnewproduct= mySmartUpload.getRequest().getParameter("newproduct");
			   String pformula= mySmartUpload.getRequest().getParameter("formula");
			   String pmw= mySmartUpload.getRequest().getParameter("mw");
			   String pcategory= mySmartUpload.getRequest().getParameter("category");
			   String pstock= mySmartUpload.getRequest().getParameter("stock");
			   String prealstock= mySmartUpload.getRequest().getParameter("realstock");
			   String pprice1= mySmartUpload.getRequest().getParameter("price1");
			   String pprice2= mySmartUpload.getRequest().getParameter("price2");
			   String pnote= mySmartUpload.getRequest().getParameter("note");
			   Product pdt = new Product();
			   pdt.setProductId(proid);
			   pdt.setProductname(pname);
			   pdt.setCatalogno(pcatalogno);
			   pdt.setCas(pcas);
			   pdt.setMdlnumber(pmdlnumber);
			   pdt.setNewproduct(pnewproduct);
			   pdt.setFormula(pformula);
			   pdt.setMw(pmw);
			   pdt.setCategory(pcategory);
			   pdt.setStock(pstock);
			   pdt.setRealstock(prealstock);
			   pdt.setPrice1(pprice1);
			   pdt.setPrice2(pprice2);
			   pdt.setNote(pnote);
			   com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0); 
		        //获取上传文件名称和后缀
		        String fileName = myfile.getFileName(); 
		        if(fileName!=null&&!fileName.equals(""))
		        {
		        pdt.setStructure(fileName);  
		        myfile.saveAs("/"+uploadPath+"/"+ fileName,1);
		        }
		       System.out.println("uploading  success! "); 
		       ProductDAO Pd = new ProductDAO();
		       Pd.Saveproduct(pdt);
		      } catch (Exception e) { 
		       System.out.println("Unable to upload the file.<br>"); 
		       System.out.println("Error : " + e.toString()); 
		      } 
		      try {
				this.produceall(request, response);
			   } catch (ServletException e) {
				e.printStackTrace();
			  }
	   }
	   
	   public void productSerach(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String searchNames= request.getParameter("searchName");
		   String searchValues=request.getParameter("searchValue");
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   List ProductList= Pd.SearchProcuct(searchNames, searchValues);
		   mysession.setAttribute("searchproductlist", ProductList);
		   this.doBrowse(request, response,"/product/products_search_show.jsp");
	   }
	   
	   public void productSerachbyid(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String productid= request.getParameter("pid");
		   int pid = Integer.valueOf(productid);
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   Product product= Pd.getProductbyPid(pid);
		   mysession.setAttribute("pid_product", product);
		   this.doBrowse(request, response,"/product/update_products_admin.jsp");
	   }
	   //更新产品
	   public void updateproduct(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   SmartUpload mySmartUpload =new SmartUpload();
		      try { 
		       // Initialization
		       mySmartUpload.initialize(config, request, response);
		       mySmartUpload.setMaxFileSize(500 * 1024);
		       // Upload
		       mySmartUpload.upload();
		       //取得text框中的数据
		       String productid= mySmartUpload.getRequest().getParameter("pid");
		       int pid = Integer.valueOf(productid);
		       String proid= mySmartUpload.getRequest().getParameter("productId");
			   String pname= mySmartUpload.getRequest().getParameter("productname");
			   String pcatalogno= mySmartUpload.getRequest().getParameter("catalogno");
			   String pcas= mySmartUpload.getRequest().getParameter("cas");
			   String pmdlnumber= mySmartUpload.getRequest().getParameter("mdlnumber");
			   String pnewproduct= mySmartUpload.getRequest().getParameter("newproduct");
			   String pformula= mySmartUpload.getRequest().getParameter("formula");
			   String pmw= mySmartUpload.getRequest().getParameter("mw");
			   String pcategory= mySmartUpload.getRequest().getParameter("category");
			   String pstock= mySmartUpload.getRequest().getParameter("stock");
			   String prealstock= mySmartUpload.getRequest().getParameter("realstock");
			   String pprice1= mySmartUpload.getRequest().getParameter("price1");
			   String pprice2= mySmartUpload.getRequest().getParameter("price2");
			   String pnote= mySmartUpload.getRequest().getParameter("note");
			   Product pdt = new Product();
			   pdt.setPid(pid);
			   pdt.setProductId(proid);
			   pdt.setProductname(pname);
			   pdt.setCatalogno(pcatalogno);
			   pdt.setCas(pcas);
			   pdt.setMdlnumber(pmdlnumber);
			   pdt.setNewproduct(pnewproduct);
			   pdt.setFormula(pformula);
			   pdt.setMw(pmw);
			   pdt.setCategory(pcategory);
			   pdt.setStock(pstock);
			   pdt.setRealstock(prealstock);
			   pdt.setPrice1(pprice1);
			   pdt.setPrice2(pprice2);
			   pdt.setNote(pnote);
		 	   com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0); 
		        //获取上传文件名称和后缀
		        String fileName = myfile.getFileName(); 
		        System.out.println(fileName+"----文件的路径-"+myfile);
		        if(fileName!=null&&!fileName.equals(""))
		        {
		        pdt.setStructure(fileName);
		        myfile.saveAs("/"+uploadPath+"/"+ fileName,1);
		        }
		       System.out.println("uploading  success! "); 
		       ProductDAO Pd = new ProductDAO();
		    	   Pd.Updateproduct(pdt);
		        System.out.println("是更新操作");
		      } catch (Exception e) { 
		       System.out.println("Unable to upload the file.<br>"); 
		       System.out.println("Error : " + e.toString()); 
		      } 
		      try {
				this.produceall(request, response);
			   } catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			  }
	   }
	   //删除产品
	   public void deleteproduct(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String productid= request.getParameter("pid");
		   int pid = Integer.valueOf(productid);
		   HttpSession mysession = request.getSession(false);
		   ProductDAO Pd = new ProductDAO();
		   Pd.DelProductbyPid(pid);
		   List ProcuctList= Pd.getallProduct();
		   mysession.setAttribute("productlist", ProcuctList);
		   this.doBrowse(request, response,"/product/admin_products_show.jsp");
	   }
	   
	   
}

