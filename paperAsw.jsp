 <%@ page language="java" import="java.util.*,com.houseworkSystem.entity.*,com.houseworkSystem.service.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生答题</title>
   <style type="text/css">
.btn
{
    border-right: #7b9ebd 1px solid;
    padding-right: 2px;
    border-top: #7b9ebd 1px solid;
    padding-left: 2px;
    font-size: 12px;
    FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,  StartColorStr=#ffffff,  EndColorStr=#cecfde);
    border-left: #7b9ebd 1px solid;
    cursor: hand;
    color: black;
    padding-top: 2px;
    border-bottom: #7b9ebd 1px solid;
   
}

   </style>
   <%
    String id = request.getParameter("id");
    
	if(session.getAttribute("userName")==null){
	String url= "paperAsw.jsp?id="+id;
	session.setAttribute("url", url);
	response.sendRedirect("toLogin.action");
    }
    paper p = new paperservice().searchPById(id);
    String pbm[] = p.getProblemSet().trim().split(" ");
    System.out.println(pbm.length);
    ArrayList<problem> list =new problemservice().getPaperPbm(pbm);
    %> 
  </head>  
  
  <body>
   <div class="main">
		<jsp:include page="head.jsp"></jsp:include>
			 <form action="prcsPaper.action?paperId=<%=id  %>"  method="post">
			 <% 
		    String choose[]=new String[4];
			for( int i =0;i<list.size();i++){ 
			    choose= list.get(i).getChoose();  
			 %>
			<div class="question_dtl" style="margin:10px auto ;top:30px; left: 72px; height: 230px; width: 382px;">		
			<li class="li">题目描述：<%=list.get(i).getContent() %></li><br>&nbsp;&nbsp;&nbsp;&nbsp;  			  
			<input type="checkbox" value="0" name="choose">&nbsp;A:<%=choose[0] %><br><br>&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="checkbox" value="1" name="choose">&nbsp;B:<%=choose[1] %><br><br>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" value="2" name="choose">&nbsp;C:<%=choose[2] %><br><br>&nbsp;&nbsp;&nbsp;&nbsp; 
		    <input type="checkbox" value="3" name="choose">&nbsp;D:<%=choose[3] %> <br><br>&nbsp; 
			<a href=#>评论</a>:
			<input type="text" name="comment" style="border: 1px solid rgb(170, 170, 170); width: 360px; height: 40px;right:10px;"><br><br>&nbsp;&nbsp;&nbsp; <br>
			</div>	
			<br>
			<%} %>
			<input  class="btn" type="submit" value="提交试卷" style="position:absolute;left:55%;riht:45%;">
			 </form>
			</div>
  </body>
</html>
 