<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="notice.model.vo.Notice ,java.sql.Date"%>
<%
 Notice n=(Notice)request.getAttribute("notice");
  String title=n.getNoticeTitle();
 String content=n.getNoticeContent();
 Date date=n.getEnrollDate();
 String userName=n.getNoticeWriter();
  int no=(int)n.getNoticeNo(); 

 
 %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
<title>공지사항 상세 페이지</title>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0 auto;
	font-family: sans-serif;
}

section {
	margin-top: 100px;
}

#notice-title {
	margin-left: 140px;
	font-size: 70px;
}

#notice-route {
	position: relative;
	display: flex;
	justify-content: right;
	bottom: 100px;
	right: 150px;
	font-size: 29px;
	color: gray;
}

#notice-route a {
	text-decoration: none;
	color: gray;
	font-size: 29px;
}

#notice-route a:hover {
	color: yellowgreen;
}

#notice-list {
	box-sizing: border-box;
	margin-top: 60px;
}

#notice-table {
	position: relative;
	left: 150px;
	height: 100px;
	border: 2px solid darkgray;
}

#notice-table th {
	text-align: center;
	border: 2px solid darkgray;
}

#notice-date {
	text-align: center;
	width: 450px;
	height: 35px;
	border: 1px solid darkgray;
	margin-left: 150px;
}

#notice-date span {
	margin-right: 60px;
	font-size: 18px;
}

#notcie-content {
	border: 2px solid grey;
	width: 1100px;
	height: 500px;
	margin-top: 70px;
	margin-left: 150px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#next-or-back {
	position: relative;
	padding-left: 150px;
	top: 150px;
}

#next-or-back a {
	text-decoration: none;
	color: black;
}

#next-or-back th {
	border: 2px solid darkgray;
	text-align: center;
}

#next-or-back a:hover {
	color: rgb(4, 88, 4);
}

#go-button {
	position: relative;
	width: 80px;
	left: 800px;
	top: 300px;
}

#delete-button, #modify-button, #go-button {
	text-decoration: none;
	font-size: 18px;
	font-weight: 800;
	color: gray;
}

#delete-button:hover, #modify-button:hover, #go-button:hover {
	color: yellowgreen;
	text-decoration: none;
}

#delete-button {
	width: 65px;
	position: absolute;
	top: 1450px;
	left: 1235px;
}

#modify-button {
	width: 65px;
	position: absolute;
	top: 1450px;
	left: 1150px;
}

#cke_content {
	margin-top: 80px;
	margin-left: 150px;
	width: 1000px;
}
</style>


</head>
<body>

	<!--  헤더 부분 -->
	``
	<%@ include file="../common/header.jsp"%>

	<section>
		<div id="notice">
			<span id="notice-title">공지사항</span>
			<div id="notice-route">
				<span><a href="#">홈</a></span> <span>-></span> <span><a
					href="#">커뮤니티</a></span> <span>-></span> <span><a href="#">공지사항</a></span>
			</div>
		</div>
		<form action="<%= request.getContextPath() %>/noticeUpdate.me"
			method="post" id="detailForm">
			<div id="notice-list">
				<table id="notice-table">
					<tr>
						<th width="130px">제목</th>
						<th width="440px"><input type="hidden" size="50" name="title"
							value="<%=title%>"><%=title %></th>
					</tr>
					<tr>
						<th>작성자</th>
						<th colspan="3"><%=userName %><input type="hidden" size="50"
							name="writer" value="<%=userName %>"></th>
					</tr>
				</table>
				<div id="notice-date">
					작성일 : <input type="hidden" name="date" value="<%=date%>"><%=date %></div>
				<input type="hidden" name="no" value="<%=no %>" id="num"> <input
					type="hidden" size="50" name="writer" value="<%=userName %>">
			</div>


			<!--  <img src="#" alt="이미지사진"><br> -->
			<div id="notice-content">
				<textarea id="content" name="content" cols="140" rows="21"
					style="resize: none;" readonly="readonly"><%=content%></textarea>
			</div>

			<script type="text/javascript">
         
		     CKEDITOR.replace('content'
		                , {height: 500  
		                 });
		  </script>


			<%if (loginUser!=null&&loginUser.getUserName().equals("운영자")){ %>
			<button type="submit" id="modify-button" class="system">
				<!-- onclick="location.href='update.me'" -->
				수정
			</button>
			<button type="button" id="delete-button" class="system"
				onclick="deleteNotice();">삭제</button>
			<%} %>
		</form>


		<div id="next-or-back">

			<table>
				<tr>
					<th width="200px" height="40px"><a href="#">이전 글</a></th>
					<th width="500px;"><a href="#"></a></th>
				</tr>

				<tr>
					<th height="40px"><a href="#">다음 글</a></th>
					<th><a href="#"></a></th>
				</tr>
			</table>
		</div>

		<button type="button" id="go-button"
			onclick="location.href='<%=request.getContextPath()%>/noticeList.me'">목록</button>
	</section>
	<script>
    function deleteNotice(){
    	var bool= confirm("정말삭제하시겠습니까?");
		if(bool){
		 $('#detailForm').attr('action','noticeDelete.me');
		 $('#detailForm').submit();
		}    	
    }
    </script>


</body>
</html>