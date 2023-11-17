<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
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
    <title>µÇÂ¼</title>  
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
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="<%=basePath%>AdminServlet" method="post"><input type=hidden name=method value="one"/>
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>ºóÌ¨¹ÜÀíÖÐÐÄ</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="username" placeholder="µÇÂ¼ÕËºÅ" data-validate="required:ÇëÌîÐ´ÕËºÅ" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="µÇÂ¼ÃÜÂë" data-validate="required:ÇëÌîÐ´ÃÜÂë" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                     
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="µÇÂ¼"></div>
            </div>
            </form>          
        </div>
    </div>
</div> 
</body>
</html>