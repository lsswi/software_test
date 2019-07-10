<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>注册页面</title>
	<link href="css/index.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
/* 页面字体样式 */
body, td, input {
    font-family:Arial;
    font-size:12px;
}
/* 表格基本样式 */
table.default {
    border-collapse:collapse;
    width:350px;
}
/* 表格单元格样式 */
table.default td {
    border:1px solid black;
    padding:3px;
}
/* 列头样式 */
table.default td.item {
    background:#0e59c0;
    color:#fff;
}
/* 正常信息样式 */
div.ok {
    color:#006600;
}
/* 警告信息样式 */
div.warning {
    color:#FF0000;
}
</style>
<script src="js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="js/json.js" type="text/javascript"></script>
<script  language="javascript"  >
	function refresh(){
		//重新获取验证码图片的src属性
		document.getElementById("authImg").src='authImg?now='+new Date();
	}

	function checkUserName(){
		//请求的地址
		var url="registCheckAction.action";
		var params=Form.Element.serialize('username');
		//创建Ajax.Request对象，对应于发送请求
				var myAjax = new Ajax.Request(
				url,
				{
					//请求方式：POST
					method:'post',
					//请求参数
					parameters:params,
					//指定回调函数
					onComplete: processResponse,
					//是否异步发送请求
					asynchronous:true
				});
	}
	
	
	function processResponse(request)
			{
				var action = request.responseText.parseJSON();
				$("usernameCheckDiv").innerHTML = action.tip;
			}	

	function check(){
	if(form.username.value == "")
    {
       alert("用户名不能为空！"); 
       form.username.focus();
        return false;
    }
   if(form.password.value == "")
    {
        alert("请输入密码 ！");
        form.password.focus();
         return false;
    }
     if(form.password2.value == "")
    {
        alert("请再次输入密码 ！");
       form.password2.focus();
         return false;
    }
    if(form.password.value!=form.password2.value){
    
       alert("两次输入的密码不一致 ！");
        form.password2.focus();
         return false;
    }
    if(form.email.value == "")
    {
        alert("请输入邮件 ！");
        form.email.focus();
         return false;
    }
    
 var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//验证Mail的正则表达式,^[a-zA-Z0-9_-]:开头必须为字母,下划线,数字,
  if (form.email.value!="" && !form.email.value.match(regm) )
   		 {
     		alert("邮件格式不对，检查后重新输入！");
	     	form.email.focus();
             return false;
   		 }  
   if(form.code.value==""){
   		alert("请输入验证码！");
        form.code.focus();
         return false;
   }
  else 
    return true;
}

</script>
</head>
<body> 
 <!-- 
onsubmit="alert('后面的注册过程与传统方式相同。');return false"
-->
<div><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font  size="2"><a href="javascript:history.back()"><<<< 返回</a></font>
<div align="center">
<h1>注册信息</h1>
<br>
<% String error = (String)request.getAttribute("error");
 System.out.println("000000000"+error);
 if(error!=null)
 {
 %>
 <%=error %>
 <%
 }
 %>
</div>
</div>
<div align="center">


<form name="form" method="post"  action="<%=request.getContextPath()%>/user?a=regis" />

<table width="400" class="default">

<tr>

    <td class="item" width="41%"><div align="center">用户名：</div></td>

    <td width="59%">

        <input type="text" name="username" id="username" onblur="checkUserName()">&nbsp;&nbsp;<font color="red">*</font>

        <div id="usernameCheckDiv" class="warning"></div>    </td>
</tr>

<tr>

    <td class="item"><div align="center">密码: </div></td>

    <td><input type="password" name="password" id="password" >&nbsp;&nbsp;<font color="red">*</font>
      </td>
</tr>

<tr>

    <td class="item"><div align="center">密码确认:</div></td>

    <td>

        <input type="password" name="password2" id="password2" >&nbsp;&nbsp;<font color="red">*</font>
   </td>
</tr>

<tr>

    <td class="item"><div align="center">公司名称:</div></td>

    <td>

        <input type="text" name="companyname" id="companyname" /></td>
</tr>
<tr>

    <td class="item"><div align="center">公司地址:</div></td>

    <td>

        <input type="text" name="companyaddress" id="companyaddress" /></td>
</tr>
<tr>

    <td class="item"><div align="center">国家:</div></td>

    <td>

        <input type="text" name="country" id="country" /></td>
</tr>
<tr>

    <td class="item"><div align="center">城市:</div></td>

    <td>

        <input type="text" name="city" id="city" /></td>
</tr>
<tr>

    <td class="item"><div align="center">工作:</div></td>

    <td>

        <input type="text" name="job" id="job" /></td>
</tr>
<tr>

    <td class="item"><div align="center">电话:</div></td>

    <td>

        <input type="text" name="tel" id="tel" /></td>
</tr>
<tr>

    <td class="item"><div align="center">Zip:</div></td>

    <td>

        <input type="text" name="zip" id="zip"/></td>
</tr>
<tr>

    <td class="item"><div align="center">Email:</div></td>

    <td>

        <input type="text" name="email" id="email" >&nbsp;&nbsp;<font color="red">*</font>
</td>
</tr>
<tr>
 <td class="item"><div align="center">验证码:</div></td>

    <td>

        <input type="text" name="code" id="code" >&nbsp;&nbsp;<font color="red">*</font>

        <div id="codeCheckDiv" class="warning"><img src="authImg" id="authImg"/><a href="product/register.jsp#" onClick="refresh()">换一张</a></div></td>
    
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="注册" onClick="return check();" /> <input type="Reset" value="取消"  /></td>
</tr>
</table>

</form>


</div>
   

  </body>
</html>
