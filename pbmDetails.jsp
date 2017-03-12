<%@ page language="java" import="java.util.*,com.houseworkSystem.entity.*,com.houseworkSystem.service.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>题目详情</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 下面滚动图插件开始 -->
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<!-- 下面滚动图插件结束 -->
		<!-- 焦点图插件开始 -->
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
		<style type="text/css">
		.content{
		    border-top:2px dashed #aaa;
		    border-left:2px dashed #aaa;
		    border-right:2px dashed #aaa;
		    position:absolute;
		    left:250px;
		    right:250px;
		    height:550px;
		    top:140px;
		  }
	.question_dtl{
	        position:absolute;
	        top:50px;
	        left:80px;
	}
	.text{
	     FONT-SIZE: 9pt; 
          BORDER-BOTTOM: 0px 
           color: #996600; 
          height: 60px; 
         width: 300px; 
	}
	.text1{
	 FONT-SIZE: 9pt; 
          BORDER-BOTTOM: 0px 
           color: #996600; 
           height:10px;
           width:300px;
	    
	}
	.li{
	FONT-SIZE: 13pt; 
	}
		</style>

	</head>
	<%
      String Id=(String)request.getParameter("id");
      int id = Integer.parseInt(Id); 
      problemservice ps=new problemservice();
      List<problem> list1=(List<problem>)ps.searchproblemById(id);
      int r=list1.get(0).getRightNumber();
      int w=list1.get(0).getWrongNumber();
      double everage=0;      
      if(w==0&&r!=0)
         {    
           everage=100;
      }
      else if(w!=0&&r!=0)
      {
          everage=100*r/(r+w);
      }
      commentservice cs=new commentservice();
      List<comment> list2=(List<comment>)cs.searchCommentsByproblemId(id);
      String[] choose=list1.get(0).getChoose();
      
	 %>
	<body>
		<div class="main">
		<jsp:include page="head.jsp"></jsp:include>
		&nbsp; 			 
			<br><div class="content">
			<form action="details.action" method="post">
			<div class="question_dtl" style="top: 14px; left: 70px; height: 328px; width: 545px;">
	
			<li class="li">题目描述：<%= list1.get(0).getContent()  %></li><br><br>&nbsp; 
			答案： 
			<br><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
				A:<%= choose[0] %>
			                  <br><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  
			    B:<%= choose[1] %>
			                  <br><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
			    C:<%= choose[2] %>
			                  <br><br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
			    D:<%= choose[3] %><br><br>

			  &nbsp;&nbsp;&nbsp;<li class="li">正确率：<%= everage%>% </li> 
			                  
			   <br><br>
			 &nbsp;&nbsp;&nbsp;评论：<br>
			   <% for(int i=0;i<list2.size();i++) 
			  {%>
			 &nbsp; &nbsp;&nbsp; &nbsp;  <%= list2.get(i).getMasterName() %>： <%=list2.get(i).getContent() %>&nbsp; 
			 <div style="width:720px;height:1.5px;margin-left:40px ;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div><br>
			  <%} %>
			</div>
			</form>
			
			</div>
			
			
	</body>
</html>	
