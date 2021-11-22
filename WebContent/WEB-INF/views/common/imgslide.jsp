<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#visual {
	position: relative;
	width: 960px;
	height: 380px;
	margin: 0 auto;
	overflow: hidden;
	box-shadow: 1px 5px 10px 2px #666;
}

#visual>div {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	transition: 0.3s ease;
	opacity: 0;
}

#visual>div.on {
	opacity: 1;
}

#control {
	position: absolute;
	width: 100%;
	bottom: 30px;
	text-align: center;
}

#control a {
	display: inline-block;
	width: 20px;
	height: 20px;
	background: #f6f5f5;
	line-height: 26px;
	font-size: 0.8em;
	border-radius: 14px;
	margin: 0 2px
}

#control a.on {
	background: #9ab3f5;
}

div#left>span:first-child {
	position: absolute;
	display: inline-block;
	width: 50px;
	height: 8px;
	background-color: black;
	border-radius: 10px;
	transform: translateY(63px) rotate(50deg);
}

div#left>span:last-child {
	position: absolute;
	width: 50px;
	height: 8px;
	background-color: black;
	border-radius: 10px;
	transform: translateY(30px) rotate(-50deg);
}

div#left:hover span {
	background-color: #fff;
	transition: 0.2s ease;
}

div#left {
	position: absolute;
	width: 50px;
	height: 100px;
	top: 50%;
	left: 2.5%;
	transform: translate(0%, -50%);
	cursor: pointer;
	opacity: 0;
	transition: .4s ease;
}

div#right {
	position: absolute;
	width: 50px;
	height: 100px;
	top: 50%;
	left: 90%;
	transform: translate(0%, -50%);
	cursor: pointer;
	opacity: 0;
	transition: .4s ease;
}

div#right>span:first-child {
	position: absolute;
	display: inline-block;
	width: 50px;
	height: 8px;
	background-color: black;
	border-radius: 10px;
	transform: translateY(63px) rotate(-50deg);
}

div#right>span:last-child {
	position: absolute;
	width: 50px;
	height: 8px;
	background-color: black;
	border-radius: 10px;
	transform: translateY(30px) rotate(50deg);
}

div#right:hover span {
	background-color: #fff;
	transition: 0.2s ease;
}
</style>
</head>
<body>
	<div id="visual">
		<div class="on">
			<a href="#"><img src="<%= request.getContextPath() %>/img/1.jpg"
				alt="1" width="100%" height="100%"></a>
		</div>
		<div>
			<a href="#"><img src="<%= request.getContextPath() %>/img/2.jpg"
				alt="2" width="100%" height="100%"></a>
		</div>
		<div>
			<a href="#"><img src="<%= request.getContextPath() %>/img/3.jpg"
				alt="3" width="100%" height="100%"></a>
		</div>
		<section>
			<div id="left">
				<span></span> <span></span>
			</div>
			<div id="right">
				<span></span> <span></span>
			</div>
		</section>
		<section id="control">
			<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a>

		</section>
	</div>
	<script>
		var idx_lgth = $("#visual>div").length;
		  var srt = 1;
		  var idx = 0;
		  
		  $("section>a").click(function(){
		    idx = $(this).index();
		    srt = idx;
		    $(this).addClass('on').siblings().removeClass('on');
		    $("#visual>div").eq(idx).addClass('on').siblings().removeClass('on');
		  });
		  
		var AutoSlide = setInterval(AutoRun, 3000);

		function AutoRun(){
		  srt++;  
		  
		  if(srt == idx_lgth){
		      srt = 0;  
		  }
		$("section>a").eq(srt).addClass('on').siblings().removeClass('on');
		  $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
		}

		$("#visual").mouseover(function(){
		  clearInterval(AutoSlide);
		  $("#right").css({opacity : '1'});
		  $("#left").css({opacity : '1'});
		});
		$("#visual").mouseleave(function(){
		   AutoSlide = setInterval(AutoRun, 3000);
		    $("#right").css({opacity : '0'});
		  $("#left").css({opacity : '0'});
		});

		$("#right").click(function(){
		  srt++;
		 if(srt == idx_lgth){
		      srt = 0;   
		 } 
		 $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on'); $("section>a").eq(srt).addClass('on').siblings().removeClass('on');
		});

		$("#left").click(function(){
		  srt--;
		  if(srt == -1){
		      srt = idx_lgth-1; 
		  }
		 $("#visual>div").eq(srt).addClass('on').siblings().removeClass('on');
		  $("section>a").eq(srt).addClass('on').siblings().removeClass('on'); 
		});
		</script>
</body>
</html>