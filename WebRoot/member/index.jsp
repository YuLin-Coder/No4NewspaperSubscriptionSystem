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
    <title></title>  
    <link rel="stylesheet" href="<%=basePath%>admin/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/admin.css">
    <script src="<%=basePath%>admin/js/jquery.js"></script>   
</head>
<%
	String member=(String)session.getAttribute("member");  
	if(member==null){
		response.sendRedirect(basePath+"login.jsp");
	}
	else{ 
%>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<%=basePath%>admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />��Ա����</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="<%=basePath%>index.jsp" target="_top"><span class="icon-home"></span> ǰ̨��ҳ</a>
   &nbsp;&nbsp;<a href="<%=basePath%>member/index.jsp" class="button button-little bg-blue"><span class="icon-wrench"></span> �������</a> 
   &nbsp;&nbsp;<a class="button button-little bg-red" onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>MemberServlet?method=memberexit"><span class="icon-power-off"></span> �˳���¼</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>�˵��б�</strong></div>
  <h2><span class="icon-pencil-square-o"></span>������Ϣ����</h2>
  <ul>
    <li><a href="<%=basePath %>member/info/editpwd.jsp" target="right"><span class="icon-caret-right"></span>������Ϣ����</a></li> 
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>������Ϣ����</h2>
  <ul>
    <li><a href="<%=basePath %>member/info/index.jsp" target="right"><span class="icon-caret-right"></span>������Ϣ����</a></li> 
  </ul> 
   
  <h2><span class="icon-pencil-square-o"></span>������Ϣ����</h2>
  <ul>
    <li><a href="<%=basePath %>member/dd/index.jsp" target="right"><span class="icon-caret-right"></span>������Ϣ����</a></li> 
    <li><a href="<%=basePath %>member/dd/s.jsp" target="right"><span class="icon-caret-right"></span>��ѯ������Ϣ</a></li>        
  </ul> 
   
   
  
   
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="<%=basePath %>member/main.jsp" target="right" class="icon-home"> ��ҳ</a></li>
  <li><a href="##" id="a_leader_txt">��ӭʹ�ã�</a></li>
  <li></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<%=basePath %>member/main.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<p><a href="" target="_blank"> </a></p>
</div>
</body>
<%} %>
</html>