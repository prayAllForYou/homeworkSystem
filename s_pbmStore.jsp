<%@ page language="java" import="java.util.*,com.houseworkSystem.entity.*,com.houseworkSystem.service.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">
.content_s{
	position:absolute;
	border:1px solid #aaa;
	top:10px;
	left:10px;
}
.new_add{
	position:absolute;
	right:160px;
	top:10px;
}
.content_show{
    position:absolute;
    top:49px;
    left:30px;
    right:20px;
}
.ff {
	width: 95%; /*设置元素宽为80px*/
	height: 15px; /*设置高度为10px*/
	line-height: 15px; /*设置行距为28px，让文字在每行的中间位置*/
	background: #D9D9F3; /*设置元素的背景为灰色*/
	color: #000000; /*文字颜色是黑色*/
	margin: 5px 10px;
	font-size: 15px; /*用12号字*/
	display: block;
	/*这个比较关键，因为a本身就是联级元素，本身不具有宽高，用这个把它变成块级元素，这样前面设置的宽和高就能起作用了*/
	text-decoration: none; /*去掉下划线*/
}
	</style>
	<script type="text/javascript">
		 function addPbm(){
			window.location.href="pbmAddEdit.jsp";
		 }
		 
		 </script>	
		<%
		 ArrayList<problem> list=new ArrayList<problem>();
		if(session.getAttribute("list")==null){
		problemservice ps=new problemservice();
	        list=ps.listAllProblems();	
	    }
	    else{
	        list=(ArrayList<problem>)session.getAttribute("list");
	    }   
	 %>	 
		
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="css/style.css" rel="stylesheet"/> 
	</head>
	<body>
		<div class="main">
			 <jsp:include page="head.jsp"></jsp:include>
			<div class="left_m">
			<form action="ssearchPbm.action" method="post">
			<div class="content_s" style="top: 10px; height: 20px;">
			<input type="text" name="tsearchPbm">
			<input type="submit" name="sub" value="查找">
			</div>
			</form>
			<div class="content_show"><br>
			<% if(list.size()==0||list==null)
			{
			%><h3> 查询结果不存在</h3><%
			}else{
			for(int i=0;i<list.size();i++)
			{		
             %>			
			&nbsp;&nbsp;&nbsp;&nbsp;<a class="ff" href="pbmDetails.jsp?id=<%=list.get(i).getId()%>">*&nbsp;<%=list.get(i).getContent() %></a> 
			 <%}
			 } %> 	
			</div>
			</div>
			<br> 
			</div>
			
	</body>
</html>	
