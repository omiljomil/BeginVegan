<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Begin Vegan</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
/* 탈퇴 완료 화면 */
.layout {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 1300px;
}

#space {
	height: 60px;
}

#line {
	background: #C4C4C4;
	height: 2px;
	width: 940px;
}

#subject {
	font-weight: bold;
	height: 105px;
	text-align: center;
	font-size: 40px;
	padding: 20px;
}

#guide {
	height: 100px;
	text-align: center;
	padding: 35px;
	font-size: 16px;
}

.info {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 940px;
}

#userInfo {
	background: #F7FAF7;
	height: 170px;
}

.delete-info {
	text-align: center;
	height: 45px;
	margin: 30px auto auto auto;
}

#id-print-style {
	font-weight: bold;
	font-size: 24px;
}

.id {
	width: 300px;
	height: 50px;
	margin: 30px auto auto auto;
}

.pw {
	width: 300px;
	height: 50px;
	margin: 0 auto;
}

.print_userId {
	display: inline-block;
}

.delete_message {
	display: inline;
	margin: 0 auto;
}

/* 하단 버튼 */
#space2 {
	height: 105px;
	text-align: center;
}

#space3 {
	height: 70px;
	text-align: center;
}

.checkbtn {
	margin: 30px auto;
	width: 600px;
	display: flex;
	justify-content: center;
	margin-bottom: 100px;
}

.checkbtn button {
	padding: 7px 30px;
	margin: 0 20px;
	font-weight: bold;
}

#confirmbtn {
	border: 1px solid #469536;
	background: #469536;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div class="layout" id="space"></div>
	<div class="layout" id="subject">회원 탈퇴</div>
	<div class="layout" id="line"></div>
	<form action="<%= request.getContextPath() %>/delete_ok.me"
		method="post">
		<div class="layout" id="space"></div>
		<div class="info">
			<div class="delete-info" id="id-print-style">
				<div class="delete_message">탈퇴처리가 완료되었습니다.</div>
			</div>
		</div>
		<div class="layout" id="space"></div>
		<div class="layout" id="space3">
			<div class="checkbtn">
				<button id="confirmbtn">확인</button>
			</div>
		</div>
	</form>
	<div class="layout" id="line"></div>

	<%@ include file="../common/bottontitle.jsp"%>
</body>
</html>