<%@ page language="java" import="java.util.*,com.ascent.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script>
function selectAll()
{
    if(form.check1.checked)
    {
        if(form.infoid.length>1)
        {
            for(var i=0;i<form.infoid.length;i++)
            {
                form.infoid[i].checked=true;
            }
        }
        else
        {
            form.infoid.checked=true;
        }
    }
    else
    {
        if(form.infoid.length>1)
        {
            for(var i=0;i<form.infoid.length;i++)  
            {
                form.infoid[i].checked=false;
            }
        }
        else
        {
            form.infoid.checked=false;
            
        }
    }
}
</script> 


<script language="javascript">
	function deleteproduct(){
	var from = form.infoid;
	var ch="";  
	var checkNum =0; 
  for(var i=0;i<form.infoid.length;i++)   
  {  
 if(form.infoid[i].type == "checkbox")
   {
    if (form.infoid[i].checked)
    {
     checkNum++;
     break;
    }
  }
 }   
if(checkNum < 1)
   {
		alert("Please select！");
        return;
    }
    else
    {
		if(window.confirm("Are you sure?") == false)
        {
			return;
        }
        else
        {
			form.action="<%=request.getContextPath()%>/admindeleteproduct.do";
            form.submit();
        }
    }
	
	}
	
	
	function addnewproduct(){
	
	var from = form.infoid;
	var ch="";  
	var checkNum =0; 
  for(var i=0;i<form.infoid.length;i++)   
  {  
 if(form.infoid[i].type == "checkbox")
   {
    if (form.infoid[i].checked)
    {
     checkNum++;
     break;
    }
  }
 }   
	if(checkNum < 1)
   {
		alert("Please select！");
        return;
    }else{
	
	form.action="<%=request.getContextPath()%>/addnewproduct.do";
	form.submit();
	
}
    }
    function confirm_oper(){
		if (!confirm("确定该操作吗？")) return false;
	}
</script>


</head>

<body>
<form name="form" method="post" action="">
<div class="head">
	<div id="login_1">
	
   </div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">首 页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT 服务</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">电子商务系统</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">员工招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">关于我们</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>

<div class="padding">
<div id="middlebody">
	<table width="800">
		<tr>
		<td height="20" colspan="6" background="" class="" border="0"><div class="table_t" id="result_box" dir="ltr">
		  <div align="right">　　 </div>
		</div></td>

<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){
%>
<td height="20"><div class="table_t">|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|</div></td>
 <td><div> <a href="<%=request.getContextPath()%>/user?a=all"><img src="<%=request.getContextPath()%>\images\userlist.jpg"  border="0"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg"  border="0"/></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="<%=request.getContextPath()%>/order?a=all"><img src="<%=request.getContextPath()%>\images\ShowOrders.jpg"  border="0"/></a>  &nbsp;&nbsp;&nbsp;&nbsp;  <a href="<%=request.getContextPath()%>\product\add_products_admin.jsp"> <img src="<%=request.getContextPath()%>\images\addProduct.jpg"  border="0"/> </a>&nbsp;&nbsp;&nbsp;&nbsp; </div></td>
</tr>
	
		


<!-- 产品列表 --> 

<!-- 产品列表 --> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr bgcolor="#fba661" height="30"> 
    <td><div align="center">编号</div></td>
    <td><div align="center">名称</div></td>
    <td><div align="center">catalogno</div></td>
    <td><div align="center">MDLNumber</div></td>
    <td><div align="center">价格</div></td>
    <td><div align="center">库存</div></td>
    <td><div align="center">图片</div></td>
    <td><div align="center">修改</div></td>
    <td><div align="center">删除</div></td>
  </tr>
  <%
/// PageBean pBean = (PageBean)session.getAttribute("product_page_list");
     
    List list= (ArrayList)session.getAttribute("productlist");
    Iterator its= list.iterator();
    while(its.hasNext())
    {
       Product pu = new Product();
       pu= (Product)its.next();
       int id= pu.getPid();
    %>
    <tr bgcolor="#f3f3f3" height="25"> 
    <td width="10%"><div align="center"><%=pu.getProductId()%></div></td>
    <td width="13%"><div align="center"><%=pu.getProductname()%></div></td>
    <td width="12%"><div align="center"><%=pu.getCatalogno()%></div></td>
    <td width="13%"><div align="center"><%=pu.getMdlnumber()%></div></td>
    <td width="10%"><div align="center"><%=pu.getPrice1()%></div></td>
    <td width="13%"><div align="center"><%=pu.getStock()%></div></td>
    <%if(pu.getStructure()==null||pu.getStructure().equals(""))
    {
    %>
     <td width="12%"><div align="center"><img src="<%=request.getContextPath()+"/upload/23007.gif"%>" width="60" height="30" hspace="0" border="0"/></div></td>
    <%
    }else
    {
     %>
     <td width="12%"><div align="center"><img src="<%=request.getContextPath()+"/upload/"+pu.getStructure()%>" width="60" height="30" hspace="0" border="0"/></div></td>
    <%
    }%>
    <td><div align="center"><a href="<%=request.getContextPath()%>/product?a=updateProduct&pid=<%=id%>"><img src="<%=request.getContextPath()%>\images\update1.gif" width="20" height="20" border="0" alt="修改"/></a></div></td>
    <td><div align="center"><a href="<%=request.getContextPath()%>/product?a=del&pid=<%=id%>" onclick="return confirm_oper();"><img src="<%=request.getContextPath()%>\images\sz_tu02.gif" border="0" alt="删除"/></a></div></td>
  </tr>
 <%}%>
 <%--   
 <%
 if(pBean.totalPage!=1){  
 %>   
       <form name="pageForm" action="pageShowProductManagerAction.action" method="post">         
      <%@ include file="page.jsp" %>   
      </form>         
      --%><%///} 
 }else	//最上面的if的else
{ 
%>
<br><br><br><br><br><br>
<center><h3>对不起，您没有权限查看！！！</h3></center>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<%} %>     
</table>

<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</form>
</body>
</html>
