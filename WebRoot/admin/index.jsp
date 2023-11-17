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
	String username=(String)session.getAttribute("user");  
	if(username==null){
		response.sendRedirect(basePath+"admin/login.jsp");
	}
	else{ 
%>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<%=basePath%>admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="<%=basePath%>index.jsp" target="_top"><span class="icon-home"></span> 前台首页</a>
   &nbsp;&nbsp;<a href="<%=basePath%>admin/index.jsp" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> 
   &nbsp;&nbsp;<a class="button button-little bg-red" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav" style="overflow:scroll; ">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-pencil-square-o"></span>密码信息管理</h2>
  <ul>
    <li><a href="<%=basePath %>admin/system/editpwd.jsp" target="right"><span class="icon-caret-right"></span>密码信息管理</a></li> 
  </ul>  
   
  
  
   
   
  
   
  
  <h2><span class="icon-pencil-square-o"></span>报刊信息管理</h2>
  <ul>
    <li><a href="<%=basePath %>admin/fl/index.jsp" target="right"><span class="icon-caret-right"></span>报刊分类管理</a></li>
    <li><a href="<%=basePath %>admin/fl/add.jsp?method=addfl" target="right"><span class="icon-caret-right"></span>增加报刊分类</a></li> 
    <li><a href="<%=basePath %>admin/cp/index.jsp" target="right"><span class="icon-caret-right"></span>报刊信息管理</a></li>
    <li><a href="<%=basePath %>admin/cp/add.jsp?method=addcp" target="right"><span class="icon-caret-right"></span>增加报刊信息</a></li>
    <li><a href="<%=basePath %>admin/cp/s.jsp" target="right"><span class="icon-caret-right"></span>查询报刊信息</a></li>        
  </ul> 
  <h2><span class="icon-pencil-square-o"></span>注册用户管理</h2>
  <ul>
    <li><a href="<%=basePath %>admin/member/index.jsp" target="right"><span class="icon-caret-right"></span>注册用户管理</a></li>
    <li><a href="<%=basePath %>admin/member/s.jsp" target="right"><span class="icon-caret-right"></span>注册用户查询</a></li> 
  </ul> 
  
  <h2><span class="icon-pencil-square-o"></span>订单信息管理</h2>
  <ul>
    <li><a href="<%=basePath %>admin/dd/index.jsp" target="right"><span class="icon-caret-right"></span>订单信息管理</a></li>
    <li><a href="<%=basePath %>admin/dd/s.jsp" target="right"><span class="icon-caret-right"></span>订单信息查询</a></li> 
  </ul> 
  
  <h2><span class="icon-pencil-square-o"></span>评价信息管理</h2>
  <ul> 
    <li><a href="<%=basePath %>admin/pj/index.jsp" target="right"><span class="icon-caret-right"></span>评价信息管理</a></li> 
  </ul>
  
  <h2><span class="icon-pencil-square-o"></span>数据统计报表</h2>
  <ul>
    <li><a href="<%=basePath %>admin/tj/index.jsp" target="right"><span class="icon-caret-right"></span>数据统计报表</a></li>  
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
  <li><a href="<%=basePath %>admin/main.jsp" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">欢迎使用！</a></li>
  <li></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<%=basePath %>admin/main.jsp" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
<p><a href="" target="_blank"> </a></p>
</div>
</body>
<%} %>
</html>