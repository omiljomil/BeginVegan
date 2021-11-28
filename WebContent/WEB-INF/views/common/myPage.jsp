<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	 />
<style>
.sub_content {
	position: realative;
	width: 800px;
	margin: -100px auto;
	margin-left: 100px;
	min-height: 100%;
	padding: 100px 0;
	box-sizing: border-box;
}

.side_cont {
	width: 200px;
	height: 980px;
	margin-top: 50px;
	float: left;
}

.container_order {
	float: left; /*정렬*/
	width: 800px;
	height: 200px;
	margin-left: 80px;
	margin-top: 80px;
	font-size: 0;
	padding: 0 0 25px 25px;
	text-align: center;
	border: 1px solid #e3e3e3;
	border-top: 1px solid #999999;
	text-align: center;
}

.sub_depth_href {
	color: #cccccc;
	text-decoration: none;
}

li {
	list-style: none;
}

h2 {
	padding: 20px 0 10px 25px;
	border-bottom: 1px solid #cccccc;
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 30px;
}

.sub_menu_box .sub_depth1>li>a {
	display: block;
	padding: 10px 5px 6px 0px;
	font-size: 12px;
}

.sub_menu_title {
	margin-bottom: 20px;
}

.sub_depth1>li {
	margin-right: 10px;
	color: #6E6B6B;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!--  마이 페이지 좌측 메뉴 -->
	<div class="sub_content">
		<div class="side_cont">

			<div class="sub_menu_box">
				<h2 style="font-size: 22px; font-weight: bold;">마이페이지</h2>
				<ul class="sub_menu_mypage">
					<li class="sub_menu_title">나의 쇼핑 정보
						<ul class="sub_depth1">
							<li><a href="<%=request.getContextPath() %>/orderList.me"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 주문 목록/배송 조회</a></li>
							<li><a
								href="<%=request.getContextPath() %>/changeOrderList.me"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 취소/반품/교환 내역</a></li>
							<li><a href="<%=request.getContextPath() %>/zzim.me?uId=<%=loginUser.getUserId() %>"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 찜 리스트</a></li>
						</ul>
					</li>
					<li class="sub_menu_title">나의 활동
						<ul class="sub_depth1">
							<li><a href="<%=request.getContextPath() %>/insertQuestionForm.qs"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 문의하기</a></li>
							<li><a href="<%=request.getContextPath() %>/myQuestionList.qs?userId=<%= loginUser.getUserId() %>" class="sub_depth_href" class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 문의 내역 확인</a></li>
							<li><a href="#" class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 리뷰 관리</a></li>
						</ul>
					</li>
					<li class="sub_menu_title">나의 회원 정보
						<ul class="sub_depth1">

							<li><a href="<%=request.getContextPath() %>/userModify.me"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 회원 정보 변경</a></li>
							<li><a
								href="<%=request.getContextPath() %>/sp_AddressForm.me?userId=<%= loginUser.getUserId() %>"
								class="sub_depth_href"><i
									class="fa-solid fa-angle-right fa-xs"></i> 배송지 관리</a></li>

						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>