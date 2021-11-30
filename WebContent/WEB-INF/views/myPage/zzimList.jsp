
<%@page import="zzim.model.vo.zzim"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, product.model.vo.*"%>
	<%
		ArrayList<zzim> list = (ArrayList<zzim>)request.getAttribute("list");
		ArrayList<Photo> fList = (ArrayList<Photo>)request.getAttribute("fList");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order_ship {
	float: left; /*정렬*/
	width: 800px;
	height: 200px;
	margin-left: 30px;
	margin-top: 30px;
	font-size: 0;
	padding: 0 0 25px 25px;
	text-align: center;
	text-align: center;
}

.order_refer>li {
	padding: 0 0 10px 0px;
	border-bottom: 2px solid #cccccc;
	font-size: 22px;
	font-weight: bold;
	margin-top: 50px;
	margin-bottom: 30px;
	text-align: left;
}

.div_zzim {
	margin-top: 80px;
	margin-left: 40px;
	width: 100%;
	border: 2px solid #E2E2E2;
	border-radius: 10px;
}

.div_zzim_up {
	font-size: 15px;
	height: 22%;
	border-bottom: 1px solid #E2E2E2;
}

.div_zzim_down {
	font-size: 11px;
	height: 78%;
}

.zzim_up_table td {
	font-size: 11px;
	height: 50px;
	text-align: left;
	color: #A4A4A4;
}

.zzim_down_table {
	margin-top: 22px;
	margin-left: 15px;
}

.zzim_down_table td {
	margin-top: 15px;
	margin-left: 10px;
	height: 40px;
	text-align: left;
}

.zzimBtn {
	font-size: 11px;
	border-radius: 1px;
	height: 35px;
	border: thin;
}

.zzim_check_btn {
	font-size: 11px;
	float: left;
	margin-top: 20px;
	margin-left: 45px;
}

.zzim_btn_left {
	font-size: 11px;
	border-radius: 1px;
	height: 35px;
	border: thin;
}

.zzim_check_right {
	margin-right: -40px;
}

.zzim_btn_right {
	font-size: 11px;
	border-radius: 1px;
	height: 45px;
	border: thin;
	margin-top: 20px;
	margin-left: 5px;
	float: right;
}
</style>
</head>
<body>
	<%@ include file="../common/myPage.jsp"%>
	<div class="order_ship">
		<ul class="order_refer">
			<li>찜 리스트</li>
		</ul>
		<div class="div_zzim">
			
			<div class="div_zzim_up">
			
				<table class="zzim_up_table">
				
					<tr>
						<td style="width: 50px;"></td>
						<td style="width: 150px;">이미지</td>
						<td style="width: 220px;">상품 정보</td>
						<td style="width: 90px;">판매가</td>
						<td style="width: 90px;">배송비</td>
						<td style="width: 90px;">합계</td>
						<td style="width: 90px;">선택</td>
					</tr>
				</table>
			</div>
			<div class="div_zzim_down">
				<table class="zzim_down_table">
				<%if(fList.isEmpty() || list.isEmpty()){ %>
					<tr style="font-size: 30px;"><td style=" text-align: center;" width="771px;">찜 리스트가 없습니다.</td></tr>
				<%}else{ %>
					<%for(int i = 0; i < list.size(); i++){
						zzim p = list.get(i);
					%>
					
					<tr>
						<td rowspan="3" style="width: 40px;"><input id="checkZzim" type="checkbox" value="<%=p.getZzim_no() %>"/></td>
						<%for(int j = 0; j < fList.size(); j++){ %>
						<%  Photo ph = fList.get(j);%>
						<% if(ph.getProdNo() == p.getProd_no() && ph.getType() == 0){ %>
						<td rowspan="3" style="width: 150px; height: 180px;">
						<a class="proThumb"> <input type="hidden" value="<%= p.getProd_no() %>">
						<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>"
							width="130px" height="130px"></a></td>
							<%} %>
						<% } %>
					
						<td rowspan="3" style="width: 200px;"><%=p.getProd_name() %></td>
						<td rowspan="3" style="width: 90px;"><%=p.getPrice() %></td>
						<td rowspan="3" style="width: 90px;">2500</td>
						<td rowspan="3" style="width: 90px;"><%=p.getPrice()+2500 %>
							<input type="hidden" id="userId" value=""/>
						</td>
						<td><input type="button" value="주문하기" class="zzimBtn"></td>
					</tr>
					<tr>
						<td><input type="button" value="장바구니" class="zzimBtn"></td>
					</tr>
					<tr>
						<td><input type="button" value="삭제하기" class="zzimBtn"></td>
					</tr>
						<%} %>
					<%} %>
				</table>
			</div>
			
		</div>

		<div class="zzim_check_btn">
			<b>선택 상품을 </b> <input type="button" value="삭제하기"
				class="zzim_btn_left"> <input type="button" value="장바구니 담기"
				class="zzim_btn_left">
		</div>
		<div class="zzim_check_right">
			<input type="button" value="전체 상품 주문" class="zzim_btn_right">
			<input type="button" value="전체 상품 삭제" class="zzim_btn_right">
		</div>

	</div>

</body>
<script>
$('.proThumb').click(function(){
	var pNo = $(this).children().eq(0).val();
	location.href = "<%= request.getContextPath() %>/proDetail.bo?pNo=" + pNo;
});
$('.zzim_btn_left').click(function(){
	
});
</script>
</html>