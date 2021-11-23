<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.*,page.PageInfo"%>
<%
ArrayList<Notice> list=(ArrayList<Notice>)request.getAttribute("list");
PageInfo pi=(PageInfo)request.getAttribute("pi");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>공지사항 목록 페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	margin: 0 auto;
	font-family: sans-serif;
}

section a {
	color: black;
	text-decoration: none;
}

section {
	position: absolute;
	top: 330px;
	left: 840px;
}

#notice-title {
	font-size: 60px;
}

#route {
	color: #888;
	position: absolute;
	padding-left: 10px;
	width: 500px;
	left: 480px;
	font-size: 30px;
}

#route a {
	color: #888;
}

#route div {
	display: inline-block;
	padding-left: 10px;
}

#route a:hover {
	text-decoration: none;
	color: yellowgreen;
}

#search-box-title {
	border: 2px solid darkgray;
	width: 140px;
	height: 49px;
	text-align: center;
	font-size: 20px;
}

#search {
	position: relative;
	right: 500px;
	top: 90px;
}

#search-box-option {
	border: 1px solid darkslategrey;
	width: 200px;
	height: 45px;
	text-align: center;
	font-size: 20px;
	font-weight: 500;
	background-color: gray;
	color: rgb(242, 243, 241);
	border-radius: 5px;
}

#search-box-option option {
	background-color: white;
	color: black;
}

#search-box {
	width: 250px;
	height: 45px;
}

<!--
-->
#notice-table {
	position: absolute;
	top: 680px;
	left: 320px;
	width: 1250px;
	border: 1px solid darkgray;
}

#notice-table th {
	border: 1px solid darkgray;
}

#notice-table-topic th {
	border: 1px solid darkgary;
	text-align: center;
}

.notice-table-list th {
	font-size: 16px;
	color: black;
	border: 1px solid darkgray;
	height: 50px;
	text-align: center;
}

#paising {
	position: absolute;
	top: 1270px;
	left: 870px;
	display: flex;
	text-align: center;
	border-radius: 10px;
}

.paising-button {
	text-align: center;
	font-size: 30px;
	margin-right: 30px;
	border: none;
	background-color: white;
}

#paising-number:hover {
	background-color: yellowgreen;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<section>
		<span id="notice-title">공지사항</span>

		<div id="route">
			<div>
				<a href="<%=request.getContextPath() %>">홈</a>
			</div>
			<div>--></div>
			<div>
				<a href="<%=request.getContextPath() %>/community.me">커뮤니티</a>
			</div>
			<div>--></div>
			<div>
				<a href="<%=request.getContextPath()%>/noticeList.me">공지사항</a>
			</div>
		</div>

		<!-- <div id="search">
			<form action="#" method="#">
				<div id="search-box-bind">
					<select name="search-box-option" id="search-box-option">
						<option value="">전체 검색</option>
						<option value="">글 번호</option>
						<option value="">글 제목</option>
						<option value="">글 내용</option>
					</select> <input type="text" id="search-box">
			</form>
		</div> -->
		<!-- </div> -->
	</section>




	<table id="notice-table">
		<tr id="notice-table-topic">
			<th width="90px" height="50px">번호</th>
			<th width="600px">제목</th>
			<th width="200px">작성자</th>
			<th width="200px">작성일</th>
		</tr>
		<% if(list.isEmpty()){ %>
		<tr>
			<th colspan="5">존재하는 공지사항이 없습니다.</th>
		</tr>
		<%}else{ %>
		<% for(int i=0; i<list.size(); i++){ %>

		<tr class="notice-table-list">
			<th height="50px"><%=list.get(i).getNoticeNo() %></th>
			<th><%=list.get(i).getNoticeTitle() %></th>
			<th><%=list.get(i).getNoticeWriter()%></th>
			<th><%=list.get(i).getEnrollDate() %></th>
		</tr>
		<%	} %>
		<% } %>
	</table>

	<script>
        $(".notice-table-list th").mouseenter(function(){
        	$(this).css({'cursor':'pointer','text-decoration':'underline'});
        }).mouseout(function(){
        	$(this).css({'text-decoration':'none'});
        }).click(function(){
        	var num=$(this).parent().children().eq(0).text();
    		location.href='<%=request.getContextPath() %>/noticeDetail.me?me=' + num;
        });
     
        </script>

	<section id="paising">
		<!--맨 처음으로 가는 버튼 -->
		<button class="paising-button"
			onclick="location.href='<%=request.getContextPath()%>/noticeList.me?currentPage=1'">◀</button>

		<!-- 숫자버튼 -->
		<%for (int p=pi.getStartPage();p<=pi.getEndPage();p++){ %>
		<%if(p == pi.getCurrentPage()){  %>
		<button class="paising-button" id="paising-number">
			&nbsp;<%=p %>&nbsp;
		</button>
		<%} else{ %>
		<button class="paising-button" id="paising-number"
			onclick="location.href='<%=request.getContextPath()%>/noticeList.me?currentPage=<%=p %>'"><%=p %></button>
		<%} %>
		<%} %>

		<button class="paising-button"
			onclick="location.href='<%=request.getContextPath()%>/noticeList.me?currentPage=<%=pi.getMaxPage()%>'">▶</button>
	</section>
	<script>
        
      </script>




</body>
</html>