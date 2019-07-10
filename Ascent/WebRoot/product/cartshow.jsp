<%@ page language="java" import="java.util.*,com.ascent.bean.*,com.ascent.util.*" contentType="text/html;charset=gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
 function updateQuantity(obj,str){
   var pid = str;
   var quantity =obj.value;
   //alert(pid);
   //alert(quantity);
   //return false;
   send_request("<%=request.getContextPath()%>/shopcart?a=updateNum&pid="+pid+"&quantity="+quantity);
  } 
  
  var http_request = false;
	function send_request(url)
	{ //初始化、指定处理函数、发送请求的函数
	   //alert("url\t"+url);
		http_request = false;
		//开始初始化XMLHttpRequest对象
		if(window.XMLHttpRequest) 
		{ //Mozilla 浏览器
			http_request = new XMLHttpRequest();
			if(http_request.overrideMimeType) 
			{//设置MiME类别
				http_request.overrideMimeType('text/xml');
			}
		}
		else if(window.ActiveXObject) 
		{ // IE浏览器
			try 
			{
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch(e) 
			{
				try 
				{
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}
		}
		if(!http_request) 
		{ // 异常，创建对象实例失败
			window.alert("不能创建XMLHttpRequest对象实例.");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// 确定发送请求的方式和URL以及是否同步执行下段代码
		http_request.open("POST", url, true);
		http_request.send(null);
	}
	// 处理返回信息的函数
    function processRequest() 
    {
        if (http_request.readyState == 4) 
        { // 判断对象状态
            if (http_request.status == 200) 
            { // 信息已经成功返回，开始处理信息
               var divhtml = http_request.responseText;
			   alert(divhtml);
            }
        }
       
   } 
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
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //管理员
	
%>
<td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg" width="75" height="17" border="0"/></a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">订单管理</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">继续购物</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">结算中心</a></div></td>
<%--<%}
	else if(p!=null&&p.getSuperuser().equals("2")){  //高权限用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/clearSession.action" class="table_t">注销</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>\product\userProductsProductManagerAction.action">查看已分配产品</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\product\showOrdersManagerAction.action">查看订单</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">继续购物</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">结算中心</a></div></td>
--%>

<%}
	else if(p==null){  //未注册用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,游客&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">注册</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">继续购物</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">结算中心</a></div></td>

<%}
	else{  //刚注册用户
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;欢迎,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|</div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>\order?a=all">查看订单</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">继续购物</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=checkout">结算中心</a></div></td>
<%}%>
</tr>
</table>
<br><br>	

<!-- 产品列表 --> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr bgcolor="#fba661" height="30"> 
    <td><div align="center">编号</div></td>
    <td><div align="center">名称</div></td>
    <td><div align="center">catalogno</div></td>
    <td><div align="center">库存</div></td>
    <td><div align="center">质量</div></td>
    <td><div align="center">删除</div></td>
  </tr>
 
  <%
 
    Collection list= (Collection)session.getAttribute("shopcartlist");
    Iterator its= list.iterator();
    while(its.hasNext())
    {
      Product pu = new Product();
       pu= (Product)its.next();
       int id= pu.getPid();
       String num = pu.getQuantity();
       %>
    <tr bgcolor="#f3f3f3" height="25"> 
    <td width="10%"><div align="center"><%=pu.getProductId()%></div></td>
    <td width="13%"><div align="center"><%=pu.getProductname()%></div></td>
    <td width="12%"><div align="center"><%=pu.getCatalogno()%></div></td>
    <td width="13%"><div align="center"><%= pu.getRealstock()%></div></td>
   <%if (num==null||num.equals("")){
    %>
     <td width="13%"><div align="center"><input name="number" value="5g" onchange="updateQuantity(this,<%=id%>)" /></div></td>
    <%
     }else{%>
      <td width="13%"><div align="center"><input name="number" value="<%=num%>" onchange="updateQuantity(this,<%=id%>)" /></div></td>
     <%} %>
    <td width="13%"><div align="center"><a href="<%=request.getContextPath()%>/shopcart?a=move&pid=<%=id%>">删除</a></div></td>
 </tr>
 <%}%>
  
 
</table>   
<CENTER><H3><!--  input type="text" name="tip" value="tip"/--></H3></CENTER>
</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div>
</body>
</html>
