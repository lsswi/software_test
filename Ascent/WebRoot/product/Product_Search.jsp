<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=path%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	function check(){
		if(form.searchValue.value == "")
	    {
	        alert("请输入查询条件！");
	        form.searchValue.focus();
	        return false;
	    }
	return true;
	}

</script>





</head>

<body>
<form name="form" method="post" action="<%=request.getContextPath()%>/product?a=search">
<div class="head">
	<div id="login_1">
	<div id="login_1_n">
	
	<div class="lodaing_i"></div>
</div>
   </div>
   	
	<div id="login_2"></div>
	<div id="login_3"></div>
<div class="img"><img src="<%=path%>/images/web_4.jpg" width="277" height="80"/></div>
	
	<div class="img"><img src="<%=path%>/images/web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=path%>/images/web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">首 页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT 服务</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">电子商务系统</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">员工招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">关于我们</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>
<div class="head">
<div class="left_products1">
	<div class="img"><img src="<%=path%>/images/search-products_3_02.jpg" width="214" height="28"/></div>
	<div class="left_bj1"></div>
</div>



<div class="right_proaducts">我的位置 >> 电子商务管理 &gt;&gt;商品查询 </div>
<div class="right_proaducts"><a href="javascript:history.back()"><<< 返回</a> </div>
<div class="biankuang_s">
	<div class="f_s">
		<div class="biao_q">商品查询</div>
	</div>
	<div class="f_s1"></div>
  <div class="f_s3">
  	<table width="400">
		<tr>
		<td width="184" height="20" class="table_hui"><div align="right"></td>
		<td width="204"></td>
		</tr>
		<tr>
		<td class="table_hui"> <div align="right">请选择:</div></td>
		<td class="table_hui">
		  <select name="searchName">
		    <option  value="catalogno" selected="selected">CatalogNo</option>
		    <option value="cas">CAS</option>
		    <option value="productname">名称</option>
		    <option value="mdlnumber">MDLNumber</option> 
			<option value="formula">Formula</option> 
		  </select></td>
		 <td><input type=text name="searchValue"/></td>
		</tr>
		
		<tr>
		<td height="30" class="table_hui">
		    　		 </td>
		<td height="30" class="table_hui"><input type="submit" name="Submit" value="查询"  onclick="return check();"/></td>
		<td height="30" class="table_hui"><input type="reset"  name="Reset" value="取消" /></td>

		</tr>
	</table>
  </div>
	<div class="f_s2"></div>
</div>
</form>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>

</body>
</html>

