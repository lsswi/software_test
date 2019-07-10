<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP upload</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
   
   <form action="<%=path%>/fileupload" method="post" enctype="multipart/form-data" name="form1">
   
   	<table width="500" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#DFEFFD">
  	 
	   <tr>
      <td width="122" height="30" class="table_c"><div align="right">±àºÅ:</div></td>
	  <td width="122"><input name="productId" id="productId" type="text"  onblur="checkId()"/>
	  <div id="productIdCheckDiv" class="warning"></div> </td>
	  <td width="85" class="table_c"><div align="right">²úÆ·Ãû³Æ:</div></td>
	  <td width="163" height="30"><input id="productname" name="productname" type="text" /></td>
  	 </tr>
  	 <tr>
  <td> <input type="file" name="file"></td>
  <td> <input type="submit" name="Submit" value="upload"></td>
   	 </tr>
   	 </table>
</form>
  </body>
</html>
