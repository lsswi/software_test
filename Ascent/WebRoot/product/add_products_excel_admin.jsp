<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<script language="javascript">
	function addproducts(){
	///encType=multipart/form-data
	if(form.upload.value == "")
    {
        alert("请选择excel文件！");
        form.upload.focus();
        return false;
    }
    var filepath=form.upload.value;
    alert(filepath);
    ///form.action="excelAddProductManagerAction.action?filepath="+filepath;
    alert(form.action);
   	return true;
	}

</script>



</head>

<body>
<form name="form" method="post" action="<%=request.getContextPath()%>/excelupload?a=examadd" encType=multipart/form-data >
<div class="head">
	<div id="login_1"></div>
	<div id="login_2"></div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\/web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
	<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\index.jsp">首 页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\itservice.jsp">IT 服务</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">电子商务系统</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/employee.jsp">员工招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">关于我们</a></div>
		</div>
	<div id="bannerbj1"></div>	
</div>
<div class="head">
<div id="middlebody">  

<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){
%>
<div class="table_t">|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/clearSession.action" class="table_t">注销</a>&nbsp;&nbsp;|</div>
<div class="right_proaducts">我的位置&gt;&gt;电子商务管理&gt;&gt;商品批量添加 </div>
	<table width="580">
      <tr>
        <td height="20" colspan="2"></td>
      </tr>
      <tr>
        <td height="5" colspan="2" bgcolor="#666666"></td>
      </tr>
      <tr>
        <td height="7" colspan="2"></td>
      </tr>
      <tr>
        <td width="157" height="20" bgcolor="#B4E4FE" class="table_c">批量添加 &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back()"><<< 返回</a> </td>
        <td width="411"></td>
      </tr>
    </table>
	<table width="500" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#DFEFFD">
  	 <tr>
      <td height="10" colspan="4"></td>
	 </tr>
	 
	  
	 <tr>
  
	  <td width="85" class="table_c"><div align="right">Excel文件:</div></td>
	  <td width="163" height="35">
	  <input type="file" name="upload"/>
      </td>      
  	 </tr>
	 
	   
	 <tr>
      <td height="45" colspan="4"><div align="center">
        
        <div class="loading_ll"><input type="image" src="<%=request.getContextPath()%>\images\Add.jpg" onclick="return addproducts()"  border="0" alt="批量增加"/></div>
      </div></td>
	 </tr>
 </table>
</div>
</form>
<%
}else
{ 
%>
<center><h3>对不起，您没有权限查看！！！</h3></center>
<%} %>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>


</body>
</html>
