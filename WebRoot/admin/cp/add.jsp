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
		String id="";String mc="";String fl="";String zz="";String cbs="";String jg="";String pic=""; String nr="";String fs="";String sl="";String tj="";
		if(method.equals("upcp")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from cp where id='"+id+"'",11);
			mc=jlist.get(1).toString();
			fl=jlist.get(2).toString();
			zz=jlist.get(3).toString(); 
			cbs=jlist.get(4).toString(); 
			jg=jlist.get(5).toString(); 
			nr=jlist.get(7).toString();  
			htmlData=nr; 
			fs=jlist.get(8).toString();  
			sl=jlist.get(9).toString();  
			tj=jlist.get(10).toString();  
		}	  
%>
<body>
<div class="panel admin-panel margin-top"> 
<div class="body-content">
<form class="form-x" action="<%=basePath %>UpServlet" method="post" name="form1" enctype="multipart/form-data">
<input type="hidden" name="method" value="<%=method%>" /><input type="hidden" name="id" value="<%=id%>" />
     <div class="form-group">
        <div class="label"><label>报刊名称：</label></div>
        <div class="field"><input type="text" name="mc" class="input w80" value="<%=mc %>" required/></div>
      </div>
     <div class="form-group">
        <div class="label"><label>报刊分类：</label></div>
        <div class="field"> 
            <select name="fl" class="input w50" required>
              <%if(method.equals("upcp")){ %> 
              <option value="<%=fl %>"><%=fl %></option>
              <%}else{%> 
              <option value="">请选择</option>
              <%} %>
              <%List flist=cb.getCom("select * from fl order by id asc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    		  <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    		  <%}} %> 
            </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label"><label>报刊主编：</label></div>
        <div class="field"><input type="text" name="zz" class="input w50" value="<%=zz %>" required/></div>
      </div> 
      <div class="form-group">
        <div class="label"><label>出版社：</label></div>
        <div class="field"><input type="text" name="cbs" class="input w50" value="<%=cbs %>" required/></div>
      </div> 
      
      <div class="form-group">
        <div class="label"><label>报刊价格：</label></div>
        <div class="field"><input type="number" class="input w50" name="jg" value="<%=jg %>" required/>元月</div>
      </div>
     <%if(method.equals("upcp")){ %>
     <div class="form-group">
        <div class="label"><label>报刊图片：</label></div>
        <div class="field"><input type="file" class="input w50" name="pic"/>&nbsp;jpg格式</div>
      </div> 
     <%}else{ %>
     <div class="form-group">
        <div class="label"><label>报刊图片：</label></div>
        <div class="field"><input type="file" class="input w50" name="pic" required/> &nbsp;jpg格式 </div>
      </div> 
     <%} %>
     <div class="form-group">
      <div class="label"><label>详细介绍：</label></div>
      <div class="field"><textarea name="content1" class="input w80" rows="8" style="width:700px;height:400px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></div> 
     </div> 
     
     <div class="form-group">
        <div class="label"><label>发行单位：</label></div>
        <div class="field"><input type="text" name="fs" class="input w50" value="<%=fs %>" required/></div>
      </div>    
      <div class="form-group">
        <div class="label"><label>报刊ISBN：</label></div>
        <div class="field"><input type="text" name="sl" class="input w50" value="<%=sl %>" required/></div>
      </div> 
     <div class="form-group">
        <div class="label"><label>报刊推荐：</label></div>
        <div class="field"> 
            <select name="tj" class="input w50" required>
              <%if(method.equals("upcp")){ %> 
              <option value="<%=tj %>"><%=tj %></option>
              <%}else{%> 
              <option value="">请选择</option>
              <%} %> 
    		  <option value="是">是</option> 
    		  <option value="否">否</option> 
            </select> 
        </div>
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