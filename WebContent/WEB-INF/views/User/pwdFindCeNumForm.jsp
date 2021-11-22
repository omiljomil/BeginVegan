<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String s = (String)session.getAttribute("Key");
    
    
    %>
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
	<form action="<%= request.getContextPath() %>/pwdFindchageForm.me"
		method="post" name="ceNumForm" onsubmit="return checkValue()">
		<div class="idform">
			<h3>인증번호 입력</h3>
			<div class="seartext">

				<div class="id_email" style="">
					인증번호 <input type="text" id="ceNum" name="ceNum" /><span
						id="ceNumText"></span> <input type="hidden" name="id"
						value="<%=request.getAttribute("id")%>" />
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
var form = document.ceNumForm;
var ceNumCheck = false;
	function checkValue(){
		 
		 if(!form.ceNum.value){
			 alert("인증번호를 입력하세요.");
	            return false;
		 }
		 else if(!ceNumcheck){
			 alert("인증번호를 확인해주세요.");
			 return false;
		 }else{
			 return true;
		 }
	}
	
	$('#ceNum').on('chage paste keyup',function(){
		
		if($(this).val() != "<%= s%>"){
			 $('#ceNumText').text("인증번호가 다릅니다.");
			 $('#ceNumText').css({'color':'red','display':'inline-block'});
			 ceNumCheck = false;
		 }else{
			 $('#ceNumText').text("인증번호가 동일합니다.");
			 $('#ceNumText').css({'color':'green','display':'inline-block'});
			 ceNumcheck = true;
		 }
	});
	
</script>
</html>