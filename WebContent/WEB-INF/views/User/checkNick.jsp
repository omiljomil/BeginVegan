<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="inputValue();">
	<b>닉네임 중복 검사</b>
	<br>
	<form action="<%= request.getContextPath() %>/checkNickServlet.me"
		id="nickCheckForm">
		<input type="text" id="inputNick" name="inputNick"> <input
			type="hidden" name="nickCheckValue" value="UnCheck" /> <input
			type="submit" value="중복확인" />
	</form>

	<br>

	<%
	Integer result = (Integer)request.getAttribute("result");
		if(result != null){
			if(result > 0){
	%>
	이미 사용 중인 닉네임 입니다.
	<% }else{ %>
	사용가능한 닉네임 입니다.
	<% 	} %>
	<%} %>
	<br>
	<br>

	<input type="button" id="usedNick" value="확인">
	<input type="button" id="cancel" value="취소" onclick="window.close();">
</body>
<footer>
	<%@ include file="../common/bottontitle.jsp"%>
</footer>
<script>
	function inputValue(){
		if(<%= result %> == null){
			document.getElementById('inputNick').value = opener.document.joinForm.nickname.value;
		}
		else{
			document.getElementById('inputNick').value = '<%= request.getAttribute("checkedNick") %>';
			
		}
	}
	
	
	
	document.getElementById('usedNick').onclick = function(){
		if(<%= result %> > 0 || <%= result %> == null){
			alert("중복확인을 해주세요.");
			
		}
		else{
		opener.document.joinForm.nickname.value = document.getElementById('inputNick').value;
		opener.document.joinForm.nickDuplication.value = "nickCheck";
		self.close();
		}
	}
</script>
</html>