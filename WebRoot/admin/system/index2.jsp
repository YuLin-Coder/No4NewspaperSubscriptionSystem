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
		String method="upm2";
		String id="";
		String realname="";String sex="";String age="";String address="";String tel="";
		 
			List alist=cb.get1Com("select * from admin where username='"+username+"'",9); 
			realname=alist.get(3).toString();
			sex=alist.get(4).toString();
			age=alist.get(5).toString();
			address=alist.get(6).toString();
			tel=alist.get(7).toString();
		 
%>
<body>
<div class="panel admin-panel margin-top"> 
  <div class="body-content">
    <form class="form-x" action="<%=basePath %>AdminServlet?method=<%=method%>" method="post" name="form1">  
       <div class="form-group">
        <div class="label"><label>用户姓名：</label></div>
        <div class="field"><input type="text" class="input w50" name="realname" value="<%=realname %>" required/>  
        </div>
      </div>       
      <div class="form-group">
        <div class="label"><label>用户性别：</label></div>
        <div class="field">
          <div class="button-group radio"> 
          <label class="button active"><input name="sex" value="男" type="radio" checked="checked">男</label>    
          <label class="button active"><input name="sex" value="女"  type="radio">女</label>         
           </div>         
        </div>
      </div>
      <div class="form-group">
        <div class="label"><label>用户年龄：</label></div>
        <div class="field"><input type="number" class="input w50" name="age" value="<%=age %>" required/>  
        </div>
      </div>
      <div class="form-group">
        <div class="label"><label>联系电话：</label></div>
        <div class="field"><input type="text" class="input w50" name="tel" value="<%=tel %>" pattern="[0-9]{11}" title="11位手机号码" required />  
        </div>
     </div> 
      <div class="form-group">
        <div class="label"><label>联系地址：</label></div>
        <div class="field"><textarea class="input w50" name="address" style="height:100px;" required><%=address %></textarea> 
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