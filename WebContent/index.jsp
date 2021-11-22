<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h4 {
	text-align: center;
	margin-top: 80px;
}

.newproduct table {
	width: 950px;
	margin: 0 auto;
}

.newproduct table td {
	text-align: center;
}

.newproduct table td div {
	display: inline-block;
}

.newproduct .imgsell td {
	padding-top: 50px;
}

.imgfile {
	width: 200px;
	height: 200px;
	border: 1px solid black;
}

.mdtag {
	width: 350px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.mdtag button {
	padding: 5px 20px;
	background-color: transparent;
	text-transform: uppercase;
	font-weight: bold;
	border: 2px solid black;
	border-radius: 25px;
	position: relative;
	transition: all 0.3s;
	overflow: hidden;
}

.mdtag button:focus {
	outline: none;
}

.mdtag button::before {
	content: "";
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: orange;
	top: 0;
	right: 100%;
	transition: all 0.4s;
	z-index: -1;
	border-radius: 20px;
	border: 0px solid black;
}

.mdtag button:hover::before {
	transform: translateX(100%);
}

.mdtag button:hover {
	color: white;
}

.toparrow {
	display: scroll;
	position: fixed;
	bottom: 15px;
	right: 100px;
}

.toparrow>a {
	font-size: 30px;
	color: black;
}

.toparrow>a:hover {
	color: black;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../WEB-INF/views/common/header.jsp"%>

	</header>
	<%@ include file="WEB-INF/views/common/imgslide.jsp"%>

	<h4 style="margin-top: 80px;">신상품</h4>

	<div class="newproduct">
		<table>
			<tr class="imgsell">
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>가격</td>
				<td>가격</td>
			</tr>
			<tr class="imgsell">
				<td><div class="imgfile"></div></td>
				<td><div class="imgfile"></div></td>
				<td><div class="imgfile"></div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>가격</td>
				<td>가격</td>
			</tr>
		</table>
	</div>
	<h4 style="margin-top: 80px;">베스트 상품</h4>

	<div class="newproduct">
		<table>
			<tr class="imgsell">
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>가격</td>
				<td>가격</td>
			</tr>
			<tr class="imgsell">
				<td><div class="imgfile"></div></td>
				<td><div class="imgfile"></div></td>
				<td><div class="imgfile"></div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>가격</td>
				<td>가격</td>
			</tr>
		</table>
	</div>
	<h4 style="margin-top: 80px;">MD PICK</h4>

	<div class="newproduct">
		<div class="mdtag">
			<button value="#초보">#초보</button>
			<button value="#중수">#중수</button>
			<button value="#고수">#고수</button>
		</div>
		<table>
			<tr class="imgsell">
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
				<td style="margin: 0 auto"><div class="imgfile"></div></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>제목</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>가격</td>
				<td>가격</td>
				<td>가격</td>
			</tr>

		</table>
	</div>
	<footer>
		<%@ include file="WEB-INF/views/common/bottontitle.jsp"%>
	</footer>
	<div class="toparrow">
		<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>
</body>
</html>