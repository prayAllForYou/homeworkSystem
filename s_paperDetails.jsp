<%@page import="com.houseworkSystem.service.recordservice"%>
<%@page import="com.houseworkSystem.service.userservice"%>
<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.houseworkSystem.service.*"%>
<%@page import="com.houseworkSystem.service.problemservice"%>
<%@page import="com.houseworkSystem.service.recordservice"%>
<%@page import="com.houseworkSystem.entity.paper"%>
<%@page import="com.houseworkSystem.entity.record"%>
<%@page import="com.houseworkSystem.entity.problem"%>
<!DOCTYPE html>
<html>
	<head>
	<style type="text/css">
	.left_m {
	margin:0 auto;
	position:absolute;
	top:150px;
	left:400px;
	right:400px;
	border:1px solid #aaa;
	bottom:0px;
	height:625px;
}
.show_papers{
		   position:absolute;
		   top:50px;
		   left:100px;
		   right:100px;
		   height:250px;
		}
		a, li{
		font-size:16px;
		}
		.people_dtl{
		   position:absolute;
		   top:20px;
		   left:150px;
		   right:150px;
		   height:280px;
		}
		ul{ list-style-type:none; margin:0;}
        li{padding-left:16px;background:url(images/back1.jpg) 7px center no-repeat}
	</style>
	
	<script type="text/javascript">
		function prbStore1(self){
	     var index = self.id;
		 window.location.href="s_pbmDetails.jsp?id="+index;
	    }
    </script>
		<title>答题人试卷详情</title>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
    
      <%  int i =Integer.parseInt(request.getParameter("index"));
	        System.out.println("----------"+i);
	    	ArrayList<paper> al = (ArrayList<paper>)session.getAttribute("paperAl");
	        String studentName = new String();
	    	if(request.getParameter("sName")==null)
	        studentName = (String)session.getAttribute("userName");
	        else{
	        	studentName = request.getParameter("sName");
	        }
	        System.out.println("["+studentName+"]");
	        int studentId = (int)new userservice().searchUserByname(studentName).getId();
	        int paperId = i;
	        String problemSet =new paperservice().listAllpapersById(paperId).get(0).getProblemSet();
	        String[] problemsId = problemSet.split(" ");
	        System.out.println("?"+studentId+"?"+paperId);
	        ArrayList<record> record = new recordservice().searchAllrecordsBystudentIdAndpaperId(studentId, paperId);
	        String studentAnswer = new String();
	        if(record.size()!=0)
	        {
	        studentAnswer = record.get(0).getStudentAnswer();
	        }
	        String[] studentAnswers = studentAnswer.split(" ");
	        String[] AnswerFunction = {"A","B","C","D"};
	    %>
	    <script type="text/javascript">
	    function dopaper(){
	     window.location.href="paperAsw.jsp?id="+document.getElementById("bbb").getAttribute("name");
	    }
	    </script>
	 </head>
	<body>
		<div class="main">
			 
			 <jsp:include page="head.jsp"></jsp:include>
	    <div class="left_m"><br> 
	    
	    <div class="people_dtl"> 
	  <input type="button" value="做卷子喽" style="position:absolute;right:0px;top:15px;" id="bbb" name="<%=i %>" onclick="dopaper()" />
	    <% if(record.size()!=0) {%>
	        &nbsp;<a>姓名</a>：<%=studentName%><br><br>
	    	&nbsp;<a>分数</a>：<%=record.get(0).getMark()%><br><br><ul>
	    	<%for(int a = 0;a<problemsId.length;a++){ %>
	    	<% problem p =  new problemservice().searchproblemById(Integer.parseInt(problemsId[a])).get(0);
	    	   
	    	%>
	        
	    	<li>&nbsp;题目内容：<%=p.getContent() %>&nbsp; &nbsp;我的答案：<%=AnswerFunction[Integer.parseInt(studentAnswers[a])] %> &nbsp;正确答案:<%=AnswerFunction[p.getAnswer()] %></li><br>
	    	
	    	<%}%>
	    	</ul>
	    	<% 
	    	 }else if(record.size()==0) {%>
	    	<br><br><br><br><br><br>
	    	<h1>你还没有未做过这套卷子，赶紧做一做吧！</h1>
	    	<%} %>
	    	
		</div>
	  </div>
	</body>
</html>	