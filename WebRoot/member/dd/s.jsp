<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
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
<title></title>
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
%>
<%
	String member=(String)session.getAttribute("member");
	if(member==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{ 
%>
<body>
<div class="panel admin-panel">
   
  <div class="body-content">
    <form method="post" class="form-x" action="<%=basePath %>member/dd/sinfo.jsp" name="form1"> 
      <div class="form-group">
        <div class="label">
          <label for="sitename">∂©µ•±‡∫≈£∫</label>
        </div>
        <div class="field"><input type="text" class="input w50" name="word" required/></div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> Ã·Ωª</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body>
<%} %>
</html>