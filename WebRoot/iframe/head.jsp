<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="<%=basePath %>images/menu.css">
<link href="<%=basePath %>images/style.css" rel="stylesheet" type="text/css">  
<script type="text/javascript" src="<%=basePath %>images/scroll_jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>images/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>images/fun.js"></script>
<script type="text/javascript" src="<%=basePath %>images/imgSlide.js"></script>
<script type="text/javascript" src="<%=basePath %>images/kxbdMarquee.js"></script>
<script type="text/javascript" src="<%=basePath %>images/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/ad.js"></script>
<script type="text/javascript">
	$(function(){
		/*$('#honorlist').kxbdMarquee({direction:'left'});*/
		$('#ztcenlist').kxbdMarquee({direction:'left'}); 
	});
</script>
<style>
#ztcenlist {width: 728px;height: 246px;float: right;position: relative;overflow: hidden;}
#ztcenlist li {width: 256px;height: 246px;float: left;padding: 4px 8px 0 8px;display: inline;}
#ztcenlist li p {width: 256px;overflow: hidden;}
#ztcenlist li p img {width: 256px;height: 212px;}
#ztcenlist li h3 {
	width: 256px;
	height: 20px;
	line-height: 20px;
	font-weight: normal;
	font-size: 12px;
	text-align: center;
}
.case-cen {
	width: 728px;
	/*height: 146px;*/
	float: left;
	position: relative;
	overflow: hidden;
	background: #FFF;
}
</style>

<script type="text/javascript" charset="UTF-8" src="<%=basePath %>images/bsl.js"></script>
<script type="text/javascript" charset="UTF-8" src="<%=basePath %>images/main_icon_invite_mess_api.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>images/main.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>images/fix.css">
<link type="text/css" rel="stylesheet" href="<%=basePath %>images/m-webim-lite.css">
<script type="text/javascript" src="<%=basePath %>images/m-webim-lite.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=basePath %>images/float.css" type="text/css" charset="utf-8">
</head>
<body style="">
<div class="layout">
<div class="header">
  <div class="logo"><br><p style="font-family:Microsoft YaHei;font-weight:bold;font-size:300%;color:#197ac1">新华书店报刊导购系统</p></div>
  <div class="sitetool"> </div>
  <div class="clear"></div>
</div>
 

<div class="container">
    <div class="menu style-1">
        <ul class="menu">    
        <li><a href="index.jsp">网站首页</a></li> 
	    <li><a href="cp.jsp">报刊信息</a></li>
	    <li><a href="rm.jsp">销量排行</a></li>
	    <li ><a href="cp.jsp">所有分类</a>
          <ul>
<%
List fllist=cb.getCom("select * from fl order by id asc",2);
if(!fllist.isEmpty()){
	for(int i=0;i<fllist.size();i++){
		List list2=(List)fllist.get(i); 
%>
<li><a href="fl.jsp?fl=<%=list2.get(1).toString()%>" class="rss" title="Subscribe to RSS"><%=list2.get(1).toString()%></a></li>
<%}}%> 
          </ul>
        </li>
        <li><a href="s.jsp">报刊查询</a></li>
        
        <li><a href="gwc.jsp">购物车</a></li>
        <li><a href="member/index.jsp">会员中心</a></li>   
        </ul>
    </div>
</div>
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