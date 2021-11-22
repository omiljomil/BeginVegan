<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.idform {
	width: 650px;
	margin: 0 auto;
	border: 1px solid #909090;
	padding: 20px;
	margin-top: 100px;
}

.idform h3 {
	margin-left: 40px;
}

.seartext {
	margin: 10px;
	padding: 10px;
	border-top: 1px solid #909090;
	border-bottom: 1px solid #909090;
	padding-bottom: 18px;
	padding-left: 40px;
}

.seartext .id_name, .id_email {
	margin: 7px;
	padding: 10px;
}

.seartext input {
	width: 230px;
	margin-left: 50px;
	padding: 6px;
	margin-right: 20px;
	border: none;
	border-bottom: 1px solid #606060;
}

.seartext .id_name input {
	margin-left: 66px;
}

.searchbtn {
	width: 300px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.searchbtn button {
	width: 130px;
	padding: 7px;
	border-style: none;
	background: yellowgreen;
	color: white;
	font-size: 15px;
	border-radius: 25px;
	position: relative;
	transition: all 0.3s;
}

.searchbtn button {
	font-family: "proxima-nova", sans-serif;
	font-weight: 500;
	font-size: 13px;
	text-transform: uppercase !important;
	letter-spacing: 2px;
	color: #fff;
	cursor: hand;
	text-align: center;
	text-transform: capitalize;
	border: 1px solid #fff;
	border-radius: 50px;
	position: relative;
	overflow: hidden !important;
	-webkit-transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-o-transition: all .3s ease-in-out;
	transition: all .3s ease-in-out;
	z-index: 10;
	background-color: yellowgreen;
}

.searchbtn button:hover {
	border: 1px solid #071982;
	color: #fff !important;
}

.searchbtn button::before {
	content: '';
	width: 0%;
	height: 100%;
	display: block;
	background: yellowgreen;
	position: absolute;
	-ms-transform: skewX(-20deg);
	-webkit-transform: skewX(-20deg);
	transform: skewX(-20deg);
	left: -10%;
	opacity: 1;
	top: 0;
	z-index: -12;
	-moz-transition: all .7s cubic-bezier(0.77, 0, 0.175, 1);
	-o-transition: all .7s cubic-bezier(0.77, 0, 0.175, 1);
	-webkit-transition: all .7s cubic-bezier(0.77, 0, 0.175, 1);
	transition: all .7s cubic-bezier(0.77, 0, 0.175, 1);
	box-shadow: 2px 0px 14px rgba(0, 0, 0, .6);
}

.searchbtn button::after {
	content: '';
	width: 0%;
	height: 100%;
	display: block;
	background: #80ffd3;
	position: absolute;
	-ms-transform: skewX(-20deg);
	-webkit-transform: skewX(-20deg);
	transform: skewX(-20deg);
	left: -10%;
	opacity: 0;
	top: 0;
	z-index: -15;
	-webkit-transition: all .94s cubic-bezier(.2, .95, .57, .99);
	-moz-transition: all .4s cubic-bezier(.2, .95, .57, .99);
	-o-transition: all .4s cubic-bezier(.2, .95, .57, .99);
	transition: all .4s cubic-bezier(.2, .95, .57, .99);
	box-shadow: 2px 0px 14px rgba(0, 0, 0, .6);
}

.searchbtn button:hover::before, .searchbtn button:hover::before {
	opacity: 1;
	width: 116%;
}

.searchbtn button:hover::after, .searchbtn button:hover::after {
	opacity: 1;
	width: 120%;
}

.searchpwd {
	width: 300px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.searchpwd button {
	width: 300px;
	margin-top: 25px;
	padding: 7px;
	font-size: 15px;
	border-style: none;
	background: yellowgreen;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<form action="<%= request.getContextPath() %>/idFindResult.me"
		method="post" name="joinForm" onsubmit="return checkValue()">
		<div class="idform">
			<h3>아이디 찾기</h3>
			<div class="seartext">
				<div class="id_name">
					이름 <input type="text" id="userName" name="userName" />
				</div>
				<div class="id_email">
					이메일 <input type="text" id="email" name="email" />
				</div>
			</div>
			<div class="searchbtn">
				<button value="다음" id="next">다음</button>

				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/loginForm.me'">취소</button>
			</div>
			<div class="searchpwd">
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/pwdFindForm.me'">비밀번호찾기</button>
			</div>

		</div>
	</form>
</body>
<footer>
	<%@ include file="../common/bottontitle.jsp"%>
</footer>
<script>
	function checkValue(){
		var form = document.joinForm;
		if(!form.userName.value){
			alert("이름을 입력하세요");
			return false;
		}
		if(!form.email.value){
			alert("이메일을 입력하세요.");
			return false;
		}
	}
	</script>
</html>