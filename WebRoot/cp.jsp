<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp"%>
<script language="javascript">
function top2(){
   	form3.action="<%=basePath%>cp.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>cp.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>cp.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>cp.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>cp.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>cp.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>cp.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>cp.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>
	cp.jsp?page=" + page;
				form3.submit();
			}

		}

	}
	//****判断是否是Number.
	function fIsNumber(sV, sR) {
		var sTmp;
		if (sV.length == 0) {
			return (false);
		}
		for (var i = 0; i < sV.length; i++) {
			sTmp = sV.substring(i, i + 1);
			if (sR.indexOf(sTmp, 0) == -1) {
				return (false);
			}
		}
		return (true);
	}
</script>

<div class="blank"></div>
<div class="flash">
	<div class="flexslider">
		<ul class="slides">
			<img src="<%=basePath%>images/3.jpg" border="0">
		</ul>
	</div>
</div>
<div class="blank"></div>


<div class="main">
	<div class="m-rightxx">
		<div class="location">
			<h2>
				<p>报刊信息</p>
			</h2>
		</div>
		<div class="blank"></div>
		<div class="cr-imglist">
			<ul>
				<%
					cb.setEVERYPAGENUM(15);
					int cou = cb.getMessageCount("select count(*) from cp ");//得到信息总数			        
					String page1 = request.getParameter("page");
					if (page1 == null) {
						page1 = "1";
					}
					session.setAttribute("busMessageCount", cou + "");
					session.setAttribute("busPage", page1);
					List pagelist1 = cb.getMessage(Integer.parseInt(page1), "select * from cp order by id desc", 7);
					session.setAttribute("qqq", pagelist1);
					int pageCount = cb.getPageCount(); //得到页数  
					session.setAttribute("busPageCount", pageCount + "");
					List pagelist3 = (ArrayList) session.getAttribute("qqq");
					if (!pagelist3.isEmpty()) {
						for (int i = 0; i < pagelist3.size(); i++) {
							List pagelist2 = (ArrayList) pagelist3.get(i);
				%>
				<li>
					<p>
						<a
							href="<%=basePath%>cpinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><img
							src="<%=basePath + pagelist2.get(6).toString()%>" /></a>
					</p>
					<h3>
						<a
							href="<%=basePath%>cpinfo.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString()%></a>
					</h3>
				</li>
				<%
					}
					}
				%>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="blank"></div>
		<div class="page">
			<form action="" method="post" name="form3">
				<input type="hidden" name="pageCount"
					value="<%=session.getAttribute("busPageCount").toString()%>" />
				<!--//用于给上面javascript传值-->
				<input type="hidden" name="page"
					value="<%=session.getAttribute("busPage").toString()%>" />
				<!--//用于给上面javascript传值-->
				<a href="#" onClick="top2()">首页</a>&nbsp;&nbsp;&nbsp; <a href="#"
					onClick="pre2()">上一页</a>&nbsp;&nbsp;&nbsp; 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="next2()">下一页</a>&nbsp;&nbsp;&nbsp; <a href="#"
					onClick="last2()">尾页</a> 第<input name="busjump" type="text"
					size="3" />页 <a href="#" onClick="bjump2()">转到</a></span>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>


<div class="clear"></div>
</div>

<%@ include file="iframe/foot.jsp"%>