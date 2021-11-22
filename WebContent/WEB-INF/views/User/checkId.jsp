<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="inputValue();">
	<b>아이디 중복 검사</b>
	<br>
	<form action="<%= request.getContextPath() %>/checkIdServlet.me"
		id="idCheckForm">
		<input type="text" id="inputId" name="inputId"> <input
			type="hidden" name="idCheckValue" value="UnCheck" /> <input
			type="submit" value="중복확인" />
	</form>

	<br>

	<%
	Integer result = (Integer)request.getAttribute("result");
		if(result != null){
			if(result > 0){
	%>
	이미 사용 중인 아이디 입니다.
	<% }else{ %>
	사용가능한 아이디 입니다.
	<% 	} %>
	<%} %>
	<br>
	<br>

	<input type="button" id="usedId" value="확인">
	<input type="button" id="cancel" value="취소" onclick="window.close();">
</body>
<footer>
	<%@ include file="../common/bottontitle.jsp"%>
</footer>
<script>
	function inputValue(){
		if(<%= result %> == null){
			document.getElementById('inputId').value = opener.document.joinForm.userid.value;
		}
		else{
			document.getElementById('inputId').value = '<%= request.getAttribute("checkedId") %>';
			
		}
	}
	
	
	
	document.getElementById('usedId').onclick = function(){
		if(<%= result %> > 0 || <%= result %> == null){
			alert("중복확인을 해주세요.");
			
		}
		else{
		opener.document.joinForm.userid.value = document.getElementById('inputId').value;
		opener.document.joinForm.idDuplication.value = "idCheck";
		self.close();
		}
	}
</script>
</html>