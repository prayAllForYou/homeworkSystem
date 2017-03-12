<%@page import="com.houseworkSystem.service.paperservice"%>
<%@page import="com.houseworkSystem.entity.paper"%>
<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>

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


	</style>
		<title>卷库</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
		 
		<style type="text/css">
.show_papers {
	height: 250px;	
	position:absolute;
    top:49px;
    left:30px;
    right:20px;
}

a {
	font-size: 16px;
}

.ff {
	width: 95%; /*设置元素宽为80px*/
	height: 20px; /*设置高度为28px*/
	line-height: 21px; /*设置行距为28px，让文字在每行的中间位置*/
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
		function  Store(self){
	     var i ="<%=session.getAttribute("role")%>";
	     var index = self.id;
		 if(i=="1"){
		    window.location.href=("t_paperDetails.jsp?paperId="+index);
		    
		    }
		 else if (i=="0")
		 	window.location.href=("s_paperDetails.jsp?index="+index);
	    }
    </script>
	</head>
	<body>
		<div class="main">
		 <jsp:include page="head.jsp"></jsp:include>
			<div class="left_m">
			<div class="content_s" style="top: 10px; height: 20px;">
			<%
				ArrayList<paper> paperAl = new paperservice().listAllpapers();
				if(session.getAttribute("paperAl")==null)
				   session.setAttribute("paperAl", paperAl) ;
			%>
			<form action = "getpaperListByname.action">
			<input type="text" name="Search">
			<input type="submit" name="sub" value="查找">
			</form>
			</div>
			<div class="show_papers" style="top: 50px; left: 106px; height: 267px;">
			<% ArrayList<paper> al = (ArrayList<paper>)session.getAttribute("paperAl");
			if(al.size()>0){
			for(int i = 0;i<al.size();i++) {%>
			<li> <a class="ff" id = "<%=al.get(i).getId()%>" href="#" onclick="Store(this)"><%=i+1%>:<%=al.get(i).getName() %></a></li>
			<%}}else{ %>
				<br>		
			 <h3>查询结果不存在</h3>
			<%} %>
			</div>
			</div>
			<br> 
			</div>
			
	</body>
</html>	