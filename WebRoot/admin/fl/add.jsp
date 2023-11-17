<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
    <link rel="stylesheet" href="<%=basePath %>admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath %>admin/css/admin.css">
    <script src="<%=basePath %>admin/js/jquery.js"></script>
    <script src="<%=basePath %>admin/js/pintuer.js"></script>  
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";
		String mc=""; 
		if(method.equals("upfl")){
			id=request.getParameter("id");
			mc=cb.getString("select mc from fl where id='"+id+"'"); 
		}
%>
<body>
<div class="panel admin-panel margin-top"> 
  <div class="body-content">
    <form class="form-x" action="<%=basePath %>ComServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">  
      <div class="form-group">
        <div class="label">
          <label>分类名称：</label>
        </div>
        <div class="field"><input type="text" name="mc" class="input w50" value="<%=mc %>" required/>        
        <div class="tips"></div>
        </div>
      </div>  
     <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<%} %>