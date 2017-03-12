<%@ page language="java" import="java.util.*,com.houseworkSystem.service.*,com.houseworkSystem.entity.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>试卷详情</title>
	<style type="text/css">
	.left_m {
	margin:0 auto;
	position:relative;
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
		a{
		font-size:16px;
		}
		.papers_dtl{
		   position:absolute;
		   top:20px;
		   left:150px;
		   right:150px;
		   height:280px;
		}
		ul{ list-style-type:none; margin:0;}
        li{padding-left:16px;background:url(images/back1.jpg) 7px center no-repeat}
	</style>
		<meta http-equiv="Content-Type"content="text/html; charset=utf-8"/> 
		<link rel="stylesheet" type="text/css" href="css/initi.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/plus1.css" />
		<link type="text/css" href="css/style.css" rel="stylesheet"/>
		<script type="text/javascript">
		 function qCode(){
		
		 window.location.href ="qCode.action?paperId="+document.getElementById("bb").getAttribute("name");
		 }
		</script>
		
		<%
		String id = request.getParameter("paperId");
		int Id =Integer.parseInt(id);
		paperservice ps=new paperservice();
		paper p=ps.searchPById(id);
		String name=p.getName();
		int average =p.getAverageMark();
		recordservice rs=new recordservice();
		List<record> list=(List<record>)rs.searchAllrecordsBypaperId(Id);
		 %>
	</head>
	<body>
		<div class="main">
		 	 <jsp:include page="head.jsp"></jsp:include>
	    	<div class="left_m"><br>  
	    	<div class="papers_dtl"> 
	    	 <input type="button" onclick="qCode()" id="bb" name="<%=id %>" style="position:absolute;right:0px;top:15px;" value="二维码分享"><br><br><br>	
	    	    	
	    	  <ul>
	    	  <% 
	    	  if(list.size()==0||list==null)
	    	  {%>
	    	  <h1 align="center" >还未有人做过该试卷。</h1>
	    	    <% }else{ 
	    	    %>
	    	 <a>试卷名称：<%= name %></a><br><br>
	    	<a>平均分：<%= average %></a><br><br>	
	    	    <%
	    	    for(int i=0;i<list.size();i++) 
	    	  {
	    	   String uID = String.valueOf(list.get(i).getStudentId());
	    	   String sname = new userservice().getById(uID).getUserName();
	    	   
	    	  %>
	    	  
	    	  
	    	<li>&nbsp; 
	    	<a href="s_paperDetails.jsp?index=<%=id%>&sName=<%=sname %>">   答题人姓名：<%=sname%>  成绩：<%= list.get(i).getMark() %> </a></li><br>
	    	<%
	    	} }%>
	    	
	    	 
	    	  </ul>
	    	  </div>   
		</div>

	 </div>
		
			
	</body>
</html>	
