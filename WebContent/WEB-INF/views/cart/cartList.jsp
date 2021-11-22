<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="cart.model.vo.Cart, java.util.ArrayList, java.text.DecimalFormat"%>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>

/* 정보수정 폼 */
[name=amountChange] {
	height: 30px;
	width: 100px;
	background: #6CB174;
	color: white;
	border-radius: 0px;
	border: none;
	margin-top: 5px;
	font-size: 14px;
}
/* 	input[type="button"] {height: 30px; background : white;	border : none; margin-top:10px;	margin-right:20px;} */
input[type="checkbox"] {
	margin: 15px;
	width: 13px;
	height: 13px;
	vertical-align: middle;
}

.layout {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 960px;
}

.layout2 {
	width: 100%;
	max-width: 1300px;
	margin-right: auto;
	margin-left: auto;
}

#space4 {
	height: 30px;
}

#space8 {
	height: 70px;
}

#space9 {
	height: 50px;
	width: 960px;
	padding: 5px 5px 5px 0px;
}

#space10 {
	height: 60px;
}

#space11 {
	height: 66px;
}

#space12 {
	height: 230px;
}

#cart_line {
	background: #C3C3C3;
	height: 2px;
	width: 960px;
}

#subject {
	font-weight: bold;
	height: 105px;
	text-align: center;
	font-size: 40px;
	padding: 20px;
}

#subject2 {
	font-weight: bold;
	width: 960px;
	height: 90px;
	font-size: 40px;
	padding: 20px;
}

#order_no {
	width: 960px;
	height: 90px;
	vertical-align: center;
	text-align: center;
}

#order_no1 {
	display: inline-block;
	vertical-align: center;
	font-size: 25px;
	font-weight: bold;
	color: #3C7F44;
	height: 40px;
	line-height: 40px;
	margin: 25px 40px auto auto;
}

#order_no_mark {
	display: inline-block;
	vertical-align: bottom;
	height: 40px;
	line-height: 40px;
	margin: 25px 40px auto 40px;
}

#order_no2 {
	display: inline-block;
	vertical-align: center;
	font-size: 25px;
	color: #7F7F7F;
	height: 40px;
	line-height: 40px;
	margin: 25px 40px auto 40px;
}

#order_no3 {
	display: inline-block;
	vertical-align: center;
	font-size: 25px;
	color: #7F7F7F;
	height: 40px;
	line-height: 40px;
	margin: 25px auto auto 40px;
}

.what-delete {
	display: inline-block;
	vertical-align: middle;
}

#what-delete1 {
	margin-right: 5px;
}

#what-delete2 {
	margin-left: 5px;
	margin-right: 5px;
}

[name$=delete] {
	border: 1px solid black;
	background: white;
	font-size: 13px;
	width: 100px;
	height: 30px;
}

#total_price_list {
	border: 3px solid #E0E0E0;
	width: 960px;
	height: 211px;
	text-align: center;
}

.total {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
}

#total_product_price {
	margin: auto 39px auto auto;
}

#total_price_bar {
	margin: 26px 39px 26px 39px;
	background-image: url("img/total_price_bar.png");
	background-attachment: fixed;
	width: 2px;
	height: 155px;
}

#total_shipping_price {
	margin: auto 39px auto 39px;
}

#total_payment_price {
	margin: auto auto auto 39px;
}

#tpp_name {
	font-size: 30px;
	color: #6CB174;
	font-weight: bold;
	text-align: center;
	margin-bottom: 33px;
}

#tpp_conts {
	font-size: 25px;
	text-align: center;
}

#tsp_name {
	font-size: 30px;
	color: #6CB174;
	font-weight: bold;
	text-align: center;
	margin-bottom: 33px;
}

#tsp_conts {
	font-size: 25px;
	text-align: center;
}

#tpmp_name {
	font-size: 30px;
	color: #3C7F44;
	font-weight: bold;
	text-align: center;
	margin-bottom: 33px;
}

#tpmp_conts {
	font-size: 30px;
	color: red;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}

[name=amount] {
	text-align: center;
	width: 40px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #ccc;
	margin: 0 auto;
	vertical-align: middle;
	padding: 2px;
}

[name=pbtn], [name=mbtn] {
	width: 30px;
	height: 30px;
	border: 1px solid #ccc;
	background: white;
	margin: 0 auto;
	vertical-align: middle;
}

#one_order {
	width: 80px;
	height: 25px;
	background: #3c7f44;
	color: white;
	border: 1px solid #3c7f44;
	font-size: 13px;
	margin-bottom: 5px;
}

#one_delete {
	width: 80px;
	height: 25px;
	background: white;
	color: black;
	border: 1px solid black;
	font-size: 13px;
}

#table-line {
	width: 960px;
	height: 5px;
	background: #7F7F7F;
}

#list {
	margin-left: auto;
	margin-right: auto;
	height: 40px;
	width: 960px;
	text-align: center;
}

#product {
	text-align: left;
	padding-left: 20px;
}

#list tr {
	border-bottom: 2px solid #CFCFCF;
}

#list td {
	height: 90px;
}

#list th {
	height: 45px;
}

#list tr input[type=checkbox] {
	border: 1px solid #a4a4a4;
	height: 30px;
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

.selectbtn {
	width: 960px;
	height: 66px;
	display: flex;
	justify-content: center;
	margin-bottom: 100px;
}

.selectbtn input {
	font-size: 25px;
	padding: 7px 30px;
	margin: 0 30px;
	font-weight: bold;
}

#continue_shopping {
	border: 1px solid #BEBEBE;
	background: #BEBEBE;
	color: white;
}

#continue_shopping:hover {
	border: 1px solid #3C7F44;
	background: #3C7F44;
}

#order_selected {
	border: 1px solid #BEBEBE;
	background: #BEBEBE;
	color: white;
}

#order_selected:hover {
	border: 1px solid #3C7F44;
	background: #3C7F44;
}

#order_all {
	border: 1px solid #BEBEBE;
	background: #BEBEBE;
	color: white;
}

#order_all:hover {
	border: 1px solid #3C7F44;
	background: #3C7F44;
}

table input:focus {
	outline: none;
}

table input:not ([name=amount], [name=pbtn], [name=mbtn] ) {
	border: 0px;
}

table input[name=total] {
	width: 100px;
	text-align: center;
}

table input[name=price] {
	width: 100px;
	text-align: center;
}

table input[name=prodName] {
	width: 200px;
	text-align: center;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<% if(loginUser != null) { %>
	<form action="<%=request.getContextPath() %>/order.me">
		<!-- 장바구니 -->
		<div class="layout" id="space4"></div>
		<div class="layout" id="subject2">장바구니</div>
		<div class="layout" id="cart_line"></div>
		<div class="layout" id="order_no">
			<div id="order_no1">01 장바구니</div>
			<!-- 
				-->
			<div id="order_no_mark">
				<img src="img/order_no_mark.png">
			</div>
			<!-- 
				-->
			<div id="order_no2">02 주문/결제</div>
			<!-- 
				-->
			<div id="order_no_mark">
				<img src="img/order_no_mark.png">
			</div>
			<!-- 
				-->
			<div id="order_no3">03 결제완료</div>
		</div>
		<div class="layout" id="cart_line"></div>
		<div class="layout" id="space8"></div>
		<div class="layout" id="table-line"></div>
		<table id="list">
			<tr>
				<th width="30"><input type="checkbox" name="all" id="all1"
					onclick="selectAll();"></th>
				<th width="300">상품정보</th>
				<th width="180">판매가</th>
				<th width="180">수량</th>
				<th width="180">배송비</th>
				<th width="180">합계</th>
				<th width="180">선택</th>
			</tr>
			<% if(list.isEmpty()) { %>
			<tr>
				<td colspan="7">등록된 장바구니 상품이 없습니다.</td>
			</tr>
			<% } else { %>
			<%
						for(int i = 0; i < list.size(); i++) { 
					%>
			<tr>
				<td><input type="checkbox" name="one"
					id="one<%= list.get(i).getCartNo() %>" onclick="selectOne();"></td>
				<td>
					<div id="product_detail">
						<input type="text" name="prodName"
							value="<%= list.get(i).getProdName() %>" readonly> <input
							type="hidden" name="prodNo"
							value="<%= list.get(i).getProdNo() %>"> <input
							type="hidden" name="userId"
							value="<%= list.get(i).getUserId() %>">
					</div>
				</td>
				<td>
					<div id="prod_price" style="display: inline-block;">
						<input type="text" name="price" id="price<%= i %>"
							value="<%= list.get(i).getPrice() %>" readonly>
					</div>
				</td>
				<td><input type="button" name="pbtn" id="minus<%= i %>"
					onclick="count('minus');" value="─">
				<!--
				        		 -->
					<input hidden="hidden"><input type="text"
					id="amount<%= i %>" name="amount" value="1"
					oninput="return handleOnInput(this);">
				<!--
								 -->
					<input type="button" name="mbtn" id="plus<%= i %>"
					onclick="count('plus');" value="┼"> <input type="button"
					name="amountChange" id="amountChange<%= i %>" value="수량변경">
				</td>
				<td><div id="prod_sp" style="display: inline-block;">기본배송</div></td>
				<td>
					<div id="prod_sum" style="display: inline-block;">
						<input type="text" name="total" id="total<%= i %>"
							value="<%= list.get(i).getTotal() %>" readonly>
					</div>
				</td>
				<td>
					<div>
						<input type="button" id="one_order" value="주문하기">
					</div>
					<div>
						<input type="button" id="one_delete" value="삭제">
					</div>
				</td>
			</tr>
			<% } %>
			<% } %>
		</table>
		<div class="layout2" id="space9">
			<input type="checkbox" name="all" id="all2" onclick="selectAllC();">
			<!-- 
				-->
			<div class="what-delete" id="what-delete1">
				<input type="button" id="check_delete" name="check_delete"
					value="선택상품삭제">
			</div>
			<!-- 
				-->
			<div class="what-delete" id="what-delete2">
				<input type="button" id="all_delete" name="all_delete" value="전체삭제">
			</div>
		</div>
		<div class="layout" id="space9"></div>
		<div class="layout" id="total_price_list">
			<div class="total" id="total_product_price">
				<div id="tpp_name" class="tpp">총 상품 금액</div>
				<div id="tpp_conts" class="tpp"></div>
			</div>
			<!-- 
				-->
			<div class="total" id="total_price_bar"></div>
			<!--
				-->
			<div class="total" id="total_shipping_price">
				<div id="tsp_name" class="tsp">총 배송비</div>
				<div id="tsp_conts" class="tsp">0원</div>
			</div>
			<!--
				-->
			<div class="total" id="total_price_bar"></div>
			<!--
				-->
			<div class="total" id="total_payment_price">
				<div id="tpmp_name" class="tpmp">총 결제 금액</div>
				<div id="tpmp_conts" class="tpmp"></div>
			</div>
		</div>
		<div class="layout" id="space10"></div>
		<div class="layout" id="space11">
			<div class="selectbtn">
				<input type="button" id="continue_shopping" value="쇼핑 계속하기">
				<input type="button" id="order_selected" value="선택 상품 주문"> <input
					type="submit" id="order_all" value="전체 상품 주문">
			</div>
		</div>
	</form>
	<div class="layout" id="space12"></div>

	<script>
			$("document").ready(function() {
				var all1 = document.getElementById('all1');
				var all2 = document.getElementById('all2');
				var one = document.getElementsByName('one');
				
				all1.checked = true;
				if(all1.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all2.checked = true;
				}
				
				var price = $('input[name=price]').val();
				var sum = $('input[name=total]').val();
				var amount = $('input[name=amount]').val();
				var tpp = parseInt(price) * parseInt(amount);
				
				console.log(price);
				console.log(amount);
				console.log(sum);
				
				$('#tpp_conts').text(priceToString(tpp) + "원");
				$('#tpmp_conts').text(priceToString(tpp) + "원");
				
				$('input[name=amountChange]').on('click', function() {
	// 				console.log($('#amount').val());
	// 				console.log($('#prod_price').text());
	// 				console.log($('#prod_sp').text());
	// 				console.log($('#prod_sum').text());
					
					var tppr = parseInt($('input[name=price]').val()) * parseInt($('input[name=amount]').val());
					
					$('#tpp_conts').text(priceToString(tppr) + "원");
					$('#tpmp_conts').text(priceToString(tppr) + "원");
					
					if(document.getElementById('amount').value.length == 0) {
						alert('수량을 입력해주세요');
						window.location.reload();
					}
				});
			});
			
			function priceToString(p) {
			    return p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}
		</script>

	<script>
			var all1 = document.getElementById('all1');
			var all2 = document.getElementById('all2');
			var one = document.getElementsByName('one');
			
			// 전체선택 체크박스
			function selectAll() {
				if(all1.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all2.checked = true;
				} else {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = false;
					}
					all2.checked = false;
				}
			}
			function selectAllC() {
				if(all2.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all1.checked = true;
				} else {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = false;
					}
					all1.checked = false;
				}
			}
			
			// 체크박스
			function selectOne() {
				var count = 0;
				
				for(var i = 0; i < one.length; i++) {
					if(one[i].checked == true) {
						count++;
					}
				}
				
				if(count == one.length) {
					all1.checked = true;
					all2.checked = true;
				} else {
					all1.checked = false;
					all2.checked = false;
				}
			}
			
			// 수량 입력 제한
			function handleOnInput(e) {
				var kor = /[ㄱ-ㅎ|ㅏ-ㅣ]/gi;
				var eng = /[a-zA-Z]/gi;
				var teuk = /[`~!@#$%^&*()_|+\-=?;:,.<>\{\}\[\]\\\/]/gi;
				var resultElement = document.getElementById('amount');
				var zero = /^[0]/;
				var defaultValue = "1";
				
	// 			if(teuk.test(resultElement.value) || eng.test(resultElement.value) || kor.test(resultElement.value)
	// 					|| resultElement.value == ' ' || isNaN(resultElement.value)) {
	// 				alert('숫자로 입력하셔야 합니다.');
	// 				resultElement.value = defaultValue;
	// 				return false;
	// 			} else if(zero.test(resultElement.value)) {
	// 				alert('1 이하는 입력할 수 없습니다.');
	// 				resultElement.value = defaultValue;
	// 				return false;
	// 			} else if(resultElement.value.length == 0) {
	// 				alert('수량을 입력하세요.');
	// 			}
				
				if(isNaN(resultElement.value)) {  
					alert("숫자로만 입력이 가능합니다.");  
					resultElement.value = "1"; 
					return false;  
				}
				return true;
			}
			
			// 버튼으로 수량 추가/감소
			function count(type)  {
				// 결과를 표시할 element
				var resultElement = document.getElementById('amount');
				
				// 현재 화면에 표시된 값
				var number = document.getElementById('amount').value;
				
				var defaultValue = "1";
				
				// 더하기/빼기
				if(type === 'plus') {
					number = parseInt(number) + 1;
				} else if(type === 'minus')  {
					number = parseInt(number) - 1;
				    if(number < 1) {
						alert('1부터 입력할 수 있습니다.');
						number = defaultValue;
					}
				}
				// 결과 출력
				resultElement.value = number;
				console.log(number);
			}
		</script>
	<script>
			$('#check_delete').on('click', function(e) {
				var bool = window.confirm("선택 상품을 삭제하시겠습니까?");
				var one = document.getElementsByName('one');
				var count = 0;
				
				if(bool) {
					location.href="<%=request.getContextPath()%>/CartcheckDelete.me";
				}
				for(var i = 0; i < one.lenght; i++) {
					if(one[i].checked == true) {
						count++;
					}
				}
				if(count == 0) {
					alert('선택한 상품이 없습니다.');
					e.preventDefault();
				}
			});
		</script>

	<% } %>
	<%@ include file="../common/bottontitle.jsp"%>
</body>
</html>