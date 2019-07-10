<%@ page language="java" import="java.util.*,com.ascent.bean.Productuser" contentType="text/html;charset=gb2312"%>
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%" height="34">&nbsp;</td>
              <td width="96%" valign="bottom"><font color="#000000" class="td"><strong>IT服务</strong></font></td>
            </tr>
            <tr>
              <td height="267">&nbsp;</td>
              <td valign="top"><table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="16">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="84" valign="top" class="12">　　亚思晟科技（Ascent Technologies）公司，是由海外归国IT专业技术人士在中关村留学生海淀创业园创办成立。凭借着卓越的技术水平、经验丰富的管理团队，强大的资源整合能力和多年服务众多企业所积累的丰富经验，亚思晟科技奠定了公司在本地和海外IT服务市场的优势地位，获得了客户的一致认可和好评，并与客户建立了长期的战略合作伙伴关系。
                        <p>　　亚思晟立足于中国IT的现实和特点，利用国际先进成熟的技术和经验，提供高端优质的IT服务，包括软件高端培训、软件开发及维护、软件外包、软件产品研发和本地化等。<br>
                      </p>
                      </td>
                  </tr>
                </table>
                  <table width="92%" border="0">
                    <tr>
                      <td valign="top" class="12"><table width="600" border="0" cellspacing="8" cellpadding="0">
                          <tr>
                            <td colspan="5">&nbsp;</td>
                          </tr>
                          <tr>
                            <td colspan="5"><span class="style2">亚思晟提供的IT服务覆盖以下领域：</span></td>
                          </tr>
                          <tr>
                            <td><a href="http://www.ascenttech.com.cn/itpxunfw.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic1.jpg" width="150" height="103" border="0"></a></td>
                            <td>&nbsp;</td>
                            <td><a href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic2.jpg" width="150" height="103" border="0"></a></td>
                            <td>&nbsp;</td>
                            <td><a href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm" target="_blank"><img src="<%=request.getContextPath()%>/images/pic3.jpg" width="150" height="103" border="0"></a></td>
                          </tr>
                          <tr>
                            <td><div align="left" class="style3"><span class="shang"><font class="i"><font class="biaoti"><a href="http://www.ascenttech.com.cn/itpxunfw.htm" target="_blank" class="i">IT培训服务</a></font></font></span></div></td>
                            <td><div align="left"><span class="style4"></span></div></td>
                            <td><div align="left" class="style4"><strong><font class="i"><font class="biaoti"><a href="http://www.ascenttech.com.cn/ruanjianwaibaofuwu.htm" target="_blank" class="i">软件外包服务</a></font></font></strong></div></td>
                            <td><div align="left"><span class="style4"></span></div></td>
                            <td><div align="left" class="style4"><strong><a href="http://www.ascenttech.com.cn/ruanjianjishufuwu.htm" target="_blank" class="i">软件技术服务</a></strong></div></td>
                          </tr>
                      </table>
</div>
<br><br>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div></form></body>

</html>
