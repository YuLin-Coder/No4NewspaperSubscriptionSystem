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
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
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
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>member/dd/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>member/dd/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
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
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>member/dd/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>member/dd/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
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
      <th>�������</th>  
      <th>�ܽ��</th>   
      <th>����</th>  
      <th>���ʽ</th>   
      <th>��ַ</th>     
      <th>��ϵ�绰</th>     
      <th>�û�</th>   
      <th>�µ�ʱ��</th>   
      <th>ȡ��</th>      
      <th>״̬</th>       
      <th width="250">����</th>
    </tr> 
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from dd where member='"+member+"'");//�õ���Ϣ����			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from dd where member='"+member+"' order by id desc",12);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
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
      <a class="button border-green" href="<%=basePath%>member/dd/info.jsp?id=<%=pagelist2.get(0).toString()%>" target="_blank"><span class="icon-edit"></span> �鿴</a> 
      <a type="button" class="button border-main" href="<%=basePath%>ComServlet?method=qxdd&id=<%=pagelist2.get(0).toString()%>" onclick="if (confirm('ȷ��Ҫȡ����')) return true; else return false;"><span class="icon-edit"></span> ȡ��</a>
      <a class="button border-red" href="<%=basePath%>ComServlet?method=deldd&id=<%=pagelist2.get(0).toString()%>" onclick="if (confirm('ȷ��Ҫɾ����')) return true; else return false;"><span class="icon-trash-o"></span> ɾ��</a>
      </div>
      </td>
    </tr> 
<% }} %>    
    <tr>
        <td colspan="15"><div class="pagelist">
        <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
					<a href="#" onClick="top2()">��ҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()">��һҳ</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()">βҳ</a>&nbsp;&nbsp;&nbsp;
	 ��&nbsp;<input name="busjump" type="text"/>&nbsp;ҳ&nbsp; <a href="#" onClick="bjump2()">&nbsp;ת��</a></div></td>
      </tr>
    
</table>
</form>
</div>

 
</body>
<%} %>

