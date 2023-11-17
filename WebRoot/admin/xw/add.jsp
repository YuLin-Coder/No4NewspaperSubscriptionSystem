<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
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

	<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
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
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method=request.getParameter("method");  
		String id="";String bt="";String fl=""; String nr="";
		if(method.equals("upxw")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from xw where id='"+id+"'",4);
			bt=jlist.get(1).toString();
			fl=jlist.get(2).toString();
			nr=jlist.get(3).toString();  
			htmlData=nr; 
		}	  
%>
<body>
<div class="panel admin-panel margin-top"> 
<div class="body-content">
<form class="form-x" action="<%=basePath %>ComServlet" method="post" name="form1">
<input type="hidden" name="method" value="<%=method%>" /><input type="hidden" name="id" value="<%=id%>" />
     <div class="form-group">
      <div class="label"><label>信息标题：</label></div>
        <div class="field"><input type="text" name="bt" class="input w80" value="<%=bt %>" required/></div>
      </div>
     <div class="form-group">
      <div class="label"><label>信息来源：</label></div>
      <div class="field"><input type="text" name="fl" class="input w80" value="<%=fl %>" required/></div>
     </div>
     <div class="form-group">
      <div class="label"><label>信息内容：</label></div>
      <div class="field"><textarea name="content1" class="input w80" rows="8" style="width:700px;height:400px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></div> 
     </div> 
     <div class="form-group">
        <div class="label"><label></label></div>
        <div class="field"><button class="button bg-main icon-check-square-o" type="submit"> 提交</button></div>
     </div>
</form>
   </div>  
 </div>  
</body>
<%} %>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>