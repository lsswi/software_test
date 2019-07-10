<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb电子商务</title>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/json.js" type="text/javascript"></script>
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<script language="javascript">
	function checkId(){
	//请求的地址
		var url="productIdCheckAction.action";
		var params=Form.Element.serialize('productId');
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
				$("productIdCheckDiv").innerHTML = action.tip;
			}	
	


	function addproducts(){
	if(form.productId.value == "")
    {
        alert("编号不能为空 ！");
        form.productId.focus();
        return false;
    }
    if(form.productname.value == "")
    {
        alert("产品名称不能为空 ！");
        form.productname.focus();
        return false;
    }
    if(form.catalogno.value == "")
    {
        alert("catalogno 不能为空 ！");
        form.catalogno.focus();
        return;
    }
    if(form.cas.value == "")
    {
        alert("CAS 不能为空 ！");
        form.cas.focus();
        return false;
    }
    if(form.mdlnumber.value == "")
    {
        alert("MDLNumber 不能为空 ！");
        form.mdlnumber.focus();
        return false;
    }
    if(form.newproduct.value == "")
    {
        alert("新产品必须选择 ！");
        form.newproduct.focus();
        return false;
    }
   
  
    if(form.formula.value == "")
    {
        alert("formula 必须输入 ！");
        form.formula.focus();
        return false;
    }
    if(form.mw.value == "")
    {
        alert("MW 必须输入 ！");
        form.mw.focus();
        return false;
    }
    if(form.category.value == "")
    {
        alert("category 必须输入！");
        form.category.focus();
        return false;
    }
  //  if(form.note.value == "")
 //   {
  //      alert("please input note ！");
  //      form.note.focus();
  //      return false;
  //  }
    if(form.price1.value == "")
    {
        alert("请输入价格1 ！");
        form.price1.focus();
        return false;
    }
    if(form.stock.value == "")
    {
        alert("请输入 stock ！");
        form.stock.focus();
        return false;
    }
    if(form.price2.value == "")
    {
        alert("请输入 价格2 ！");
        form.price2.focus();
        return false;
    }
    if(form.realstock.value == "")
    {
        alert("请输入 realstock ！");
        form.realstock.focus();
        return false;
    }
    if(form.upload.value == "")
  {
       alert("请选择图片 ！");
      form.upload.focus();
      return false;
  }
   form.submit();
	}

</script>
</head>

<body>

<form name="form" method="post" action="<%=request.getContextPath()%>/product?a=save" encType="multipart/form-data"/>
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
  <div class="left_products">
	<div class="left_bj_1"></div>
</div>
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){
%>
<div class="table_t">|&nbsp;&nbsp;欢迎,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">注销</a>&nbsp;&nbsp;|</div>
<div class="right_proaducts">我的位置&gt;&gt;电子商务管理&gt;&gt;商品添加</div>
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
        <td width="157" height="20" bgcolor="#B4E4FE" class="table_c">商品信息 &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back(-1)"><<< 返回</a></td>
        <td width="411"></td>
      </tr>
    </table>
	<table width="500" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#DFEFFD">
  	 <tr>
      <td height="10" colspan="4"><s:property value="tip"/></td>
	 </tr>
	   <tr>
      <td width="122" height="30" class="table_c"><div align="right">编号:</div></td>
	  <td width="122"><input name="productId" type="text"  onblur="checkId()"/>
	  <div id="productIdCheckDiv" class="warning"></div> </td>
	  <td width="85" class="table_c"><div align="right">产品名称:</div></td>
	  <td width="163" height="30"><input name="productname" type="text" /></td>
  	 </tr>
	 <tr>
      <td width="122" height="30" class="table_c"><div align="right">CatalogNo:</div></td>
	  <td width="122"><input name="catalogno" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">CAS:</div></td>
	  <td width="163" height="35"><input name="cas" type="text" /></td>
  	 </tr>
	
	 <tr>
      <td width="122" height="30" class="table_c"><div align="right">MDL Number:</div></td>
	  <td width="122">
       <input name="mdlnumber" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">新产品:</div></td>
	 <!--  <td width="163" height="35"><input name="newproduct" type="text" /></td> -->
	 <td height="30" class="table_c">
	 是:  <input type="radio" name="newproduct" value="1" />
	 否:   <input type="radio" name="newproduct" value="0" checked/>
	 </td>
  	 </tr>
  	  <tr>
      <td width="122" height="22" class="table_c"><div align="right">Formula:</div></td>
	  <td width="122">
       <input name="formula" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">MW:</div></td>
	  <td width="163" height="35"><input name="mw" type="text" /></td>
  	 </tr>
  	 
	 <tr>
    <td width="122" height="22" class="table_c"><div align="right">Category:</div></td>
	  <td width="122">
      <input name="category" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">备注:</div></td>
	  <td width="163" height="30"><input name="note" type="text" /></td>
  	 </tr> 
  	 <tr>
      <td width="122" height="22" class="table_c"><div align="right">价格1:</div></td>
	  <td width="122">
      <input name="price1" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">Stock:</div></td>
	  <td width="163" height="35"><input name="stock" type="text" /></td>
  	 </tr>
	 
	
	  <tr>
      <td width="122" height="30" class="table_c"><div align="right">价格2:</div></td>
	  <td width="122"><input name="price2" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">Real Stock:</div></td>
	  <td width="163" height="30"><input name="realstock" type="text" /></td>
  	 </tr>
  	 <tr>
      <!-- td width="122" height="22" class="table_c"><div align="right">Quantity:</div></td>
	  <td width="122">
       <input name="quantity" type="text" /></td-->
       
	  <td width="85" class="table_c"><div align="right">图片:</div></td>
	  <td width="163" height="35">
	  <input type="file" name="upload" />
      </td>      
  	 </tr>
  	  <tr>
      
	  <td width="85" class="table_c"><div align="right">&nbsp;</div></td>
	  <td width="163" height="35">
	  &nbsp; &nbsp; &nbsp; 
	   
      </td>      
  	 </tr>
  	 
	 <tr>
      <td height="45" colspan="4"><div align="center">
        
        <div class="loading_ll"><input type="button" value="提交" onclick="addproducts()"/>
        <!--  input type="submit"  src="<%=request.getContextPath()%>\images\Add.jpg" onclick="return addproducts();"  border="0"/--></div>
      </div></td>
	 </tr>
 </table>
</div>

</form>
<%}else
{ 
%>
<center><h3>对不起，您没有权限查看！！！</h3></center>
<%} %>
<div>
	<img src="<%=request.getContextPath()%>\images/banquan.jpg" width="800" height="35" border="0"/>
</div>
</body>
</html>
