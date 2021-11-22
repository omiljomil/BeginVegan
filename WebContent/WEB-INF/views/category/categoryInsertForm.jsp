<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>

	</header>
	<%@ include file="/WEB-INF/views/common/imgslide.jsp"%>

	<form action="<%=request.getContextPath()%>/categoryInsert.ci"
		method="POST" name="f">

		<table border=1 width=300 align="center">

			<CAPTION ALIGN="TOP">카테고리등록</CAPTION>

			<tr>

				<td bgcolor="yellow"><b>카테고리 코드</b></td>

				<td><input type=text name="code" maxlength=8></td>

			</tr>

			<tr>

				<td bgcolor="yellow"><b>카테고리 이름</b></td>

				<td><input type=text name="cname"></td>

			</tr>

			<tr>

				<td colspan=2 align="center" bgcolor="#FFCC00"><input
					type=submit value="등록"> <input type=reset value="취소">

				</td>

			</tr>

		</table>

	</form>

	<footer>
		<%@ include file="/WEB-INF/views/common/bottontitle.jsp"%>
	</footer>
	<div class="toparrow">
		<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>
</body>
</html>