<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order {
	border-bottom: 1px solid #e3e3e3;
	padding: 15px 0 15px 10px;
	text-align: left;
}

.orderSub {
	margin: 20px 0 10px 10px;
	font-size: small;
	text-align: center;
}

.h4 {
	font-size: medium;
	padding-right: 10px;
	font-weight: 1000;
}

.h5 {
	font-size: small;
}

#rhdqor {
	border-right-color: white;
}

#number {
	font-size: x-large;
	font-weight: bold;
}
/* 주문 처리 현황 */
.zzim_title>li {
	padding: 0 0 10px 0px;
	border-bottom: 2px solid #cccccc;
	font-size: 22px;
	font-weight: bold;
	margin-top: 50px;
	margin-bottom: 30px;
	text-align: left;
}

.zzimkit {
	font-size: xx-small;
	float: right;
	margin-top: 10px;
}

#zzim_cont {
	font-size: 12px;
	text-align: left;
	padding-left: 15px;
}

.zzim_img {
	float: left;
	margin-right: 20px;
}

p {
	margin-top: 10px;
	font-size: small;
	text-align: left;
}

.look_title>li {
	padding: 0 0 10px 0px;
	border-bottom: 2px solid #cccccc;
	font-size: 22px;
	font-weight: bold;
	margin-top: 50px;
	margin-bottom: 30px;
	text-align: left;
}

#look_cont {
	font-size: 12px;
	text-align: left;
	padding-left: 15px;
}
</style>
</head>
<body>
	<%@ include file="../common/myPage.jsp"%>

	<div class="container_order">
		<div class="order">
			<span class="h4" style="font-size: 16px; font-weight: bold;">주문
				처리 현황</span><span class="h5" style="font-size: 13px;">(최근 3개월 기준)</span>
		</div>
		<div class="orderSub">
			<table class="order_table">
				<tr>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">입금
						대기</td>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">결제
						완료</td>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">상품
						준비중</td>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">배송중</td>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">배송
						완료</td>
					<td width="105" height="40" style="border-right: 1px solid #E2E2E2">구매
						확정</td>
					<td id="rhdqor" width="60" height="20">· 취소</td>
					<td width="60" height="30">0건</td>
				</tr>
				<tr>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="number" style="border-right: 1px solid #E2E2E2">0</td>
					<td id="rhdqor" width="60" height="40">· 교환</td>
					<td>0건</td>
				</tr>
				<tr>
					<td id="rhdqor"></td>
					<td id="rhdqor"></td>
					<td id="rhdqor"></td>
					<td id="rhdqor"></td>
					<td id="rhdqor"></td>
					<td></td>
					<td id="rhdqor" width="60" height="40">· 반품</td>
					<td>0건</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<div class="zzim">
			<ul class="zzim_title">
				<li>찜키트 상품<input type="button"
					onclick="location.href='<%=request.getContextPath() %>/zzim.me';"
					class="zzimkit" id="zzimkit" value="전체 보기 >"></li>
			</ul>
			<table>
				<tr>
					<td rowspan="3" width="150px" height="40px"
						style="border: 1px solid #E2E2E2"></td>
					<td id="zzim_cont" width="100px" height="50px">날짜</td>
				</tr>
				<tr>
					<td id="zzim_cont" width="100px" height="50px">상품 명</td>
				</tr>
				<tr>
					<td id="zzim_cont" width="100px" height="50px">가격/수량</td>
				</tr>
			</table>
			<table>
				<tr>
					<td rowspan="3" width="150px" height="40px"
						style="border: 1px solid #E2E2E2"></td>
					<td id="zzim_cont" width="100px" height="50px">날짜</td>
				</tr>
				<tr>
					<td id="zzim_cont" width="100px" height="50px">상품 명</td>
				</tr>
				<tr>
					<td id="zzim_cont" width="100px" height="50px">가격/수량</td>
				</tr>
			</table>
		</div>


		<div class="look">
			<ul class="look_title">
				<li>최근 본 상품</li>
			</ul>
			<table>
				<tr>
					<td width="200px" height="130px"
						style="border-right: 1px solid #E2E2E2"></td>
					<td width="200px" height="130px"
						style="border-right: 1px solid #E2E2E2"></td>
					<td width="200px" height="130px"
						style="border-right: 1px solid #E2E2E2"></td>
					<td width="200px" height="130px"
						style="border-right: 1px solid #E2E2E2"></td>
				</tr>
				<tr>
					<td id="look_cont" width="150px" height="40px">상품 명</td>
					<td id="look_cont" width="150px" height="40px">상품 명</td>
					<td id="look_cont" width="150px" height="40px">상품 명</td>
					<td id="look_cont" width="150px" height="40px">상품 명</td>
				</tr>
				<tr>
					<td id="look_cont" width="150px" height="20px">가격</td>
					<td id="look_cont" width="150px" height="20px">가격</td>
					<td id="look_cont" width="150px" height="20px">가격</td>
					<td id="look_cont" width="150px" height="20px">가격</td>
				</tr>
			</table>
		</div>



	</div>



</body>

</html>