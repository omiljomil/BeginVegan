<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bottontitle {
	margin-top: 100px;
	width: 100%;
	height: 300px;
	background-color: #606060;
}
.buttontext h1{
	padding: 100px;
	
}
.buttontext{
	font-size: 10px;
	padding-left: 100px;
	font-weight: bold;
}
.buttontext a{
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="bottontitle" style="margin : 0;
	margin-top: 100px;
	width: 100%;
	height: 300px;
	background-color: #606060;"
	>
		<h1 style="padding: 100px; padding-bottom: 50px;">BeginVegan</h1>
			<div class="buttontext" style="background-color: #606060">
			<div style="background-color: #606060">
				<a href="#">회사소개 | </a>
				<a href="#">이용약관 | </a>
				<a href="#">개인정보처리방침 | </a>
				<a href="#">이용안내</a>
				<a href="<%=request.getContextPath()%>/managerLogin.me">관리자</a>
			</div>
			
			<div style="background-color: #606060">상호 : 주식회사 비긴비건</div>
			<div style="background-color: #606060">대표번호 1666-1666  광고 마케팅 문의 : omiljomil@naver.com</div>
		</div>
		

		
	</div>
</body>
</html>