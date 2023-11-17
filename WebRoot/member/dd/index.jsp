<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit"> 
    <link rel="stylesheet" href="<%=basePath%>admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/admin.css">
    <script src="<%=basePath%>admin/js/jquery.js"></script>
    <script src="<%=basePath%>admin/js/pintuer.js"></script>   
</head>
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>member/dd/index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>member/dd/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>member/dd/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>member/dd/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>member/dd/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>member/dd/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>member/dd/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>member/dd/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>member/dd/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
}
</script>

<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{  
%>
<body>
<div class="panel admin-panel">
   
<form action="" method="post" name="form3">   
<table class="table table-hover text-center">
    <tr>
      <th width="5%">ID</th>     
      <th>订单编号</th>  
      <th>总金额</th>   
      <th>姓名</th>  
      <th>付款方式</th>   
      <th>地址</th>     
      <th>联系电话</th>     
      <th>用户</th>   
      <th>下单时间</th>   
      <th>取消</th>      
      <th>状态</th>       
      <th width="250">操作</th>
    </tr> 
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from dd where member='"+member+"'");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from dd where member='"+member+"' order by id desc",12);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>       
<tr>
      <td><%=i+1 %></td>   
      <td><%=pagelist2.get(1).toString() %></td> 
      <td><%=pagelist2.get(2).toString() %></td> 
      <td><%=pagelist2.get(4).toString() %></td>
      <td><%=pagelist2.get(5).toString() %></td>
      <td><%=pagelist2.get(6).toString() %></td>
      <td><%=pagelist2.get(7).toString() %></td>
      <td><%=pagelist2.get(8).toString() %></td>  
      <td><%=pagelist2.get(9).toString() %></td>  
      <td><%=pagelist2.get(10).toString() %></td>  
      <td><%=pagelist2.get(11).toString() %></td>   
      <td>
      <div class="button-group">
      <a class="button border-green" href="<%=basePath%>member/dd/info.jsp?id=<%=pagelist2.get(0).toString()%>" target="_blank"><span class="icon-edit"></span> 查看</a> 
      <a type="button" class="button border-main" href="<%=basePath%>ComServlet?method=qxdd&id=<%=pagelist2.get(0).toString()%>" onclick="if (confirm('确定要取消吗？')) return true; else return false;"><span class="icon-edit"></span> 取消</a>
      <a class="button border-red" href="<%=basePath%>ComServlet?method=deldd&id=<%=pagelist2.get(0).toString()%>" onclick="if (confirm('确定要删除吗？')) return true; else return false;"><span class="icon-trash-o"></span> 删除</a>
      </div>
      </td>
    </tr> 
<% }} %>    
    <tr>
        <td colspan="15"><div class="pagelist">
        <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">尾页</a>&nbsp;&nbsp;&nbsp;
	 第&nbsp;<input name="busjump" type="text"/>&nbsp;页&nbsp; <a href="#" onClick="bjump2()">&nbsp;转到</a></div></td>
      </tr>
    
</table>
</form>
</div>

 
</body>
<%} %>

