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
  <table width="100%" height="55" border="0">
                          <tr> 
                            <td height="42" valign="bottom"> <div align="center" class="12"> 
                                <p class="14"><font color="#FF0000"><strong>联系我们</strong></font></p>
                              </div></td>
                          </tr>
                        </table>
                        <table width="100%" border="0">
                          <tr> 
                            <td width="3%">&nbsp;</td>
                            <td width="93%"><hr size="1" noshade></td>
                            <td width="4%">&nbsp;</td>
                          </tr>
                        </table>
                        <div align="center"> 
                          <table width="100%" height="369" border="0">
                            <tr> 
                              <td height="220" class="12"> 
                                <table width="100%" height="272" border="0">
                                  <tr> 
                                    <td height="268" class="12"> <table width="400" height="233"  border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr> 
                                          <td width="15" height="18" align="left" valign="top" bgcolor="#a5a5a5"> 
                                            <div align="left"></div></td>
                                          <td width="385" align="left" valign="bottom" bgcolor="#a5a5a5" class="12"><strong>联系我们</strong></td>
                                        </tr>
                                        <tr> 
                                          <td height="4" colspan="2" align="left" valign="bottom" bgcolor="#eeeeee"></td>
                                        </tr>
                                        <tr> 
                                          <td height="4" align="left" valign="bottom" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="4" align="left" valign="bottom" bgcolor="#eeeeee" class="12"><strong>亚思晟科技</strong></td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12"><strong>BEIJING 
                                            ASCENT TECHNOLOGIES INC.</strong></td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">地址:北京市海淀区上地东路29号留学人员创业园303-306室</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">Add:Room 
                                            303-306,29Shangdi East Road,Overseas 
                                            Student Pioneer </td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">Park,Beijing,P.R.China</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">邮编Post 
                                            Code:100085</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">传真Fax:010-62969799</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">电话Tel:010-82780848/82780167</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">E-mail:ascent@ascenttech.com.cn</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                          <td height="15" align="left" valign="top" bgcolor="#eeeeee" class="12">Java技术讨论群： 
                                            3307453</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" colspan="2" valign="top" bgcolor="#eeeeee">&nbsp;</td>
                                        </tr>
                                        <tr> 
                                          <td height="15" colspan="2" valign="top" bgcolor="#a5a5a5"></td>
                                        </tr>
                                      </table>
                                      <br><br><br><br>
</div>

<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</div></form></body>

</html>
