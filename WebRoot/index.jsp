<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
 
<%@ include file="iframe/head.jsp" %> 

<div class="blank"></div>

<div class="blank"></div>	
<div class="main">
 <div class="m-rightxx">
    <div class="location">
        <h2><p>±¨¿¯ÐÅÏ¢</p></h2>
      </div>
  <div class="blank"></div>
  <div class="cr-imglist">
        <ul>
<%   
	List pagelist3 = cb.getCom("select * from cp order by id desc limit 8",7); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>           
      <li>
            <p><a href="<%=basePath%>cpinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><img src="<%=basePath+pagelist2.get(6).toString()%>"/></a></p>
            <h3><a href="<%=basePath%>cpinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString() %></a></h3>
      </li>
<%}} %> 
    </ul>
        <div class="clear"></div>
      </div>
  <div class="blank"></div> 
</div>
    <div class="clear"></div>
</div>


<div class="clear"></div>
</div>
 
<%@ include file="iframe/foot.jsp" %>