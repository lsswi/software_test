<%@ page language="java" import="java.util.*,com.ascent.bean.*,com.ascent.util.*" contentType="text/html;charset=gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
</script>
</head>

<body>

<div class="head">
	<div id="login_1">
	
   </div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>/images/web_6.jpg" width="250" height="80"/></div>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<%
	String orderid = (String)session.getAttribute("orderid");
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //管理员
%>
<td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a></div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg" width="75" height="17" border="0"/></a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\Product_Search.jsp">商品查询</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\order?a=all">订单管理</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\shopcart?a=find">查看购物车</a></div></td>
<%--<%}
	else if(p!=null&&p.getSuperuser().equals("2")){  //高权限用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a></div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product\userProductsProductManagerAction.action">查看已分配产品</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\Product_Search.jsp">商品查询</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\showOrdersManagerAction.action">查看订单</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\cartShowCartManagerAction.action">查看购物车</a></div></td>
--%><%}
	else if(p!=null&&p.getSuperuser().equals("1")){  //刚注册用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a></div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\Product_Search.jsp">商品查询</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\order?a=all">查看订单</a></div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\shopcart?a=find">查看购物车</a></div></td>
<%}
	else if(p==null){  //未注册用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a></div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\Product_Search.jsp">商品查询</a></div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product?a=all">查看购物车</a></div></td>
<%}%>
</tr>
</table>
<br><br>	

<!-- 产品列表 --> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr bgcolor="#fba661" height="30"> 
    <td><div align="center">编号</div></td>
    <td><div align="center">名称</div></td>
    <td><div align="center">价格</div></td>
    <td><div align="center">库存</div></td>
    <td><div align="center">图片</div></td>
 <%
 if(p!=null&&p.getSuperuser().equals("3")){//管理员
  %>
    <td><div align="center">删除</div></td>
 <%} %>
  </tr>
  <% 
  List list= (List)session.getAttribute("orderitemlist");
  System.out.println("购买了几个产品："+list.size());
    Iterator its= list.iterator();
    while(its.hasNext())
    {
       Product pu = new Product();
       pu= (Product)its.next();
       int pid= pu.getPid();
 %>
    <tr bgcolor="#f3f3f3" height="25"> 
    <td width="10%"><div align="center"><%=pu.getProductId()%></div></td>
    <td width="13%"><div align="center"><%=pu.getProductname()%></div></td>
       <td width="10%"><div align="center"><%=pu.getPrice1()%></div></td>
    <td width="13%"><div align="center"><%=pu.getStock()%></div></td>
    <td width="12%"><div align="center"><img src="<%=request.getContextPath()+"/upload/23007.gif"%>" width="60" height="30" hspace="0" border="0"/></div></td>
    
    
 <%
 if(p!=null&&p.getSuperuser().equals("3")){  //管理员
  %>   
    <td><div align="center"><a href="<%=request.getContextPath()%>/order?a=delitem&pid=<%=pid%>&oid=<%=orderid%>" >删除</a></div></td>
  <%}%>   
  </tr>
 <%} %>
</table>   

</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</body>
</html>
