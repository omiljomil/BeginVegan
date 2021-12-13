<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,User.model.vo.User,page.PageInfo"%>
<%
	ArrayList<User> list = (ArrayList)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Begin Vegan</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
/* 회원 목록 */
#Forbidden {
	display: table;
	height: 500px;
	text-align: center;
	vertical-align: middle;
	margin-left: auto;
	margin-right: auto;
}

p {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	font-size: 20px;
	margin-left: auto;
	margin-right: auto;
}

.layout {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 1300px;
}

#space {
	height: 60px;
}

#line2 {
	background: #C4C4C4;
	height: 2px;
	width: 1230px;
}

#subject {
	font-weight: bold;
	height: 105px;
	text-align: center;
	font-size: 40px;
	padding: 20px;
}

#space4 {
	height: 30px;
}

#space5 {
	height: 45px;
}

#space6 {
	width: 1230px;
	height: 40px;
}

#space7 {
	height: 20px;
}

#search_space {
	text-align: center;
	height: 150px;
	background: #F8F8F8;
	width: 1230px;
	vertical-align: middle;
}

#user_search {
	height: 30px;
	border: 1px solid #A4A4A4;
	padding: 5px;
}

.user_search_subject {
	line-height: 30px;
	font-weight: bold;
	display: inline-block;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin: 60px 5px 0px 0px;
}

.user_search_select {
	display: inline-block;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin: 60px 5px 0px 5px;
}

.user_search_input {
	display: inline-block;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin: 60px 5px 0px 5px;
}

.user_search_button {
	display: inline-block;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin: 60px 0px 0px 5px;
}

.user_allList_button {
	display: inline-block;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	margin: 60px 0px 0px 5px;
}

select {
	width: 120px;
	height: 30px;
	border-radius: 0px;
	border: 1px solid #A4A4A4;
	margin: 0px;
	vertical-align: middle;
}

#search_require {
	border: 1px solid #a4a4a4;
	padding: 0px 5px 0px 5px;
}

#search_btn {
	width: 80px;
	height: 30px;
	background: #5E5E5E;
	color: white;
	border: 1px solid #5E5E5E;
	border-radius: 5px;
	font-weight: bold;
}

#allList_btn {
	width: 80px;
	height: 30px;
	background: #5E5E5E;
	color: white;
	border: 1px solid #5E5E5E;
	border-radius: 5px;
	font-weight: bold;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	text-align: center;
}

#selectDelete {
	width: 135px;
	height: 40px;
	background: #5E5E5E;
	color: white;
	border: 1px solid #5E5E5E;
	border-radius: 5px;
	font-weight: bold;
}

.tr-delete {
	width: 1230px;
}

input[type="checkbox"] {
	width: 15px;
	height: 15px;
	margin: 5px;
}

#menu-search {
	text-align: center;
}

#userlist {
	text-align: center;
	width: 1230px;
}

#address {
	text-align: left;
}

.pagingArea input, button {
	background: white;
	width: 40px;
	height: 40px;
	font-size: 14px;
	color: black;
	border: 0px;
}

#choosen {
	font-weight: bold;
	border: 1px solid #ddd;
	background: white;
	cursor: text;
}

/* 하단 버튼 */
#space2 {
	height: 105px;
	text-align: center;
}

#space3 {
	height: 70px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<% if(loginUser == null || !loginUser.getManager().equals("Y")) { %>
		<div class="layout" id="Forbidden">
			<p>권한이 없습니다.</p>
		</div>
	<% } else { %>
		<!-- 회원 목록 -->
		<div class="layout" id="space"></div>
		<div class="layout" id="subject">회원 목록 조회
		</div>
		<div class="layout" id="line2"></div>
		<div class="layout" id="space4"></div>
		<form action="<%= request.getContextPath() %>/searchUserManagement.no"
			method="post" id="userListForm">
			<div class="layout" id="search_space">
				<div class="user_search_subject">회원검색</div>
				<!-- 
					 -->
				<div class="user_search_select">
					<select id="cond" name="cond">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="email">이메일</option>
						<option value="phone">휴대폰번호</option>
						<option value="enroll">가입일</option>
						<option value="manager">구분</option>
						<option value="status">상태</option>
					</select>
				</div>
				<!--
					 -->
				<div class="user_search_input">
					<input type="text" id="user_search" name="user_search">
				</div>
				<!--
					 -->
				<div class="user_search_button">
					<input type="submit" id="search_btn" value="검색">
				</div>
				<div class="user_allList_button">
					<input type="button" id="allList_btn" value="전체목록">
				</div>
			</div>
			<div class="layout" id="space5"></div>
			
			<div class="layout" id="space6">
				<input type="button" id="selectDelete" value="선택 회원 삭제"
					onclick="return userDelete();">
			</div>
			<div class="layout" id="space7"></div>
			<table id="userlist" class="table">
				<thead>
					<tr>
						<th width="60"><input type="checkbox" id="all" name="all"
							onclick="selectAll()"></th>
						<th width="70">번호</th>
						<th width="120">아이디</th>
						<th width="120">이름</th>
						<th width="200">이메일</th>
						<th width="170">휴대폰번호</th>
						<th width="130">가입일</th>
						<th width="120">구분</th>
						<th width="100">상태</th>
						<th width="130">탈퇴일</th>
					</tr>
				</thead>
				<tbody>
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="10">존재하는 회원이 없습니다.</td>
					</tr>
					<% } else {	%>
						<% for(int i = 0; i < list.size(); i++) { %>
							<tr>
								<td>
									<% if(list.get(i).getManager().equals("N") && list.get(i).getStatus().equals("Y")) { %>
										<input type="checkbox" name="user" id="user<%= list.size() - i %>" 
															value="<%= list.get(i).getUserId() %>" onclick="selectUser()">
									<% } %>
								</td>
								<td><%= list.get(i).getRnum() %></td>
								<td><%= list.get(i).getUserId() %></td>
								<td><%= list.get(i).getUserName() %></td>
								<td><%= list.get(i).getEmail() %></td>
								<td><%= list.get(i).getPhone() %></td>
								<td><%= list.get(i).getEnrollDate() %></td>
								<td>
									<% if(list.get(i).getManager().equals("Y")) { %>
										<%= "관리자" %>
									<% } else { %>
										<%= "일반회원" %>
									<% } %>
								</td>
								<td>
									<% if(list.get(i).getStatus().equals("Y")) { %>
										<%= "가입" %>
									<% } else { %>
										<%= "탈퇴" %>
									<% } %>
								</td>
								<td>
									<% if(list.get(i).getModifyDate() == null) { %>
										<%= "-" %>
									<% } else { %>
										<%= list.get(i).getModifyDate() %>
									<% } %>
								</td>
							</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
	
		</form>
	
		<div class="layout" id="space7"></div>
	
		<div class="pagingArea" align="center">
		<% if(list.isEmpty()) { %>
			<div class="layout" id="space7"></div>
		<% } else { %>
			<!-- 맨 처음으로 -->
			<input type="button" id="firstBtn"
				onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=1'"
				value="처음">
			<script>
				if(<%= pi.getCurrentPage() %> <= 1) {
					$('#firstBtn').prop('disabled', true);
					$('#firstBtn').css({'cursor':'text', 'color':'#bbb'});
				}
			</script>
			
			<!-- 이전 페이지로 -->
			<input type="button" id="beforeBtn"
				onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getCurrentPage() - 1 %>'"
				value="이전">
			<script>
				if(<%= pi.getCurrentPage() %> <= 1) {
					$('#beforeBtn').prop('disabled', true);
					$('#beforeBtn').css({'cursor':'text', 'color':'#bbb'});
				}
			</script>
			
			<!-- 숫자 버튼 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
				<% if(p == pi.getCurrentPage()) { %>
					<input type="button" id="choosen" disabled value="<%= p %>">
				<% } else { %>
					<input type="button" id="numBtn"
						onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= p %>'"
						value="<%= p %>">
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<input type="button" id="afterBtn"
				onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getCurrentPage() + 1 %>'"
				value="다음">
			<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
					$('#afterBtn').prop('disabled', true);
					$('#afterBtn').css({'cursor':'text', 'color':'#bbb'});
				}
			</script>
			
			<!-- 맨 끝으로 -->
			<input type="button" id="lastBtn"
				onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getMaxPage() %>'"
				value="끝">
			<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
					$('#lastBtn').prop('disabled', true);
					$('#lastBtn').css({'cursor':'text', 'color':'#bbb'});
				}
			</script>
		<% } %>
		</div>
		
		<script>
				var all = document.getElementById('all');
				var user = document.getElementsByName('user');
				
				// 전체선택 체크박스
				function selectAll() {
					if(all.checked == true) {
						for(var i = 0; i < user.length; i++) {
							user[i].checked = true;
						}
					} else {
						for(var i = 0; i < user.length; i++) {
							user[i].checked = false;
						}
					}
				}
				
				// 유저 체크박스
				function selectUser() {
					var count = 0;
					for(var i = 0; i < user.length; i++) {
						if(user[i].checked == true) {
							count++;
						}
					}
					
					if(count == user.length) {
						all.checked = true;
					} else {
						all.checked = false;
					}
				}
				
				// 선택 회원 삭제 버튼
				function userDelete() {
					var bool = confirm('선택한 회원을 정말 삭제하시겠습니까?');
					var user = document.getElementsByName('user');
					var check = 0;
					var count = 0;
					
					if(bool) {
						for(var i = 0; i < user.length; i++) {
							if(user[i].checked == true) {
								check++;
							}
						}
						
						if(check == 0) {
							alert('선택된 회원이 없습니다.');
							return false;
						} else {
							$('#userListForm').attr('action', 'userDeleteManage.no');
							$('#userListForm').submit();
							alert('선택하신 회원을 삭제 완료하였습니다.');
							return true;
						}
					}
				}
				
				$('#allList_btn').click(function() {
					location.href='<%=request.getContextPath() %>/userManagement.no';
				});
			</script>
	
		<div class="layout" id="line"></div>
	<% } %>

	<div class="layout" id="space5"></div>

	<%@ include file="../common/bottontitle.jsp"%>

</body>
</html>