<%@ page language="java" import="com.ascent.bean.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户分配产品权限页面</title>
    
   <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/json.js" type="text/javascript"></script> 
<script>
	function add(){
		if(check()){
		//请求的地址
		var url="userProductAddAction.action";
		var params=Form.serialize('form');
		//创建Ajax.Request对象，对应于发送请求
				var myAjax = new Ajax.Request(
				url,
				{
					//请求方式：POST
					method:'post',
					//请求参数
					parameters:params,
					//是否异步发送请求
					asynchronous:true
				});
				alert("添加商品成功");
				window.close();
		}else{
		
		   return false;
		}
	}
	
//提交按钮事件 检验是否有选择   
 function check(){
	var bool_check =false;
	if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                if(form.pid[i].checked){
                	bool_check=true;
                	break;
                }
            }
            if(bool_check){
            	//add();
            	//alert("ajax end1");
            	return true;
            }else{
            	alert("您没有做任何选择，请选择后提交");
            	return false;
            }
        }
        else
        {
            if(form.pid.checked){
            	//add();
            	//alert("ajax end1");
            	return true;
            }else{
            	alert("您没有做任何选择，请选择后提交");
            	return false;
            }
        }
}  
   
   
//全选按钮事件  选择让所有复选框打钩  不选择 让所有不打勾
function selectAll()
{
    if(form.checkall.checked)
    {
        if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                form.pid[i].checked=true;
            }
        }
        else
        {
            form.pid.checked=true;
        }
    }
    else
    {
        if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)  
            {
                form.pid[i].checked=false;
            }
        }
        else
        {
            form.pid.checked=false;
            
        }
    }
}
//选择某个复选框事件  判断是否全选  操作全选按钮是否打钩
function unselectAll(bool){
	var allselect_bool =false;
 	if(!bool){ //取消选择动作，让全选取消
	form.checkall.checked=false;
	}else{ //选择动作，判断是否全选，是=让全选按钮选择 否=不做动作
		if(form.pid.length>1)
        {
            for(var i=0;i<form.pid.length;i++)
            {
                if(form.pid[i].checked){
                	allselect_bool=true;
                }else{
                	allselect_bool =false;
                	break;
                }
            }
            if(allselect_bool){
             	form.checkall.checked=true;
            }
        }
        else
        {
            if(form.pid.checked){
             form.checkall.checked=true;
            }
            
        }
	}
}


</script> 
  </head>
  
  <body leftmargin="0" topmargin="50">
  	 <h3>授权商品</h3>
<%
String uid =(String)request.getParameter("uid");
Productuser p = (Productuser)session.getAttribute("productuser");
 if(p!=null&&p.getSuperuser().equals("3")){
%>
<div id="tipDiv"></div>
<form name="form" action="" method="post">
	<input type="hidden" name="uid" value="<%=uid %>"/>
    <table width="90%" border="1" cellspacing="0" cellpadding="0" class="mars">
  <tr> 
    <td width="21%"><div align="center">选择</div></td>
    <td width="39%"><div align="center">编号</div></td>
    <td width="40%"><div align="center">名称</div></td>
  </tr>
 <s:iterator value="#session['allProductList']" status="index">
  <s:if test="#index.odd==true">
  	<tr bgcolor="#f3f3f3" height="25"> 
 </s:if>
 <s:else>
 	<tr bgcolor="#e4f1fe" height="25"> 
 </s:else>
    <td><div align="center"><input type="checkbox" name="pid" value="<s:property value="pid"/>" onclick="unselectAll(this.checked)"/></div></td>
    <td><div align="center"><s:property value="productId"/></div></td>
    <td><div align="center"><s:property value="productname"/></div></td>
  </tr>
 </s:iterator>
 <tr> 
 <td width="21%"><div align="center"><input type="checkbox" name="checkall" onclick="selectAll()"/></div></td>
    <td colspan="2"><div align="center"><input type="submit" value="提交" onclick="return add();"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Reset" value="取消"/></div></td>
  </tr>
</table>

</form>

<%}
else
{ 
%>

<center><h3>对不起，您没有权限查看！！！</h3></center>
<br><br>
<%} %>  
  </body>
</html>
