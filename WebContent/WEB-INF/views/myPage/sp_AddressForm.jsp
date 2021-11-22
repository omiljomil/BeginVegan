<%@page import="User.model.vo.Shpping"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	ArrayList<Shpping> list = (ArrayList<Shpping>)request.getAttribute("list");
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
		<h4 align="left">배송지 목록</h4>

		<div class="shippingTitle">
			<div class="sp_title">
				회원님의 배송지 목록입니다.<br> 자주 쓰는 배송지를 편리하게 관리 하세요!
			</div>
			<div>
				<button class="regi_Btn" id="insertShpping">배송지 등록</button>
			</div>
		</div>
		<table class="shippingTable">
			<tr>
				<th width="120px">배송지</th>
				<th width="330px">주소</th>
				<th width="110px">연락처</th>
				<th width="100px">수정 - 삭제</th>
			</tr>
			<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="4" align="center" style="padding: 50px">등록된 배송지가
					없습니다.</td>
			</tr>
			<%}else{ %>
			<%for(Shpping s : list){ %>
			<tr>
				<td><%=s.getAlias() %> <%if(s.getBasics().equals("Y")){ %> <input
					type="hidden" id="ship_no" value="<%= s.getShip_no()%>" />
					<div style="font-size: 10px; color: skyblue;">기본 배송지</div> <%} %></td>
				<td><%=s.getPostal_code() %> <br><%=s.getAddress() %> <br>
					<%=s.getDe_address() %></td>
				<td><%=s.getSp_phone() %></td>
				<td id="de_in"><input type="button" value="수정"
					onclick="UpdateShppingList(<%=s.getShip_no()%>);" /> <input
					type="button" value="삭제"
					onclick="deleteShppingList(<%=s.getShip_no()%>);" /></td>
			</tr>
			<%} %>
			<%} %>
		</table>
	</div>
</body>
<script>
	$('#insertShpping').on('click',function(){
		window.open('insertShppingForm.me?userId=<%= loginUser.getUserId()%>','insertShppingForm','width=500,height=600');
	});
	
	 function deleteShppingList(no){
		var bool = confirm("정말 삭제하시겠습니까?");
		if(bool){
			$.ajax({
				url:'<%= request.getContextPath() %>/deleteShppingList.me',
				data:{ship_no:no},
				success:function(data){
					alert("배송지가 정상적으로 삭제되었습니다.")
					window.location.reload();
				},
				error:function(data){
					
				}
				
			});
		}
	}
	 function UpdateShppingList(no){
				window.open('updateShppingForm.me?Ship_no='+no,'insertShppingForm','width=500,height=600');
			};
			
		
	 
	
</script>
</html>