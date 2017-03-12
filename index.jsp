<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
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
		</script>
		
		
	 <jsp:include page="head.jsp"></jsp:include>
			<div class="content">
				<!-- 焦点图开始 -->
				<div class="main_visual">
					<div class="flicking_con">
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
					</div>
					<div class="main_image">
						<ul>
							<li><span class="img_1"></span></li>
							<li><span class="img_2"></span></li>
							<li><span class="img_3"></span></li>
							<li><span class="img_4"></span></li>
							<li><span class="img_5"></span></li>
						</ul>
						<a href="javascript:;" id="btn_prev"></a>
						<a href="javascript:;" id="btn_next"></a>
					</div>
				</div>
				<!-- 焦点图结束 -->
				
				<!-- 通知 -->
				<div class="notice">
					<p><a href="">让我们一起开启学霸模式吧！</a></p>
				</div>
				
			
				<br>
				<!-- 下面滚动图片代码 -->
				<div class="apply">
					<div class="img_l"><img src="images/left.gif" /></div>
					<div class="apply_nav">
						<div class="apply_w">
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/1.jpg" /></div>
								<div class="apply_info"><a href=#>张瑞</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/2.jpg" /></div>
								<div class="apply_info"><a href=#>姜婷婷</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/3.jpg" /></div>
								<div class="apply_info"><a href=#>金建伟</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/4.jpg" /></div>
								<div class="apply_info"><a href=#>孙晓美</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/5.jpg" /></div>
								<div class="apply_info"><a href=#>王贞</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/1.jpg" /></div>
								<div class="apply_info"><a href=#>张瑞</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/2.jpg" /></div>
								<div class="apply_info"><a href=#>姜婷婷</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/3.jpg" /></div>
								<div class="apply_info"><a href=#>金建伟</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/4.jpg" /></div>
								<div class="apply_info"><a href=#>孙晓美</a></div>
							</div>
							<div class="apply_array">
								<div class="apply_img"><img src="images/index-down/5.jpg" /></div>
								<div class="apply_info"><a href=#>王贞</a></div>
							</div>
							
						</div>
					</div>
					<div class="img_r"><img src="images/right.gif" /></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="footer">
			<p class="address">大连理工大学软件学院13级金融班小学期课程设计</p>
			<p>课程设计团队版权所有</p>
		</div>	 
	</body>
</html>	