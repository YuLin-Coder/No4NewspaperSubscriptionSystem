<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
 
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
        <h2><p>购物车</p></h2>
      </div>
  <div class="blank"></div>
  <div class="cr-news">
        <ul>
        <li><span> 数量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        价格&nbsp;&nbsp;
        总价&nbsp;&nbsp;
        修改&nbsp;&nbsp;&nbsp;&nbsp;删除</span>报刊名称</li> 
<%   
	String member=(String)session.getAttribute("member");float sum=0; 
	if(member!=null) {
	List pagelist3 = cb.getCom("select * from gwc where member='"+member+"' and ddbh='暂无' order by id desc",6); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
			sum+=Float.parseFloat(pagelist2.get(5).toString());
%>        
      <li><span> <input type="text" id="<%=pagelist2.get(0).toString()%>_count" value="<%=pagelist2.get(3).toString()%>" size="3"/>
      &nbsp;&nbsp;&nbsp;&nbsp; 
      <%=pagelist2.get(4).toString()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%=pagelist2.get(5).toString()%>&nbsp;&nbsp;&nbsp; 
        <a href="javascript:go('<%=pagelist2.get(0).toString()%>')">修改</a>
<script type="text/javascript">
function go(proId)
{
var str;
str="ComServlet?method=upgwc&count=";
str+=document.getElementById(proId+"_count").value;
str+="&";
str+="proId=";
str+=proId;
window.location=str;
}
function go2(proId)
{
var str;
str="ComServlet?method=delgwc&count=";
str+=document.getElementById(proId+"_count").value;
str+="&";
str+="proId=";
str+=proId;
window.location=str;
}
</script> 
        &nbsp;&nbsp; 
        <a href="javascript:go2('<%=pagelist2.get(0).toString()%>')">删除</a></span>
        <%=pagelist2.get(2).toString() %></li> 
<% }}}else{ %> 
<li>请先登录！</li> 
<%} %>     
    </ul>
        <div class="clear"></div>
      </div>
  <div class="blank"></div>
  <div class="page">  <span class="pageinfo">
  <%if(member!=null) { List pagelist3 = cb.getCom("select * from gwc where member='"+member+"' and ddbh='暂无' order by id desc",5); if(!pagelist3.isEmpty()){%>
  <form action="<%=basePath%>ComServlet?method=tjdd" method="post" name="form1">
  	目前购物车总金额：<%=sum %> 元<br>
    付款：<select name="fkfs">   
    		  <option value="支付宝付款">支付宝</option> 
    		  <option value="微信付款">微信</option> 
    		  <option value="网银付款">网银</option> 
            </select>&nbsp;&nbsp; 
            姓名：<input name="xm" type="text" size="5" required/>&nbsp;&nbsp; 
            地址：<input name="dz" type="text" size="20" required/>&nbsp;&nbsp; 
            电话：<input name="lxdh" type="text"  pattern="[0-9]{11}" title="11位手机号码" size="11" required/><br>
  	<input type="submit" value="&nbsp;&nbsp;提交生成订单&nbsp;&nbsp;"/> 
  </form> 
<%}} %> </div>
</div>
<div class="clear"></div>
<div class="blank"></div>
<div class="blank"></div>
<div class="blank"></div>
<div class="blank"></div>
<div class="blank"></div>
<div class="blank"></div>
</div>

<div class="blank"></div></div>
<%@ include file="iframe/foot.jsp" %>