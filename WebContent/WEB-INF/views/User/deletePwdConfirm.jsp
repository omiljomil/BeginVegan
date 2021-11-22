<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User m = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Begin Vegan</title>
<style>
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
	border: 1px solid #F7FAF7;
}

.id {
	width: 290px;
	height: 50px;
	margin: 35px auto auto auto;
}

.pw {
	width: 290px;
	height: 40px;
	margin: 0 auto;
}

.userId {
	display: inline-block;
	width: 80px;
	margin: 5px auto 10px auto;
}

.printUserId {
	display: inline-block;
}

.userPwd {
	display: inline-block;
	width: 80px;
	margin: 5px auto 10px auto;
}

#inputUserPwd {
	width: 200px;
	height: 30px;
	border: 1px solid #A4A4A4;
	padding: 0px 10px 0px 10px;
	letter-spacing: 5px;
}

.inputPwd {
	display: inline-block;
	width: 200px;
}

.checkPwd {
	width: 200px;
	color: red;
	margin-left: 81px;
	font-size: 12px;
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

#cancelbtn {
	border: 1px solid black;
	background: white;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 회원수정 비밀번호 확인 -->
	<div class="layout" id="space"></div>
	<div class="layout" id="subject">회원 탈퇴</div>
	<div class="layout" id="line"></div>
	<div class="layout" id="guide">탈퇴를 위해 비밀번호를 한 번 더 확인합니다.</div>
	<form action="<%= request.getContextPath() %>/delete.me" method="post">
		<div class="info" id="userInfo">
			<div class="id">
				<div class="userId">
					<b>아이디</b>
				</div>
				<div class="printUserId"><%= m.getUserId() %></div>
				<input type="hidden" name="userId" value="<%= m.getUserId() %>">
			</div>
			<div class="pw">
				<div class="userPwd">
					<b>비밀번호</b>
				</div>
				<div class="inputPwd">
					<input type="password" id="inputUserPwd" name="inputUserPwd">
				</div>
				<div class="checkPwd"></div>
			</div>
		</div>
		<div class="layout" id="space3">
			<div class="checkbtn">
				<button id="confirmbtn">확인</button>
				<button type="reset" id="cancelbtn"
					onclick="location.href='javascript:history.go(-1);'">취소</button>
			</div>
		</div>
	</form>
	<div class="layout" id="line"></div>

	<%@ include file="../common/bottontitle.jsp"%>

</body>
</html>