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

.seartext .id_name, .id_email, .id_id {
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
	margin: 30px auto;
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
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<form action="<%= request.getContextPath() %>/pwdFindEmail.me"
		method="post" name="Form" onsubmit="return checkValue()">
		<div class="idform">
			<h3>비밀번호 찾기</h3>
			<div class="seartext">
				<div class="id_id">
					아이디 <input type="text" id="userId" name="userId" />
				</div>
				<div class="id_email">
					이메일 <input type="text" id="email" name="email" />
				</div>

			</div>
			<div class="searchbtn">
				<button type="submit">다음</button>
				<button type="button" style="background: #E2E2E2; color: black;"
					onclick="location.href='<%=request.getContextPath()%>/loginForm.me'">취소</button>
			</div>
		</div>
	</form>
</body>
<footer>
	<%@ include file="../common/bottontitle.jsp"%>
</footer>
<script>
	function checkValue(){
		 var form = document.Form;
		 
		
		 
		 if(!form.userId.value){
			 alert("아이디를 입력하세요.");
	            return false;
		 }
		 if(!form.email.value){
			 alert("이메일을 입력하세요.");
	            return false;
		 }
		 
	}
</script>
</html>