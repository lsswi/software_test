<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

</head>

<body>
<form name="form" method="post" action="productuserLoginAction.action">
<div class="head">
  <div id="login_1"></div>
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
<div class="head">
  <table width="780" height="796" border="0" cellpadding="0" cellspacing="0" class="da">
        <tr class="xx"> 
          <td width="22%" height="796" valign="top" bordercolor="#999999" class="xx">&nbsp; 
          </td>
          <td width="78%" valign="top"> <table width="98%" height="796" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="4%" height="30">&nbsp;</td>
                <td width="96%" valign="middle" class="12"><font color="#0066CC">诚聘英才</font></td>
              </tr>
              <tr> 
                <td height="766">&nbsp;</td>
                <td valign="top" class="12"><table width="100%" height="480"  border="0" cellpadding="1" cellspacing="0">
                    <tr> 
                      <td height="56" colspan="3"><div align="center" class="style5"> 
                          <img src="<%=request.getContextPath()%>/images/zxnsgzhh.gif" width="350" height="50"><br>
                        </div></td>
                    </tr>
                    <tr> 
                      <td width="4%" height="20">&nbsp;</td>
                      <td width="92%"><hr size="1" noshade></td>
                      <td width="4%">&nbsp;</td>
                    </tr>
                    <tr valign="top"> 
                      <td height="404" colspan="3"><table width="100%"  border="0" cellspacing="0" cellpadding="1">
                          <tr> 
                            <td height="44">　　<span class="12">亚思晟科技公司汇聚了来自加拿大、美国等国家的众多海外留学人员。现因公司发展需要，诚邀各界优秀人士加盟，共同发展：</span>                            </td>
                          </tr>
                          <tr bgcolor="#E2EBEF"> 
                            <td>&nbsp;<img src="<%=request.getContextPath()%>/images/arrow2.gif" alt="JAVA软件工程师：" width="14" height="14">  <strong><span class="12">JAVA培训讲师</span>：</strong><span class="style1"><strong class="style1"><img src="<%=request.getContextPath()%>/images/hot.gif" width="24" height="14"><img src="<%=request.getContextPath()%>/images/hot.gif" width="24" height="14"></strong></td>
                          </tr>
                          <tr> 
                            <td height="171"><p align="left" class="12">工作职责： 
                                <br>
                                参与 Java 相关培训课程的设计及培训。 </p>
                              <p align="left" class="12">职位要求:<br>
                                1、精通基于J2EE架构的Java核心语法、Java Web及EJB高级编程。<br>
                                2、熟悉Struts，Spring，Hibernate架构。<br>
                                3、熟悉 WebLogic/Oracle/Unix 优先考虑。<br>
                                4、较强的中文表达能力，热爱软件开发及IT培训事业。<br>
                                5、能适应较强的工作压力，独立工作能力强，有高度的敬业精神。<br>
                                6、具有5年以上IT相关工作经验，有良好的职业素质。<br>
                                <br></p></td>
                          </tr>
                          <tr bgcolor="#E2EBEF"> 
                            <td>&nbsp;<img src="<%=request.getContextPath()%>/images/arrow2.gif" alt="JAVA软件工程师：" width="14" height="14"> <strong><span class="12">JAVA软件工程师</span>：</strong><span class="style1"><strong class="style1"><img src="<%=request.getContextPath()%>/images/hot.gif" width="24" height="14"></strong></span></td>
                          </tr>
                          <tr> 
                            <td height="150"><p align="left" class="12">&nbsp;</p>
                              <p align="left" class="12">职位描述:<br>
                                完成Java产品、项目的设计和开发。<br><br>任职要求：<br>
                                1、精通基于J2EE架构的Java核心语法，Java Web及EJB高级编程，熟悉WebLogic/WebSphere/Struts优先考虑。<br>
                                2、较强的中文表达能力，热爱软件开发。<br>
                                3、能适应较强的工作压力，独立工作能力强，有高度的敬业精神。<br>
                                <br>
                              </p></td>
                          </tr>
                          <tr> 
                            <td bgcolor="#E2EBEF"> &nbsp;<img src="<%=request.getContextPath()%>/images/arrow2.gif" width="14" height="14"> 
                              <strong><span class="12">.NET培训讲师</span></strong></td>
                          </tr>
                          <tr valign="top"> 
                            <td height="150"> <p class="12"><br>
                                任职要求：<br>
                                1、精通基于.Net Framework,C#.Net、ASP.Net、ADO.Net的软件开发语言、技术及平台。<br>
                                2、掌握基于SQL Server、Oracle关系数据库的Web应用软件开发技术。<br>
                                3、5年以上软件开发或培训相关工作经验,熟悉.NET项目开发流程和规范。<br>
                            4、熟悉AJAX和Web Services者优先。<br>
							5、较强的中文表达能力，热爱软件开发及IT培训事业。
能适应较强的工作压力，独立工作能力强，有高度的敬业精神。</p></td>
                          </tr>
                          <tr> 
                            <td bgcolor="#E2EBEF">&nbsp;<img src="<%=request.getContextPath()%>/images/arrow2.gif" width="14" height="14"> 
                              <strong><span class="12">.NET软件工程师:</span></strong></td>
                          </tr>
                          <tr> 
                            <td height="130"><p class="12">任职要求:<br>
                                1、 精通基于.Net Framework,C#.Net、ASP.Net、ADO.Net的软件开发语言、技术及平台。<br>
                                2、 掌握基于SQLServer、Oracle关系数据库的Web应用软件开发技术。<br>
                                3、 1年以上软件开发工作经验,熟悉.NET项目开发流程和规范。<br>
                                4、 熟悉AJAX和Web Services者优先。<br>
                              </p></td>
                          </tr>
                          <tr class="12">
                            <td><font color="#FF0000">公司地址：北京市海淀区创业中路36号留学人员创业园306<br>
                              联系电话：（010）82780848/62969799<br>
                              E—mail：javalinda@163.com</font><br></td>
                          </tr>
                        </table>
</div>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div></form></body>

</html>
