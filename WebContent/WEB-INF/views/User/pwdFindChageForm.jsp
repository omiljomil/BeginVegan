<%@page import="User.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String name = (String)request.getAttribute("name"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.idform {
	width: 880px;
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
	margin-left: 50px;
	padding: 6px;
	margin-right: 20px;
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
	<form action="<%= request.getContextPath() %>/pwdChageResult.me"
		method="post" name="Form" onsubmit="return checkValue()">
		<div class="idform">
			<h3>비밀번호 변경</h3>
			<div class="seartext">
				<div class="id_id">
					비밀번호 <input type="password" id="userPwd1" name="userPwd1"
						style="margin-left: 88px" /><label id="pwdCheck1"></label>
				</div>
				<div class="id_email">
					비밀번호 확인 <input type="password" id="userPwd2" name="userPwd2" /><label
						id="pwdCheck2"></label>
				</div>
				<input type="hidden" name="userName" value="<%= name %>" />

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
	 
	
	 
	 if(!form.userPwd1.value){
		 alert("비밀번호를 입력하세요.");
           return false;
	 }
	 
	 if(form.userPwd1.value != form.userPwd2.value ){
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
     } 
	 
}

$('#userPwd1').on('chage paste keyup',function(){
	var pw = $(this).val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length >20){
		$('#pwdCheck1').text("8자리 ~ 20자리 이내로 입력해주세요.");
		$('#pwdCheck1').css({'color':'red','float':'inline-block'});
		isPwdCheck = false;
	 }else if(pw.search(/\s/) != -1){
	 	 $('#pwdCheck1').text("비밀번호는 공백 없이 입력해주세요.");
			$('#pwdCheck1').css({'color':'red','float':'inline-block'});
			isPwdCheck = false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	 		 $('#pwdCheck1').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			$('#pwdCheck1').css({'color':'red','float':'inline-block'});
			isPwdCheck = false;
	 }else {
		console.log("통과"); 
		isPwdCheck = true;
		$('#pwdCheck1').text("안전한 비밀번호 입니다.");
		$('#pwdCheck1').css({'color':'green','float':'inline-block'});
	 }
});

$('#userPwd2').on('chage paste keyup',function(){
	if($('#userPwd2').val() !=$('#userPwd1').val()){
		$('#pwdCheck2').text("비밀번호가 다릅니다.");
		$('#pwdCheck2').css({'color':'red','float':'inline-block'});
	}else{
		$('#pwdCheck2').text("비밀번호가 같습니다.");
		$('#pwdCheck2').css({'color':'green','float':'inline-block'});
	}
});

</script>
</html>