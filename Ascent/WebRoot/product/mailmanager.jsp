<%@ page language="java" import="java.util.*,com.ascent.bean.*"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>邮件设置</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
   <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
   
   <script type="text/javascript">
   		function check(){
   			if(form.fromaddressname.value==""){
   				alert("请输入邮件地址");
   				form.fromaddressname.focus();
   				return false;
   			}
   			if(form.frompassword.value==""){
   				alert("请输入邮件密码");
   				form.frompassword.focus();
   				return false;
   			}
   			return true;
   		}
   		
  
 function findEmail(){
   send_request("<%=request.getContextPath()%>/mail?a=all");
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
			   document.getElementById('xianshi').innerHTML="管理员邮箱：";
			   document.getElementById('email').innerHTML=divhtml;
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
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //管理员
%>
<div class="padding">
<div id="middlebody">
	<table width="800">
		<tr>
		<td height="20" colspan="6" background="" class="" border="0"><div class="table_t" id="result_box" dir="ltr">
		  <div align="right">　　 </div>
		</div></td>
	</table>
	<a href="javascript:history.go(-1);">返回>>></a>
  <div id="xianshi"><a href="javascript:findEmail();">已设邮箱</a></div><div id="email"></div>

  <p align="center">管理员邮箱设置</p>
<form name="form" method="post" action="mail?a=save">
  <div align="center">
  <table width="50%" border="1" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC">
  <tr> 
        <td width="26%"><div align="center">邮箱地址 </div>
          <div align="center"></div></td>
    <td width="43%">
            <input name="fromaddressname" type="text" id="fromaddressname">
          </td>
    <td width="31%"><select name="fromaddresstype" id="fromaddresstype">
            <option value="@163.com">@163.com</option>
            <option value="@126.com">@126.com</option>
            <option value="@sohu.com">@sohu.com</option>
            <option value="@sina.com">@sina.com</option>
            <option value="@gmail.com">@gmail.com</option>
          </select></td>
  </tr>
  <tr> 
    <td><div align="center">邮箱密码</div></td>
    <td><input name="frompassword" type="password" id="frompassword"></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center">收件Email</div></td>
    <td><input name="toaddress" type="text" id="toaddress"></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><div align="center">
            <input type="submit" name="Submit" value="提交" onclick="return check();">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="Reset" name="Reset" value="取消">
          </div></td>
  </tr>
</table>

</div>
<div><br>帮助：<br>
<1>请正确的设置发件箱地址及密码，该邮件是负责发送邮件的地址<br>
<2>请正确的设置收件箱地址，该邮件是接收邮件的地址，当客户在<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结算中心提交后，邮件会发送到该邮件<br>
<3>试运行时请重新设置自己的邮箱，库中邮件地址您无法查看测试
</div>
</div>

<%}
else{ 
%>
<div class="padding">
<div id="middlebody">
<center><font size="3">您无权限浏览此页</font></center>
</div>
</div>
<%}%>

<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</form>
</body>
</html>