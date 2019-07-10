<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AscentWeb电子商务</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
   <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <%
       String uidd = request.getParameter("uid");
       String superuser = request.getParameter("superuser");
       System.out.println(uidd+"========"+superuser);
  %>
		<FORM name="form" action="<%=request.getContextPath()%>/user?a=updatesuper" method="post">
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
	</table>
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){
%>		
			<P>
				 &nbsp; 修改权限 &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a></P>
			<P> 
			<%if("1".equals(superuser)){ %>
				<INPUT type="radio" name="superuser" value="1" checked="true">
			<%}else{ %>
			<INPUT type="radio" name="superuser" value="1" >
			<%} %>&nbsp;&nbsp;普通注册用户<br><%--
			<%if("2".equals(superuser)){ %>
				<INPUT type="radio" name="superuser" value="2" checked="true">
			<%}else{ %>
			<INPUT type="radio" name="superuser" value="2" >
			<%} %>&nbsp;&nbsp;高权限注册用户<br>
			--%><%if("3".equals(superuser)){ %>
				<INPUT type="radio" name="superuser" value="3" checked="true">
			<%}else{ %>
			<INPUT type="radio" name="superuser" value="3" >
			<%} %>&nbsp;&nbsp;高级管理员<br>
			<input type="hidden" name="uid" value="<%=uidd%>"/>
			</P>
			<P>
				 &nbsp;
			</P>
			<P>         &nbsp;&nbsp;  &nbsp;<INPUT type="Submit" name="submit" value="修改">   &nbsp;</P>
			<P>
				 &nbsp;
			</P>
			<P>
				 &nbsp;
			</P>
			</div>
<%
 }else	//最上面的if的else
{ 
%>
<br><br><br><br><br><br>
<center><h3>对不起，您没有权限查看！！！</h3></center>

<%} %>    
</div>
		</FORM>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
	</body>
</html>
