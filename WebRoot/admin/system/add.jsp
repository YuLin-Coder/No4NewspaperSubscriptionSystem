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
		String usernam="";String password="";String realname="";String sex="";String age="";String address="";String tel="";
		if(method.equals("upm")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from admin where id='"+id+"'",9);
			usernam=alist.get(1).toString();
			password=alist.get(2).toString();
			realname=alist.get(3).toString();
			sex=alist.get(4).toString();
			age=alist.get(5).toString();
			address=alist.get(6).toString();
			tel=alist.get(7).toString();
		}
%>
<body>
<div class="panel admin-panel margin-top"> 
  <div class="body-content">
    <form class="form-x" action="<%=basePath %>AdminServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">  
      <div class="form-group">
        <div class="label"><label>Ա����ţ�</label></div>
        <div class="field"><%if(method.equals("upm")){ %><input type="text" name="username" class="input w50" value="<%=usernam %>" readonly/><%}else{ %>
        <input type="text" class="input w50" name="username" required/><% } %>         
        <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label"><label>��¼���룺</label></div>
        <div class="field"><input type="password" name="password" class="input w50" value="<%=password %>" required/>
        <div class="tipss"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label"><label>�û�������</label></div>
        <div class="field"><input type="text" class="input w50" name="realname" value="<%=realname %>" required/>         
        <div class="tips"></div>
        </div>
      </div>       
      <div class="form-group">
        <div class="label"><label>�û��Ա�</label></div>
        <div class="field">
          <div class="button-group radio"> 
          <label class="button active"><input name="sex" value="��" type="radio" checked="checked">��</label>    
          <label class="button active"><input name="sex" value="Ů"  type="radio">Ů</label>         
           </div> 
          <div class="tipss"></div>         
        </div>
      </div>
      <div class="form-group">
        <div class="label"><label>�û����䣺</label></div>
        <div class="field"><input type="number" class="input w50" name="age" value="<%=age %>" required/> 
        <div class="tipss"></div>         
        </div>
      </div>
      <div class="form-group">
        <div class="label"><label>��ϵ�绰��</label></div>
        <div class="field"><input type="text" class="input w50" name="tel" value="<%=tel %>" pattern="[0-9]{11}" title="11λ�ֻ�����" required />  
        <div class="tipss"></div>        
        </div>
     </div> 
      <div class="form-group">
        <div class="label"><label>��ϵ��ַ��</label></div>
        <div class="field"><input type="text" class="input w50" name="address" value="<%=address %>" required/>      
        <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> �ύ</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<%} %>