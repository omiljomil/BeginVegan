<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 220px;
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
					<tr>
						<td rowspan="3" style="width: 40px;"></td>
						<td rowspan="3" style="width: 150px;">사진</td>
						<td rowspan="3" style="width: 200px;">상품명</td>
						<td rowspan="3" style="width: 90px;">판매가</td>
						<td rowspan="3" style="width: 90px;">배송비</td>
						<td rowspan="3" style="width: 90px;">합계</td>
						<td><input type="button" value="주문하기" class="zzimBtn"></td>
					</tr>
					<tr>
						<td><input type="button" value="장바구니" class="zzimBtn"></td>
					</tr>
					<tr>
						<td><input type="button" value="삭제하기" class="zzimBtn"></td>
					</tr>
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
</html>