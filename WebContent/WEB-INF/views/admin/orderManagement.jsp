<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, manager.model.vo.OrderManager, java.text.DecimalFormat, page.PageInfo" %>
<%
	ArrayList<OrderManager> list = (ArrayList<OrderManager>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Begin Vegan</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	/* 회원 목록 */
	#Forbidden {display:table; height: 500px; text-align: center; vertical-align: middle; margin-left: auto; margin-right: auto;}
	p {display: table-cell; vertical-align: middle; text-align: center; font-size: 20px; margin-left: auto; margin-right: auto;}
	.layout {width:100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto; max-width: 1300px;}
	#space {height: 60px;}
 	#line2 {background: #C4C4C4; height: 2px; width: 1230px;}
 	#subject {font-weight: bold; height: 105px; text-align: center; font-size: 40px; padding: 20px;}
	#space4 {height: 30px;}
	#space5 {height: 45px;}
	#space6 {width: 1230px; height: 40px;}
	#space7 {height: 20px;}
	#search_space {text-align: center; height: 150px; background: #F8F8F8; width: 1230px; vertical-align: middle;}
	.order_search_subject {line-height: 30px; font-weight: bold; display:inline-block; height: 30px; text-align: center; vertical-align: middle; margin: 60px 5px 0px 0px;}
	.order_search_select {display:inline-block; height: 30px; text-align: center; vertical-align: middle; margin: 60px 5px 0px 5px;}
	.order_search_input {display:inline-block; height: 30px; text-align: center; vertical-align: middle; margin: 60px 5px 0px 5px;}
	.order_search_button {display:inline-block; height: 30px; text-align: center; vertical-align: middle; margin: 60px 0px 0px 5px;}
	select {width: 120px; height: 30px; border-radius: 0px; border: 1px solid #A4A4A4; margin: 0px; vertical-align: middle;}
	#order_search {border: 1px solid #a4a4a4; height: 30px; padding: 0px 5px 0px 5px;}
	#search_btn {
		width: 80px; height: 30px; background: #5E5E5E; color: white;
		border: 1px solid #5E5E5E; border-radius: 5px; font-weight: bold;
	}
	table {margin-left: auto; margin-right: auto;}
	.orderStatusChange {display: inline-block; vertical-align: middle; margin-right: 10px;}
	.orderStatusChangeButton {display: inline-block; vertical-align: middle;}
	#orderStatus {width: 120px; height: 30px;}
	#selectChange {
		width: 70px; height: 30px; background: #5E5E5E; color: white;
		border: 1px solid #5E5E5E; border-radius: 5px; font-weight: bold;
	}
	.tr-delete {width: 1230px;}
	input[type="checkbox"] {width: 15px; height: 15px;}
	#menu-search {text-align: center;}
	#list {text-align: center; width: 1230px;}
	#address {text-align: left;}
	
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
	#space2 {height: 105px; text-align: center;}
	#space3 {height: 70px; text-align: center;}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<% if(loginUser == null || !loginUser.getManager().equals("Y")) { %>
		<div class="layout" id="Forbidden"><p>권한이 없습니다.</p></div>
	<% } else { %>
		<!-- 회원 목록 -->
		<form action="<%= request.getContextPath() %>/searchOrderManagement.no" method="post" id="orderListForm">
			<div class="layout" id="space"></div>
			<div class="layout" id="subject">주문 목록 조회</div>
			<div class="layout" id="line2"></div>
			<div class="layout" id="space4"></div>
			<div class="layout" id="search_space">
				<div class="order_search_subject">주문검색</div><!-- 
				 --><div class="order_search_select">
					<select id="cond" name="cond">
						<option value="orderno">주문번호</option>
						<option value="prodname">상품명</option>
						<option value="orderprice">주문금액</option>
						<option value="orderdate">주문일</option>
						<option value="userid">주문아이디</option>
						<option value="receiver">수령인</option>
						<option value="address">주소</option>
						<option value="phone">전화번호</option>
						<option value="status">주문상태</option>
					</select> 
				</div><!--
				 --><div class="order_search_input">
				 	<input type="text" id="order_search" name="order_search">
				 </div><!--
				 --><div class="order_search_button">
				 	<input type="submit" id="search_btn" value="검색" onclick="user_search();">
				 </div>
			</div>
			<div class="layout" id="space5"></div>
		
			<div class="layout" id="space6">
				<div class="orderStatusChange">
					<select id="orderStatus" name="orderStatus">
						<option value="주문완료">주문완료</option>
						<option value="주문취소">주문취소</option>
						<option value="배송준비">배송준비</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						<option value="교환처리">교환처리</option>
						<option value="환불처리">환불처리</option>
					</select> 
				</div><!-- 
				 --><div class="orderStatusChangeButton">
					<input type="button" id="selectChange" value="변경">
				</div>
			</div>
			<div class="layout" id="space7"></div>
			<table id="list" class="table">
				<thead>
				<tr>
					<th width="40"><input type="checkbox" id="all" name="all" onclick="selectAll()"></th>
					<th width="90">주문번호</th>
					<th width="200">상품명</th>
					<th width="60">수량</th>
					<th width="100">주문금액</th>
					<th width="110">주문일</th>
					<th width="100">주문아이디</th>
					<th width="80">수령인</th>
					<th width="210">주소</th>
					<th width="140">전화번호</th>
					<th width="100">주문상태</th>
				</tr>
				</thead>
				<tbody>
				<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="11">존재하는 주문이 없습니다.</td>
					</tr>
				<% } else {	%>
					<% for(int i = 0; i < list.size(); i++) { %>
						<tr>
							<td>
								<input type="checkbox" name="order" id="order<%= list.size() - i %>" value="<%= list.get(i).getOrderNo() %>" onclick="selectOrder()">
							</td>
							<td><%= list.get(i).getOrderNo() %></td>
							<td><%= list.get(i).getProdName() %></td>
							<td><%= list.get(i).getAmount() %></td>
							<td>
								<% DecimalFormat formatter = new DecimalFormat("###,###"); %>
								<%= formatter.format(list.get(i).getOrderPrice()) + " 원" %>
							</td>
							<td><%= list.get(i).getOrderDate() %></td>
							<td><%= list.get(i).getUserId() %></td>
							<td><%= list.get(i).getReceiver() %></td>
							<td id="address"></td>
							<td><%= list.get(i).getPhone() %></td>
							<td><%= list.get(i).getStatus() %></td>
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
				$('#firstBtn').css('cursor', 'text');
			}
		</script>
		<!-- 이전 페이지로 -->
		<input type="button" id="beforeBtn"
			onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getCurrentPage() - 1 %>'"
			value="이전">
		<script>
			if(<%= pi.getCurrentPage() %> <= 1) {
				$('#beforeBtn').prop('disabled', true);
				$('#beforeBtn').css('cursor', 'text');
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
		<%  } %>
		<!-- 다음 페이지로 -->
		<input type="button" id="afterBtn"
			onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getCurrentPage() + 1 %>'"
			value="다음">
		<script>
			if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
				$('#afterBtn').prop('disabled', true);
				$('#afterBtn').css('cursor', 'text');
			}
		</script>
		<!-- 맨 끝으로 -->
		<input type="button" id="lastBtn"
			onclick="location.href='<%= request.getContextPath() %>/userManagement.no?currentPage=<%= pi.getMaxPage() %>'"
			value="끝">
		<script>
			if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
				$('#lastBtn').prop('disabled', true);
				$('#lastBtn').css('cursor', 'text');
			}
		</script>
	<% } %>
	</div>
	
		<script>
			var all = document.getElementById('all');
			var order = document.getElementsByName('order');
			
			// 전체선택 체크박스
			function selectAll() {
				if(all.checked == true) {
					for(var i = 0; i < order.length; i++) {
						order[i].checked = true;
					}
				} else {
					for(var i = 0; i < order.length; i++) {
						order[i].checked = false;
					}
				}
			}
			
			// 하나만 체크박스
			function selectOrder() {
				var count = 0;
				for(var i = 0; i < order.length; i++) {
					if(order[i].checked == true) {
						count++;
					}
				}
				
				if(count == order.length) {
					all.checked = true;
				} else {
					all.checked = false;
				}
			}
			
			// 선택 주문 변경 버튼
			$('#selectChange').on('click', function() {
				var bool = confirm('선택한 주문을 해당 상태로 변경하시겠습니까?');
				var order = document.getElementsByName('order');
				var check = 0;
				var count = 0;
				
				if(bool) {
					for(var i = 0; i < order.length; i++) {
						if(order[i].checked == true) {
							check++;
						}
					}
					
					if(check == 0) {
						alert('선택된 주문이 없습니다.');
						return false;
					} else {
						$('#orderListForm').attr('action', 'orderChangeManagement.no');
						$('#orderListForm').submit();
						alert('선택하신 주문을 변경하였습니다.');
						return true;
					}
				}
			});
		</script>
		
		<div class="layout" id="line"></div>
	<% } %>
	
	<div class="layout" id="space5"></div>
	
	<%@ include file="../common/bottontitle.jsp" %>
</body>
</html>