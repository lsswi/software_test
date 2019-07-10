<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form name="" method="post" action="">
<div class="head">
	<div id="login_1"></div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="images/web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="images/web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="images/web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">首 页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT 服务</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">电子商务系统</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">员工招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">关于我们</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>
<div class="head">
<div class="right">
  <div class="left_bj2"></div>
</div>
<div class="right_zc">
		<table width="450"  border="0" align="left" background="" class="">
		<tr>
		<td height="82" colspan="2" class="table_hui">
		  <div align="center" class="STYLE1"><s:property value="tip"/></div></td>
		</tr>
				<tr>
		<td height="20" colspan="2"><div class="table_t" id="result_box" dir="ltr">
		  <div align="center"><a href="javascript:history.back()"><<< 返回</a> </div>
		</div></td>
		</tr>
		<tr>
		<td width="158" height="20"></td>
		<td width="282" class="table_t">&nbsp;</td>
		</tr>
		<tr>
		<td width="158" height="20" class="table_hui_x">&nbsp;</td>
		<td width="282">&nbsp;</td>
		</tr>
		<tr>
		<td width="158" height="20" class="table_hui_x">&nbsp;</td>
		<td width="282">&nbsp;</td>
		</tr>
		
	</table>

</div>

</div>
</form>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</body>
</html>
