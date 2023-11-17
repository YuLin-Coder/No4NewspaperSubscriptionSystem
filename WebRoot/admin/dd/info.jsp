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
	
	String admin=(String)session.getAttribute("user"); 
	if(admin==null){
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
      <th>报刊名称</th>  
      <th>数量</th>  
      <th>价格</th>   
      <th>总价</th>   
      <th>分类</th> 
    </tr> 
<%
String id = request.getParameter("id"); 
String ddbh=cb.getString("select ddbh from dd where id='"+id+"'");
String zj=cb.getString("select zj from dd where id='"+id+"'");
String dj=cb.getString("select dj from dd where id='"+id+"'");	 
	List pagelist3 = cb.getCom("select * from gwc where ddbh='"+ddbh+"' order by id desc",10); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>       
<tr>
      <td><%=i+1 %></td>    
      <td><%=pagelist2.get(2).toString() %></td>
      <td><%=pagelist2.get(3).toString() %></td>
      <td><%=pagelist2.get(4).toString() %></td>
      <td><%=pagelist2.get(5).toString() %></td>
      <td><%=pagelist2.get(8).toString() %></td> 
    </tr> 
<% }} %>    
    <tr>
        <td colspan="11"><div class="pagelist">总价：<%=zj %> 元 </div></td>
      </tr>
    
</table>
</form>
</div>

 
</body>
<%} %>

