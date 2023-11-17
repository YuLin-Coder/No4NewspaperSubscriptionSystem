<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
 
<div class="blank"></div>
<div class="flash">
  <div class="flexslider">
	<ul class="slides"><img src="<%=basePath %>images/1.png" border="0"></ul> 
</div>
</div>
<div class="blank"></div>	



<%
	String id=request.getParameter("id"); if(id==null)id=(String)request.getAttribute("id");
	List list=cb.get1Com("select * from xw where id='"+id+"'",5);	 
%>
<div class="main">
<div class="m-right">
  <div class="location">
        <h2><p>促销活动</p></h2>
      </div>
  <div class="blank"></div>

  <div class="cr-newsshow">
      <h3><%=list.get(1).toString() %></h3>
      <center>信息来源：<%=list.get(2).toString() %>&nbsp;&nbsp;发布时间：<%=list.get(4).toString() %></center> 
        <%=list.get(3).toString() %><div class="clear"></div>
      </div>
  <div class="blank"></div> 
</div>
<div class="clear"></div>
</div>



<div class="blank"></div></div>
<%@ include file="iframe/foot.jsp" %>