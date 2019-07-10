<%@ page language="java" import="java.util.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-

transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>

<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	function denglu(){
	if(form.username.value == "")
    {
        alert("用户名不能为空");
        form.username.focus();
        return false;
    }
    if(form.password.value == "")
    {
        alert("密码不能为空");
        form.password.focus();
        return false;
    }
       //form.action="login";
		//form.submit();
		return true;
	}

</script>

<script language="javascript">
 function addshop(str){
   var pid = str;
   send_request('<%=request.getContextPath()%>/product/addCartManagerAction.action?pid='+pid);
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
<%
 
           
%>
<form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
<div class="head">
	
<div id="login_1">
	<div id="login_1_n">
	    <div id="login_1_wz"></div>
        <div class="lodaing_w"></div>
        <div class="lodaing_ww"></div>
        <div class="lodaing_i"></div>


</div>
   </div>
	<div id="login_2">
      <div id="Layer1" style="position: absolute; width: 212px; height: 35px; z-index: 1; left: 716px; top: 

267px;"> 

      </div>
      
    </div>
	<div id="login_3"></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_4.jpg" width="277" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_5.jpg" width="273" height="80"/></div>
	<div class="img"><img src="<%=request.getContextPath()%>\images\web_6.jpg" width="250" height="80"/></div>
	<div id="bannerbj"></div>
		<div id="bannerbj2">
			<div class="banner_wenzi">|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\index.jsp">首 页</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\product\itservice.jsp">IT 服务</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product/products.jsp">电子商

务系统</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>

\product/employee.jsp">员工招聘</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>\product\ContactUs.jsp">关于

我们</a></div>
		</div>
		<div id="bannerbj1"></div>	
	</div>
<div class="head">
<div id="left">
	
		<div >
		<img src="<%=request.getContextPath()%>\images/lxrycyy.gif" />
		</div>
</div>
<div id="middle">
	<div class="img"></div>
	<div id="md_wenzik">
  <div class="md_wenzi">
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亚思晟商务科技有限公司（简称 &quot;亚思晟科技&quot;），是由海外归国

IT专业技术人士在中关村海淀留学生创业园创办成立。
公司总部位于北京，在加拿大，美国，日本及国内的石家庄，长春，秦皇岛，吉林，廊坊等地设有分部。凭借着卓越的技术水平、

经验丰富的管理团队，
强大的资源整合能力和“诚信、开放、创新、卓越”的经营理念，亚思晟科技奠定了公司在IT服务市场的优势地位，获得了客户的

一致认可和好评，并与客户建立了战略合作伙伴关系。
  </div>
  </div>
</div>


<div id="footer">
        <table border="0" cellspacing="0" cellpadding="0" style="top: 316px; left: 708px; width: 168px; height: 

64px;">
          <tr>
            <td width="122" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>\images\username.jpg" 

align="bottom" style="top: 328px; left: 684px; width: 77px; height: 21px;"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath

()%>\images\password.jpg" style="left: 684px; width: 75px; top: 347px; height: 20px;"/>
            </td>
            <td width="120"><input type="text" name="username" size="8" /> <input type="password" name="password" 

size="8" /></td>       
         
          </tr>           
           <td width="37" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input valign="middle" type="image" src="<%=request.getContextPath()%>\images\login_1_7.jpg" 

onclick="return denglu();" width="44" height="17" border="0" alt="登录"/></td>
<td><select name="sel" onchange="changeStyle(this)">
            <option value="andreas08(BLUE).css" selected="selected">默认风格</option>
			<option value="andreas08(orange).css">桔色</option>
			<option value="andreas08(green).css">绿色</option>
          </select></td>
        </table>
        <div style="float:left;">
<h2>&nbsp;&nbsp;&nbsp;&nbsp;最新商品列表</h2>
  <ul class="ul_a"><li><a href="#">西药</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  <li><a href="#">生化药</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  <li><a href="#">中成药</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0" /></a></li>
  </ul>


  </div>
</form>
	
</body>
</html>



