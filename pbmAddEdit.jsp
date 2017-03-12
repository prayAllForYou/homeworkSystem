 <%@page import="com.houseworkSystem.service.problemservice,com.houseworkSystem.entity.*"%>
<%@ page language="java" import="java.util.*" 	pageEncoding="UTF-8"%>
<html>
	<head>
		<title>试题编辑以及增加</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
		<!-- 焦点图插件结束 -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<!-- 焦点图插件开始 -->
		<script type="text/javascript" src="js/jquery.event.drag-1.5.min.js"></script>
		<script type="text/javascript" src="js/jquery.touchSlider.js"></script>
		<!-- 焦点图插件结束 -->
		<style type="text/css">
		.content{
		    border:2px dashed #aaa;
		    position:absolute;
		    left:250px;
		    right:250px;
		    height:350px;
		    top:170px;
		}
	.question_dtl{
	        position:relative;
	        top:50px;
	        left:220px;
	        width:360px;
	}
	textarea{
	     border:1px solid #aaa;
	     height:70px;
	     width:280px;
	     left:50px;
	}
	.text1{
	 FONT-SIZE: 9pt; 
          BORDER-BOTTOM: 0px 
           color: #996600; 
           height:10px;
           width:270px;
	    
	}
	</style>
	</head>
	<body>
		<div class="main">
		 <jsp:include page="head.jsp"></jsp:include>
			 
			<br>
			<div class="content">
			<div class="question_dtl" >		 
	             <form action="add.action" method="post">
			   <span style="height:18px;display:block;vetical-align:top;float:left;">题目表述：</span>
		<textarea col="60" row="10" name="content"></textarea><br><br><br>
			答案：<br> 
			&nbsp;&nbsp; &nbsp; 
			    A:<input type="text" name="choose" style="border:1px solid #aaa;height:15px;" class="text1"> 
			                  <br><br>&nbsp;&nbsp; &nbsp; 
			    B:<input type="text"  class="text1" name="choose"   style="border: 1px solid rgb(170, 170, 170);height:15px;">
			                  <br><br>&nbsp; &nbsp;&nbsp;  
			    C:<input type="text"  class="text1" name="choose"  style="border: 1px solid rgb(170, 170, 170);height:15px;">
			                  <br><br>&nbsp;&nbsp; &nbsp;  
			    D:<input type="text"  class="text1" name="choose"  style="border: 1px solid rgb(170, 170, 170);height:15px;"> 
			                  <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 正确答案： <input type="text" name="rightAnswer" style="border:1px solid #aaa"><br><br>
			   <input type="submit" value="提交" style="position:absolute;left:160px">
			   </form>
			   <br>
			     
			</div>
			</div>
			</div>
			
			
	</body>
</html>	
 