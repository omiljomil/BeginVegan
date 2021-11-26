<%@page import="question.model.vo.Question"%>
<%@page import="User.model.vo.Shpping"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order_ship {
	float: left; /*정렬*/
	width: 1000px;
	margin: 70px 30px;
}

.order_ship h4 {
	margin-left: 50px;
}

.shippingTitle {
	width: 900px;
	height: 70px;
	margin: 10px 50px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

.sp_title {
	width: 350px;
}

.regi_Btn {
	width: 100px;
	height: 30px;
}

.shippingTable {
	border-top: 2px solid #909090;
	border-bottom: 2px solid #909090;
	width: 900px;
	margin: 30px auto;
	padding-top: 25px;
}

.shippingTable th {
	border-bottom: 1px solid #E2E2E2;
	padding: 20px 0px;
}

#insertShpping {
	border-style: none;
	background-color: yellowgreen;
	color: white;
}

#de_in input {
	background-color: white;
	padding: 5px;
	margin-left: 3px;
	border: 1px solid black;
}

#de_in input:hover {
	font-size: 17px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../common/myPage.jsp"%>
	<div class="order_ship">
		<h4 align="left">문의 내역</h4>

		<div class="shippingTitle">
			<div class="sp_title">
				회원님의 문의 내역입니다.
			</div>
		</div>
		<table class="shippingTable">
			<tr>
				<th width="100px;">번호</th>
				<th width="400px;">제목</th>
				<th width="150px;">작성자</th>
				<th width="150px;">작성일</th>
			</tr>
			<% if(list.isEmpty()){ %>
			<tr align="center">
				<td colspan="5">문의사항이 없습니다.</td>
			</tr>
			<%}else{ %>
				
				<%for(Question q : list){ %>
				<tr>
					<td><%=q.getQst_no() %></td>
					<td><%=q.getQst_title() %><input type="hidden" value="Y"/></td>
					<td><%=q.getUser_id()%></td>
					<td><%=q.getEnroll_date() %> <input type="hidden" value="<%= q.getQst_no()%>"/></td>
					
				</tr>
				<%} %>
			<%} %>
		</table>	</div>
</body>
<script>
	$('.shippingTable td').mouseenter(function(){
		$(this).parent().css({'background':'darkgray','cursor':'pointer'});
	}).mouseout(function(){
		$(this).parent().css({'background':'none'});
	}).click(function(){
		var qId = $(this).parent().children().eq(3).children().val();
				location.href='<%= request.getContextPath() %>/questionDetailForm.qs?qId=' + qId;
			
		});
</script>
</html>