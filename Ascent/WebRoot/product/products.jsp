<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" contentType="text/html;charset=gb2312"%>

<html>
<head>
<title>ascent</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<!-- script type="text/javascript">
	function check(){
		if(form.username.value==""){
			alert("用户名不能为空");
			form.username.focus();
			return false;
		}
		if(form.password.value==""){
			alert("用户名不能为空");
			form.password.focus();
			return false;
		}
		return true;
	}
</script-->
</head>

<body>

<div class="head">
  <div id="login_1"></div>
	<div id="login_2"></div>
	
	<div class="img"><img width="277" height="80" src="<%=request.getContextPath()%>/images/web_4.jpg"></div>
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
<div class="head">
  <div class="left_products">
	<div class="img"><img src="<%=request.getContextPath()%>/images/products_02.jpg" width="189" height="32"/></div>
<div class="left_bj">
		<div class="big_k">
		<%
			Productuser p =(Productuser)session.getAttribute("productuser");
			if(p==null){
		%><form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
			user: <br><input type="text" name="username"  size="15"/><br>
			password:<br><input type="password" name="password"  size="15"/><br>
			<input type="submit" name="submit" value="提交" />
			</form>
			点击这里<a href="<%=request.getContextPath()%>/product/register.jsp">注册</a>
			<div class="loading_p"><% String value = (String)request.getAttribute("error");
                       if(value!=null){
   	                 out.println("错误提示信息"+value);
                       }%></div>
			
		<%
			}
			else{
		%>
		
		<div class="loading_p">欢迎您，<%=p.getUsername()%></div>
		<div class="loading_p">邮箱：<%=p.getEmail()%></div>
		<div class="loading_p"><a href="<%=request.getContextPath()%>/login?a=out">注销</a></div>
		<% if(p.getSuperuser().equals("3")){%>
		<div class="loading_p"><a href="<%=request.getContextPath()%>/product/pageProductuserManagerAction.action">用户管理</a></div>
		
		<%}}%>
		</div>
	</div>
</div>

<div class="right_proaducts">我的位置 >> 电子商务管理  </div>
<div class="p_ny">
	<div class="md_wenzi">商品信息 </div>
</div>
<div class="border"></div>
<div class="p_wenzikuang">
	<div class="md_wenzi">
  astaTech， Inc.提供全世界配药，生物科技和agroche mical药物研究&发展的先进和新颖的中间体。
  我们的编目是最新与1500年药物象产品。 超过五十种新的化合物每个月增加到产品名单。我们先进的中间体的宽广的类型，
  包括积木，新颖的胺物、被保护的胺物、不自然的氨基酸、酮、醋醛、heterocycles、isatoic酐、boroinc酸和手性
  的中间体可能加速您的药物研究过程。AstaTech也提供半大块中间体(10公斤)，大块中间体(对吨)，使原材料和他们的
  中间体服麻醉剂进入合理的价格和优良品质。 
  请参观<a href="<%=request.getContextPath()%>/product?a=all">浏览产品页</a>。
  <br> 编目可以在网上被观看或者由<a href="<%=request.getContextPath()%>/product/Product_Search.jsp">查询产品浏览产品</a>
  或您喜欢电子上接受我们的编目的(以PDF或SD格式)，请电子邮件我们.
  </div>

</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>



</body>

</html>
