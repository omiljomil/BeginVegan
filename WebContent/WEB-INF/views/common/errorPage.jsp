<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1 align="center"></h1>
	<div align="center">
		<input type="hidden" id="error"
			value="<%= request.getAttribute("msg")%>" />


	</div>
</body>
<script>
	$().ready(function(){
		alert($('#error').val());
		window.history.back();
		
	});
</script>
</html>