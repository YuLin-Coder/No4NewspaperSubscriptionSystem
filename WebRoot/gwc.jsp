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
        <h2><p>���ﳵ</p></h2>
      </div>
  <div class="blank"></div>
  <div class="cr-news">
        <ul>
        <li><span> ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        �۸�&nbsp;&nbsp;
        �ܼ�&nbsp;&nbsp;
        �޸�&nbsp;&nbsp;&nbsp;&nbsp;ɾ��</span>��������</li> 
<%   
	String member=(String)session.getAttribute("member");float sum=0; 
	if(member!=null) {
	List pagelist3 = cb.getCom("select * from gwc where member='"+member+"' and ddbh='����' order by id desc",6); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
			sum+=Float.parseFloat(pagelist2.get(5).toString());
%>        
      <li><span> <input type="text" id="<%=pagelist2.get(0).toString()%>_count" value="<%=pagelist2.get(3).toString()%>" size="3"/>
      &nbsp;&nbsp;&nbsp;&nbsp; 
      <%=pagelist2.get(4).toString()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <%=pagelist2.get(5).toString()%>&nbsp;&nbsp;&nbsp; 
        <a href="javascript:go('<%=pagelist2.get(0).toString()%>')">�޸�</a>
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
        <a href="javascript:go2('<%=pagelist2.get(0).toString()%>')">ɾ��</a></span>
        <%=pagelist2.get(2).toString() %></li> 
<% }}}else{ %> 
<li>���ȵ�¼��</li> 
<%} %>     
    </ul>
        <div class="clear"></div>
      </div>
  <div class="blank"></div>
  <div class="page">  <span class="pageinfo">
  <%if(member!=null) { List pagelist3 = cb.getCom("select * from gwc where member='"+member+"' and ddbh='����' order by id desc",5); if(!pagelist3.isEmpty()){%>
  <form action="<%=basePath%>ComServlet?method=tjdd" method="post" name="form1">
  	Ŀǰ���ﳵ�ܽ�<%=sum %> Ԫ<br>
    ���<select name="fkfs">   
    		  <option value="֧��������">֧����</option> 
    		  <option value="΢�Ÿ���">΢��</option> 
    		  <option value="��������">����</option> 
            </select>&nbsp;&nbsp; 
            ������<input name="xm" type="text" size="5" required/>&nbsp;&nbsp; 
            ��ַ��<input name="dz" type="text" size="20" required/>&nbsp;&nbsp; 
            �绰��<input name="lxdh" type="text"  pattern="[0-9]{11}" title="11λ�ֻ�����" size="11" required/><br>
  	<input type="submit" value="&nbsp;&nbsp;�ύ���ɶ���&nbsp;&nbsp;"/> 
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