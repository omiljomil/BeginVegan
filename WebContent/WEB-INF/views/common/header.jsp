<%@page import="User.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    User loginUser = (User)session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'poppins', snas-serif;
}

.links {
	max-width: 1000px;
	height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
}

.leftlinks>a {
	margin-left: 20px;
	font-size: 12px;
}

header a {
	text-decoration: none;
	color: #606060;
}

header a:hover {
	color: yellowgreen;
}

ul {
	list-style: none;
}

.logo {
	max-width: 1000px;
	height: 150px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.nav_items {
	height: 100%;
	line-height: 40px;
}

.nav_items .categorymenu {
	width: 1024px;
	margin: 0 auto;
	justify-content: flex-start;
}

.nav_items .categorymenu .category {
	display: flex;
	margin-bottom: 0;
}

.nav_items .categorymenu .category>li {
	position: relative;
	display: flex;
	align-content: center;
	padding: 0 15px;
	width: 150px;
	justify-content: center;
}

.nav_items .categorymenu .category .sub-menu {
	position: absolute;
	left: 0;
	top: 40px;
	line-height: 40px;
	width: 150px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	padding-left: 0;
	display: none;
	z-index: 10;
	background-color: rgba(255, 255, 255, 0.5);
	padding-bottom: 30px;
}

.sub-menu>li {
	padding: 0;
	text-align: center;
	padding-top: 10px;
}

.sub-menu>li:hover {
	background-color: #ddd;
}

.sub-menu>li:hover a {
	color: black;
	font-weight: bold;
	font-size: 21px;
}

.category>li>a::before {
	content: '';
	position: absolute;
	bottom: 0%;
	left: 0px;
	width: 100%;
	height: 2px;
	background: yellowgreen;
	display: block;
	-webkit-transform-origin: right top;
	-ms-transform-origin: right top;
	transform-origin: right top;
	-webkit-transform: scale(0, 1);
	-ms-transform: scale(0, 1);
	transform: scale(0, 1);
	-webkit-transition: transform 0.4s cubic-bezier(1, 0, 0, 1);
	transition: transform 0.4s cubic-bezier(1, 0, 0, 1);
}

.category>li>a:hover::before {
	-webkit-transform-origin: left top;
	-ms-transform-origin: left top;
	transform-origin: left top;
	-webkit-transform: scale(1, 1);
	-ms-transform: scale(1, 1);
	transform: scale(1, 1)
}

#adminPage:hover {
	cursor: pointer;
}

/* 헤더 부분 */
</style>


</head>
<body>
	<div id="#headmain">
		<header>
			<!-- 좌측 상단  -->
			<div class="links">
				<div class=leftlinks>
					<% if(loginUser==null) { %>
					<a href="<%=request.getContextPath() %>/loginForm.me"
						class="link_text">LOGIN</a> <a
						href="<%=request.getContextPath() %>/joinForm.me"
						class="link_text">JOIN</a>
					<% } else { %>
					<label for=""><%= loginUser.getUserName() %> <% if(loginUser.getManager().equals("Y")){ %>관리자
						<%} %>(님)</label> <a
						href="<%=request.getContextPath() %>/loginOutServlet.me"
						class="link_text">LOGOUT</a> <a
						href="<%=request.getContextPath() %>/mypagemain.me"
						class="link_text">MYPAGE</a>
					<% if(loginUser.getManager().equals("Y")) { %>
					<a href="<%=request.getContextPath() %>/userManagement.no"
						class="link_text">회원관리</a> <a
						href="<%=request.getContextPath() %>/orderManagement.no"
						class="link_text">주문관리</a>
					<% } %>
					<% } %>
				</div>

				<!-- 우측 상단 -->
				<div class=rightlinks>
					<input type="text" maxlength="225" tabindex="1" /> <i
						class="bi bi-search"></i>
					<% if(loginUser==null) { %>
					<a href="#" id="basket"><i class="bi bi-basket2-fill"></i></a>
					<script>
						$('#basket').on('click', function() {
							alert('로그인을 해야 이용 가능합니다.');
							$(this).attr('href', '<%=request.getContextPath() %>/loginForm.me');
						});
					</script>
					<% } else { %>
					<a href="<%=request.getContextPath() %>/cartList.me"><i
						class="bi bi-basket2-fill"></i></a>
					<% } %>
				</div>
			</div>
			<!-- img -->
			<div class="logo">
				<a href="<%= request.getContextPath() %>"><img
					src="<%=request.getContextPath() %>/img/logo.png" /></a>
			</div>



			<!--  nav -->
			<nav>
				<div class="nav_items">
					<div class="categorymenu">
						<ul class="category">
							<li class="fir"><a href="#" id="ca"><i
									class="bi bi-list"></i>카테고리</a>
								<ul class="sub-menu">
									<li><a
										href="<%= request.getContextPath() %>/productList.do">전체</a></li>
									<li><a href="#">비건</a></li>
									<li><a href="#">락토</a></li>
									<li><a href="#">오보</a></li>
									<li><a href="#">락토오보</a></li>
									<li><a href="#">폴로</a></li>
									<li><a href="#">페스코</a></li>
									<li><a href="#">플렉시테리안</a></li>
								</ul></li>
							<li><a href="#">신상품</a></li>
							<li><a href="#">베스트상품</a></li>
							<li><a href="<%= request.getContextPath() %>/community.me">커뮤니티</a></li>
							<%--관리자로 로그인시 상품관리 탭 보이게 하기 --%>
							<%if(loginUser != null){ %>
							<%if(loginUser.getManager().equals("Y")){ %>
							<li><a
								href="<%= request.getContextPath()%>/ManagerProductList.pr">상품관리</a></li>
							<% } %>
							<% } %>
						</ul>
					</div>
				</div>
			</nav>
		</header>
	</div>
</body>
<script>
	$('.fir').mouseover(function(){
		$(this).find('.sub-menu').stop().slideDown(500);
	}).mouseout(function(){
		$(this).find('.sub-menu').stop().slideUp(500);
	});

</script>
</html>