<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<style>
/*ÔÚÏßÁôÑÔ*/
	#in_message ul{
		width:500px;
		height:100%;
		overflow:auto;
		margin:0px auto;}
		
		#in_message ul li{
			width:500px;
			padding-top:10px;}
			
			#in_message ul li label{
				margin-right:5px;
				display:block;
				width:80px;
				height:20px;
				line-height:20px;
				text-align:right;
				float:left;}
				
				#in_message ul li input{
					width:250px;
					height:20px;
					border:#CCC 1px solid;}
					
				#in_message ul li textarea{
					border:#CCC 1px solid;
					width:300px;
					height:100px;}
					
				#in_message ul li button{
					cursor:pointer;
					background:url(../images/button_b.gif) no-repeat;
					border:none;
					margin-left:88px;
					width:75px;
					height:22px;}
			.formbtn{ padding-left:205px;}
					
		/*ÁôÑÔ¿ò*/
		#in_message dl{
			width:500px;
			height:100%;
			overflow:auto;
			margin:15px auto;
			border:#CCC 1px solid;
			padding:1px;}
			
			#in_message dl dt{
				width:500px;
				height:25px;
				background-color:#6F0;
				line-height:25px;
				text-indent:1em;
				font-weight:bold;}
				
			#in_message dl dd{
				width:480px;
				line-height:25px;
				padding:0px 10px;
				border-bottom:#CCC 1px dashed;}
				
				#in_message dl dd.re{
					width:450px;
					height:100%;
					overflow:auto;
					margin:15px auto;
					border:#CCC 1px dashed;}
		/*ÁôÑÔ¿ò end*/
	/*ÔÚÏßÁôÑÔ end*/
</style>
   
 
<div class="blank"></div>
<div class="flash">
  <div class="flexslider">
	<ul class="slides"><img src="<%=basePath %>images/1.png" border="0"></ul> 
</div>
</div>
<div class="blank"></div>	
 
 <div class="main"> 
    <div class="m-right">
  <div class="location">
        <h2><p>ÓÃ»§µÇÂ¼</p></h2>
      </div>
  <div class="blank"></div>

  <div class="in_container" id="in_message">
 
<form name="form1" action="<%=basePath %>MemberServlet?method=mlogin" method="post"> 
<div class="info"> </div>
<ul> 
<li><label>µÇÂ¼ÕÊºÅ£º</label><input name="username" type="text" required/></li>
<li><label>µÇÂ¼ÃÜÂë£º</label><input name="password" type="password" required/></li>
<li><label></label><input type='submit' value="Ìá½»µÇÂ¼">
&nbsp;&nbsp;<a href="<%=basePath%>reg.jsp">ÓÃ»§×¢²á</a>
&nbsp;&nbsp;<a href="<%=basePath%>lost.jsp">Íü¼ÇÃÜÂë</a></li>
</ul>  
</div>
</form>
 
        <div class="clear"></div>
      </div>
  <div class="blank"></div> 
</div>
<div class="clear"></div>
 
 
<div class="blank"></div></div>
<%@ include file="iframe/foot.jsp" %>