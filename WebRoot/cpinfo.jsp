<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<style>
/*��������*/
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
				width:120px;
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
					background:url(images/button_b.gif) no-repeat;
					border:none;
					margin-left:88px;
					width:75px;
					height:22px;}
			.formbtn{ padding-left:205px;}
					
		/*���Կ�*/
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
		/*���Կ� end*/
	/*�������� end*/
</style> 
<div class="blank"></div>
<div class="flash">
  <div class="flexslider">
	<ul class="slides"><img src="<%=basePath %>images/1.png" border="0"></ul> 
</div>
</div>
<div class="blank"></div>	
 


<%
	String id=request.getParameter("id"); if(id==null)id=(String)request.getAttribute("id");
	List list=cb.get1Com("select * from cp where id='"+id+"'",14);	 
	cb.comUp("update cp set dj=dj+1 where id='"+id+"'");
%>
<div class="main">
<div class="m-right">
  <div class="location">
        <h2><p>������Ϣ</p></h2>
      </div>
  <div class="blank"></div>

  <div class="cr-newsshow">
      <h3><%=list.get(1).toString() %></h3>
      <center>���ࣺ<%=list.get(2).toString() %>&nbsp;
      ���ࣺ<%=list.get(3).toString() %>&nbsp;
      �����磺<%=list.get(4).toString() %>&nbsp;
      �۸�<%=list.get(5).toString() %>&nbsp;
 ���е�λ��<%=list.get(8).toString() %>&nbsp;
     ISBN��<%=list.get(9).toString() %>&nbsp;
      ����ʣ�<%=list.get(11).toString() %>&nbsp;������<%=list.get(12).toString() %> 
  <a href="<%=basePath%>ComServlet?method=dc&id=<%=id%>&lx=yue"><font color="red" size="4">�¶�</font></a> 
  <a href="<%=basePath%>ComServlet?method=dc&id=<%=id%>&lx=ji"><font color="red" size="4">����</font></a> 
  <a href="<%=basePath%>ComServlet?method=dc&id=<%=id%>&lx=nian"><font color="red" size="4">�궩</font></a> 
     </center>
      <center><img src="<%=basePath+list.get(6).toString() %>"></center> 
        <%=list.get(7).toString() %><div class="clear"></div>
      </div>
  <div class="blank"></div> 
</div>
<div class="clear"></div>
</div>

<div class="main"> 
    <div class="m-right">
  <div class="location">
        <h2><p>������Ϣ</p></h2>
      </div>
  <div class="blank"></div>
  <div class="cr-news">
        <ul>
<%    
	List pagelist3 = cb.getCom("select * from pj where cpid='"+id+"' order by id desc",6); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>        
      <li><span>�û���<%=pagelist2.get(4).toString()%>&nbsp;&nbsp;
      ʱ�䣺<%=pagelist2.get(5).toString()%></span>&nbsp;&nbsp;
      ���֣�<%=pagelist2.get(2).toString()%>&nbsp;&nbsp;
      ���ۣ�<%=pagelist2.get(3).toString()%></li> 
<% }} %>      
    </ul>
        <div class="clear"></div>
      </div>
   <div class="blank"></div> 
</div>



<div class="main"> 
    <div class="m-right">
  <div class="location">
        <h2><p>��Ҫ����</p></h2>
      </div>
  <div class="blank"></div>

  <div class="in_container" id="in_message">
<%String member=(String)session.getAttribute("member");if(member==null){ %>
<ul> �������¼��</label> </li>
</ul>  
</div>  
<%}else{ %>
<form name="form1" action="<%=basePath %>ComServlet?method=addpj&id=<%=id%>" method="post"> 
<div class="info"> </div>
<ul> 
<li><label>���֣�</label><select name="pf">  
    		  <option value="5">5</option>
    		  <option value="4">4</option> 
    		  <option value="3">3</option> 
    		  <option value="2">2</option> 
    		  <option value="1">1</option>  
            </select></li>
<li><label>���ۣ�</label><textarea name="nr" required></textarea></li>
<li><label> </label><input type='submit' value="�ύ����"></li>
</ul>  
</div>
</form>
<%} %>
        <div class="clear"></div>
      </div>
  <div class="blank"></div> 
</div>
<div class="clear"></div>
</div>
<div class="blank"></div></div>
<%@ include file="iframe/foot.jsp" %>