<%@ page language="java" import="java.util.*" 	pageEncoding="UTF-8"%>
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type"content="text/html"/> 
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
		<script type="text/javascript">
			$(function() {
				//焦点图插件代码开始
				$(".main_visual").hover(
					function(){
						$("#btn_prev,#btn_next").fadeIn()
					},
					function(){
						$("#btn_prev,#btn_next").fadeOut()
					}
				);
				$dragBln = false;
				$(".main_image").touchSlider({
					flexible : true,
					speed : 200,
					btn_prev : $("#btn_prev"),
					btn_next : $("#btn_next"),
					paging : $(".flicking_con a"),
					counter : function (e){
						$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
					}
				});
				$(".main_image").bind("mousedown", function() {
					$dragBln = false;
				});
				
				$(".main_image").bind("dragstart", function() {
					$dragBln = true;
				});
				
				$(".main_image a").click(function(){
					if($dragBln) {
						return false;
					}
				});
				timer = setInterval(function(){
					$("#btn_next").click();
				}, 5000);
				$(".main_visual").hover(
					function(){
						clearInterval(timer);
					},
					function(){
						timer = setInterval(
							function(){
								$("#btn_next").click();
							},5000
						);
					}
				);
				
				$(".main_image").bind("touchstart",function(){
					clearInterval(timer);
				}).bind("touchend", function(){
					timer = setInterval(function(){
						$("#btn_next").click();
					}, 5000);
				});
				//焦点图插件代码结束
				
				//topbar 单击样式
				$(".topbar li a").click(function(){
					$(this).css("color", "#0153a5");
					$(this).parent().siblings().find("a").css("color", "#666");
				});
				
				//鼠标经过列表样式
				$(".left_ul li").hover (
					function(){
						$(this).addClass("li_click_b");
					},
					function(){
						$(this).removeClass("li_click_b");
					}
				);
				
			 
				$li1 = $(".apply_nav .apply_array");
				$window1 = $(".apply .apply_w");
				$left1 = $(".apply .img_l");
				$right1 = $(".apply .img_r");
				$window1.css("width", $li1.length*176);
				var lc1 = 0;
				var rc1 = $li1.length-5;
				$left1.click(function(){
					if (lc1 < 1) {
						
						return;
					}
					lc1--;
					rc1++;
					$window1.animate({left:'+=176px'}, 1000);
				});
				$right1.click(function(){
					if (rc1 < 1){
						
						return;
					}
					lc1++;
					rc1--;
					$window1.animate({left:'-=176px'}, 1000);
				});
				 
			});
	function prbStore(){
		 var i ="<%=session.getAttribute("role")%>";
		 if(i=="1")
		    window.location.href="t_pbmStore.jsp";
		 else if (i=="0")
		 	window.location.href="s_pbmStore.jsp";
	
	}
	 
		</script>
	</head>
	 
	<body>
		<div class="main">
			<div class="header">
			<div class="help">
					<p><%=session.getAttribute("userName") %>，欢迎你！</p>
					 
				</div>
			</div>
			<div class="topbar">
				<ul>
					<li><a class="clicked" href="index.jsp">首页</a></li>
					<li><a href="#" onclick="prbStore()">题库</a></li>
					<li><a href="paperStore.jsp">卷库</a></li>
					
				</ul>
			</div>
			<!-- 好像只有添加iframe才能使头部独立成一个文件来处理，而且使用js给导航栏添加单击样式
			<iframe name="contain" width="100%" height="100%"></iframe>
			-->
			 
			
	</body>
</html>	
