<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cart.model.vo.Cart, java.util.ArrayList, product.model.vo.*, material.model.vo.*" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	ArrayList<Photo> fList = (ArrayList<Photo>)request.getAttribute("fList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Begin Vegan</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
	
	/* 정보수정 폼 */
	[name=amount_change] {
		height: 30px; width: 100px; background: #3B9E3E; color:white;
		border-radius: 0px; border: none; margin-top: 5px; font-size: 14px;
	}
/* 	input[type="button"] {height: 30px; background : white;	border : none; margin-top:10px;	margin-right:20px;} */
 	input[type="checkbox"] {margin: 10px; width: 13px; height: 13px; vertical-align: middle;}
	#all2 {margin: 13px;}
	.layout {width:100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto; max-width: 1100px;}
	.layout2 {width:100%; max-width: 1300px; margin-right: auto; margin-left: auto;}
	#space1 {height: 10px;}
	#space4 {height: 30px;}
	#space8 {height: 70px;}
	#space9 {height: 50px; width: 1100px; padding: 5px 5px 5px 0px;}
	#space10 {height: 60px;}
	#space11 {height: 66px;}
	#space12 {height: 230px;}
 	#cart_line {background: #C3C3C3; height: 2px; width: 1100px;}
	#subject {font-weight: bold; height: 105px; text-align: center; font-size: 40px; padding: 20px;}
	#subject2 {font-weight: bold; width: 1100px; height: 90px; font-size: 40px; padding: 20px;}
	
	#order_no {width: 1100px; height: 90px; vertical-align: center; text-align: center;}
	#order_no1 {display: inline-block; vertical-align: center; font-size: 25px; font-weight: bold; color: #3C7F44; height: 40px; line-height: 40px; margin: 25px 40px auto auto;}
	#order_no_mark {display: inline-block; vertical-align: bottom; height: 40px; line-height: 40px; margin: 25px 40px auto 40px;}
	#order_no2 {display: inline-block; vertical-align: center; font-size: 25px; color: #7F7F7F; height: 40px; line-height: 40px; margin: 25px 40px auto 40px;}
	#order_no3 {display: inline-block; vertical-align: center; font-size: 25px; color: #7F7F7F; height: 40px; line-height: 40px; margin: 25px auto auto 40px;}
	.what-delete {display: inline-block; vertical-align: middle;}
	#what-delete1 {margin-right: 5px;} 
	#what-delete2 {margin-left: 5px; margin-right: 5px;}
	[name$=delete] {border: 1px solid black; background: white; font-size: 13px; width: 100px; height: 30px;}
	#total_price_list {border: 3px solid #E0E0E0; width: 1100px; height: 211px; text-align: center;}
	.total {display: inline-block; text-align: center; vertical-align: middle;}
	#total_product_price {margin: auto 53px auto auto;}
	#total_price_bar {margin: 25px 53px 25px 53px; background-image: url("img/total_price_bar.png");
						background-attachment: fixed; width: 2px; height: 155px;}
	#total_shipping_price {margin: auto 53px auto 53px;}
	#total_payment_price {margin: auto auto auto 53px;}
	#tpp_name {font-size: 30px; color: #6CB174; font-weight: bold; text-align: center; margin-bottom: 20px;}
	#tpp_conts {font-size: 25px; text-align: center;}
	#tsp_name {font-size: 30px; color: #6CB174; font-weight: bold; text-align: center; margin-bottom: 20px;}
	#tsp_conts {font-size: 25px; text-align: center;}
	#tpmp_name {font-size: 30px; color: #3C7F44; font-weight: bold; text-align: center; margin-bottom: 20px;}
	#tpmp_conts {font-size: 30px; color: red; font-weight: bold; text-align: center; vertical-align: middle;}
	[name=amount] {text-align:center; width: 40px; height: 30px; font-size: 14px; border: 1px solid #ccc; margin: 0 auto; vertical-align: middle; padding: 2px;}
	[name=pbtn],[name=mbtn] {width: 30px; height: 30px; border: 1px solid #ccc; background: white; margin: 0 auto; vertical-align: middle;}
	[name=one_order] {width: 80px; height: 25px; background: #3c7f44; color: white; border: 1px solid #3c7f44; font-size: 13px;
				margin-bottom: 5px;}
	[name=one_delete] {width: 80px; height: 25px; background: white; color: black; border: 1px solid black; font-size: 13px;}
	[name=option] {width: 80px; height: 23px; background: #f5f5f5; color: black; border: 1px solid #bbb; font-size: 12px;}
	
	#table-line {width: 1100px; height: 5px; background: #7F7F7F;}
	#list {margin-left: auto; margin-right: auto; height: 40px; width: 1100px; text-align: center;}
	#list tr {border-bottom: 2px solid #CFCFCF;}
	#list td:not(#nothing) {height: 100px;}
	#list th {height: 50px;}
	.optionList {color: gray; font-size: 13px; margin-bottom: 7px;}
	
	#list a:link {text-decoration: none; color: black;}
	#list a:visited {text-decoration: none; color: black;}
	#list a:active {text-decoration: none; color: black;}
	#list a:hover {text-decoration: none; color: black;}
	#list div {display: inline-block;}
	
	.product {display: flex; vertical-align: middle; justify-content: center; align-items: center; width: 350px;}
	#productPhoto {height: 80px; width: 80px; margin-right: 10px; vertical-align: middle;}
	#product_detail {display: flex; height: 100px; width: 200px; vertical-align: middle;}
	.prodName {font-weight: bold; margin-bottom: 5px; margin-top: 20px;}
 	.prodName, .optionList, .optionChange  {vertical-align: middle; display: table-cell; width: 200px;}
		
	/* 하단 버튼 */
	#space2 {height: 105px; text-align: center;}
	#space3 {height: 70px; text-align: center;}
	
	.selectbtn {width: 1100px; height: 66px; display: flex;	justify-content: center; margin-bottom: 100px;}
	
	.selectbtn input {font-size: 25px; padding: 7px 30px; margin: 0 30px; font-weight: bold;}
	
	#continue_shopping {border: 1px solid #BEBEBE; background: #BEBEBE; color:white;}
	#continue_shopping:hover {border: 1px solid #3C7F44; background: #3C7F44;}
	
	#select_order {border: 1px solid #BEBEBE; background: #BEBEBE; color:white;}
	#select_order:hover {border: 1px solid #3C7F44; background: #3C7F44;}
	
	#all_order {border: 1px solid #BEBEBE; background: #BEBEBE; color:white;}
	#all_order:hover {border: 1px solid #3C7F44; background: #3C7F44;}
</style>
</head>
<body>
		
	<%@ include file = "../common/header.jsp" %>
	<% if(loginUser == null) { %>
		<script>
			window.location.href='<%=request.getContextPath() %>/loginForm.me';
		</script>
	<% } else if(loginUser != null) { %> 
		<form action="<%=request.getContextPath() %>/cartAllOrder.me" method="post" id="cartListForm">
			<!-- 장바구니 -->
			<div class="layout" id="space4"></div>
			<div class="layout" id="subject2">장바구니</div>
			<div class="layout" id="cart_line"></div>
			<div class="layout" id="order_no">
				<div id="order_no1">01 장바구니</div><!-- 
				--><div id="order_no_mark"><img src="img/order_no_mark.png"></div><!-- 
				--><div id="order_no2">02 주문/결제</div><!-- 
				--><div id="order_no_mark"><img src="img/order_no_mark.png"></div><!-- 
				--><div id="order_no3">03 결제완료</div>
			</div>
			<div class="layout" id="cart_line"></div>
			<div class="layout" id="space8"></div>
			<div class="layout" id="table-line"></div>
			<table id="list">
				<% if(list.isEmpty()) { %>
					<tr><td id="nothing" colspan="7" height="250px;">등록된 장바구니 상품이 없습니다.</td></tr>
				<% } else { %>
					<tr>
						<th width="40"><input type="checkbox" name="all" id="all1" onclick="selectAll();"></th>
						<th width="400">상품정보</th>
						<th width="120">판매가</th>
						<th width="150">수량</th>
						<th width="120">배송비</th>
						<th width="120">합계</th>
						<th width="150">선택</th>
					</tr>
					
					<% for(int i = 0; i < list.size(); i++) { %>
						<tr>
							<td>
								<input type="checkbox" name="one" id="one<%= (list.size() - 1) - i %>" value="<%= list.get(i).getCartNo() %>" onclick="selectOne();">
								<input type="hidden" name="userId" id="userId" value="<%= list.get(i).getUserId() %>">
							</td>
							<td>
								<div id="product" class="product" name="product">
									<div id="productPhoto" class="productPhoto">
										<% for(int j = 0; j < fList.size(); j++) { %>
											<% Photo ph = fList.get(j); %>
											<% if(list.get(i).getProdNo() == ph.getProdNo() && ph.getType() == 0) { %>	
												<a href="<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>">
													<img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="80px" height="80px">
												</a>
											<% } %>
										<% } %>
									</div>
									<div id="product_detail" class="product_detail">
				    					<div class="prodName" name="prodName" id="prodName<%= (list.size() - 1) - i %>">
				    						<a href="<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>"><%= list.get(i).getProdName() %></a>
				    						<input type="hidden" name="prodName" id="prodName<%= (list.size() - 1) - i %>" value="<%= list.get(i).getProdName() %>">
				    					</div>
				    					<div class="optionList" name="optionList" id="optionList<%= (list.size() - 1) - i %>">
				    						<%
				    							String opResult = "";
				    						
				    							if(list.get(i).getOptionName() == null && list.get(i).getOptionCount() == null) {
				    								opResult = "-";
				    							} else {
						    						String[] opn = list.get(i).getOptionName().split(", ");
						    						String[] opc = list.get(i).getOptionCount().split(", ");
						    						int[] opcArr = new int[opc.length];
						    						
						    						for(int j = 0; j < opc.length; j++) {
						    							opcArr[j] = Integer.parseInt(opc[j]);
						    						}
						    						
						    						
						    						for(int j = 0; j < opn.length; j++) {
						    							if(j == 0) {
						    								opResult += "옵션 : " + opn[j] +  " - " + opcArr[j];
						    							} else {
						    								opResult += ", " + opn[j] +  " - " + opcArr[j];
						    							}
						    						}
				    							}
				    						%>
				    							<%= opResult %>
				    					</div>
<%-- 				    					<div class="optionChange" name="optionChange" id="optionChange<%= (list.size() - 1) - i %>"> --%>
<%-- 					    					<input type="button" name="option" id="option<%= (list.size() - 1) - i %>" value="옵션변경" onclick="optionPop('<%= list.get(i).getCartNo() %>');"> --%>
<!-- 				    					</div> -->
									</div>
								</div>
							</td>
							<td>
								<div id="prod_price">
									<div class="price" name="price" id="price<%= (list.size() - 1) - i %>">
										<%
// 											for(int i = 0; i < opn.length; i++) {
// 												if()
// 											}
										%>
										<%= list.get(i).getPrice() %>
									</div>
									<input type="hidden" name="price" id="price<%= (list.size() - 1) - i %>" value="<%= list.get(i).getPrice() %>">
								</div>
							</td>
							<td>
				        		<input type="button" name="pbtn" id="minus<%= (list.size() - 1) - i %>" onclick="count('price<%= (list.size() - 1) - i %>','amount<%= (list.size() - 1) - i %>','total<%= (list.size() - 1) - i %>','minus');" value="─"><!--
				        		 --><input hidden="hidden"><input type="text" id="amount<%= (list.size() - 1) - i %>" name="amount" value="<%= list.get(i).getAmount() %>" oninput="return handleOnInput(this);" onchange="sum()" readonly><!--
								 --><input type="button" name="mbtn" id="plus<%= (list.size() - 1) - i %>" onclick="count('price<%= (list.size() - 1) - i %>','amount<%= (list.size() - 1) - i %>','total<%= (list.size() - 1) - i %>','plus');" value="┼">
								<input type="button" name="amount_change" id="amount_change<%= (list.size() - 1) - i %>" value="수량변경" onclick="amountChange('amount<%= (list.size() - 1) - i %>', 'total<%= (list.size() - 1) - i %>', '<%= list.get(i).getCartNo() %>', '<%= list.get(i).getProdNo() %>')">
							</td>
							<td><div id="prod_sp">기본배송</div></td>
							<td>
								<div id="prod_sum">
									<div class="total" name="total" id="total<%= (list.size() - 1) - i %>"><%= list.get(i).getTotal() %></div>
									<input type="hidden" name="total" id="total<%= (list.size() - 1) - i %>" value="<%= list.get(i).getTotal() %>">
								</div>
							</td>
							<td>
								<div><input type="button" name="one_order" id="one_order<%= (list.size() - 1) - i %>" value="주문하기" onclick="cartOneOrder('<%= list.get(i).getCartNo() %>', '<%= list.get(i).getProdNo() %>')"></div>
								<div><input type="button" name="one_delete" id="one_delete<%= (list.size() - 1) - i %>" value="삭제" onclick="oneDelete('<%= list.get(i).getCartNo() %>', '<%= list.get(i).getProdNo() %>');"></div>
							</td>
						</tr>
					<% } %>
				<% } %>
			</table>
			
			<% if(list.isEmpty()) { %>
				<div class="layout2" id="space9"></div>
			<% } else { %>
			<div class="layout2" id="space9">
				<input type="checkbox" name="all" id="all2" onclick="selectAllCopy();"><!-- 
				--><div class="what-delete" id="what-delete1"><input type="button" id="select_delete" name="select_delete" value="선택상품삭제"></div><!-- 
				--><div class="what-delete" id="what-delete2"><input type="button" id="all_delete" name="all_delete" value="전체삭제"></div>
			<% } %>
			</div>
			<div class="layout" id="space9"></div>
			<div class="layout" id="total_price_list">
				<% if(list.isEmpty()) { %>
					<div class="total" id="total_product_price"><div id="tpp_name" class="tpp">총 상품 금액</div><div id="tpp_conts" class="tpp">0원</div></div><!-- 
					--><div class="total" id="total_price_bar"></div><!--
					--><div class="total" id="total_shipping_price"><div id="tsp_name" class="tsp">총 배송비</div><div id="tsp_conts" class="tsp">0원</div></div><!--
					--><div class="total" id="total_price_bar"></div><!--
					--><div class="total" id="total_payment_price"><div id="tpmp_name" class="tpmp">총 결제 금액</div><div id="tpmp_conts" class="tpmp">0원</div></div>
				<% } else { %>
					<div class="total" id="total_product_price"><div id="tpp_name" class="tpp">총 상품 금액</div><div id="tpp_conts" class="tpp"></div></div><!-- 
					--><div class="total" id="total_price_bar"></div><!--
					--><div class="total" id="total_shipping_price"><div id="tsp_name" class="tsp">총 배송비</div><div id="tsp_conts" class="tsp"></div></div><!--
					--><div class="total" id="total_price_bar"></div><!--
					--><div class="total" id="total_payment_price"><div id="tpmp_name" class="tpmp">총 결제 금액</div><div id="tpmp_conts" class="tpmp"></div></div>
				<% } %>
			</div>
		 	<div class="layout" id="space10"></div>
			<div class="layout" id="space11">
				<div class="selectbtn">
					<% if(list.isEmpty()) { %>
						<input type="button" id="continue_shopping" value="쇼핑 계속하기">
					<% } else { %>
						<input type="button" id="continue_shopping" value="쇼핑 계속하기">
						<input type="button" id="select_order" value="선택 상품 주문">
						<input type="submit" id="all_order" value="전체 상품 주문">
					<% } %>
				</div>
			</div>
		</form>
		<div class="layout" id="space4"></div>
		
		<script>
			$(function() {
				var all1 = document.getElementById('all1');
				var all2 = document.getElementById('all2');
				var one = document.getElementsByName('one');
				var tsp = document.getElementById('tsp_conts');
				var count = 0;
				
				// 로딩되자마자 체크박스 올 체킹
				all1.checked = true;
				if(all1.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all2.checked = true;
					tsp.innerText = 2500;
				}
				
				// 여기서 구한 총계값은 처음 리스트 받아 왔을때의 값
				sum();
				
				
<%-- 				var list = new Array(<%= list.size() %>); --%>
				
// 				for(var i = 0; i < list.length; i++) {
// 					console.log(i);
// 					var amountChange = $('#' + 'amountChange' + i);
					
// 					$(amountChange).on('click', function() {
// 						var amount = $('#' + 'amount' + i);
// 						var price = $('#' + 'price' + i);
// 						var total = $('#' + 'total' + i);
// 						var sum = 0;
// 						sum = parseInt(amount) * parseInt(price);
// 						total.val(sum);
						
						
// 						var tppr = sum;
						
// 						$('#tpp_conts').text(priceToString(tppr) + "원");
// 						$('#tpmp_conts').text(priceToString(tppr) + "원");
						
// 						if(document.getElementById('amount').value.length == 0) {
// 							alert('수량을 입력해주세요');
// 							window.location.reload();
// 						}
// 					});
// 				}
			});
			
			function sum() {
				
				var totalAmt = 0;
				
				for(var i = 0; i < <%= list.size() %>; i++) {
					var price = '#price' + i;
					var amount = '#amount' + i;
					var total = '#total' + i;
					
					// 체크되었을때만 금액을 합산
					if($('#one' + i).prop("checked")) {						
						totalAmt += parseInt($(total).text());
					}
				}
				
				$('#tpp_conts').text(totalAmt);
				$('#tpmp_conts').text(totalAmt + parseInt($('#tsp_conts').text()));
			}
			
			function sum2() { // 이렇게도 사용할 수 있다 (대박..)
				$("#list tr").each(function(){
					
					console.log($(this).find("[name=price]").val());
				});	
				
			}
			
			
			function priceToString(p) {
			    return p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}
			

		</script>
		
		<script>
			function optionPop(cartNo) {
				window.open('cartOptionChangeForm.me?cartNo=' + cartNo, 'optionChangeForm', 'width=480, height=410, top=200, left=400');
			}
		
			$('input[name=amount]').keypress(function(e) {
				if(e.keyCode == 13) {
					e.preventDefault();
				}
			});
			
			function amountChange(amount, total, cartNo, prodNo) {
				var amountValue = $('#' + amount).val();
// 				var amountValue = amountRes.value;
				var totalValue = $('#' + total).text();
				console.log(prodNo);
				if(amountValue == '' || amountValue.length == 0) {
					alert('수량을 입력하세요.');
				} else {
					location.href='<%= request.getContextPath() %>/amountUpdate.me?cartNo=' + cartNo + '&prodNo=' + prodNo + '&amount=' + amountValue + '&total=' + totalValue;
				}
			}
			
			function cartOneOrder(cartNo, prodNo) {
				location.href="<%= request.getContextPath() %>/cartOneOrder.me?cartNo=" + cartNo + "&prodNo=" + prodNo;
			}
			
			function oneDelete(cartNo, prodNo) {
				var bool = confirm('상품을 삭제하시겠습니까?');
				
				if(bool) {
					location.href="<%= request.getContextPath() %>/cartOneDelete.me?cartNo=" + cartNo + "&prodNo=" + prodNo;
					alert('정상적으로 삭제되었습니다.');
				}
			}
		</script>
								
		<script>
			var all1 = document.getElementById('all1');
			var all2 = document.getElementById('all2');
			var one = document.getElementsByName('one');
			var tsp = document.getElementById('tsp_conts');
			
			// 전체선택 체크박스
			function selectAll() {
				if(all1.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all2.checked = true;
					tsp.innerText = 2500;
				} else {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = false;
					}
					all2.checked = false;
					tsp.innerText = 0;
				}
				sum();
			}
			function selectAllCopy() {
				if(all2.checked == true) {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = true;
					}
					all1.checked = true;
					tsp.innerText = 2500;
				} else {
					for(var i = 0; i < one.length; i++) {
						one[i].checked = false;
					}
					all1.checked = false;
					tsp.innerText = 0;
				}
				sum();
			}
			
			// 체크박스
			function selectOne() {
				var count = 0;
				tsp.innerText = 0;
				
				for(var i = 0; i < one.length; i++) {
					if(one[i].checked == true) {
						count++;
						console.log(one[i].value);
						tsp.innerText = 2500;
					}
				}
				
				if(count == one.length) {
					all1.checked = true;
					all2.checked = true;
				} else {
					all1.checked = false;
					all2.checked = false;
				}
				sum();
			}
			
			// 수량 입력 제한
			function handleOnInput(e) {
				var kor = /[ㄱ-ㅎ|ㅏ-ㅣ]/gi;
				var eng = /[a-zA-Z]/gi;
				var teuk = /[`~!@#$%^&*()_|+\-=?;:,.<>\{\}\[\]\\\/]/gi;
				var resultElement = document.getElementsByName('amount');
				var zero = /^[0]/;
				var defaultValue = 1;
				
				for(var i = 0; i < <%= list.size() %>; i++) {
					if(teuk.test(resultElement[i].value) || eng.test(resultElement[i].value) || kor.test(resultElement[i].value)
							|| resultElement[i].value == ' ' || isNaN(resultElement[i].value)) {
						alert('숫자로 입력하셔야 합니다.');
						resultElement[i].value = defaultValue;
						return false;
					} else if(zero.test(resultElement[i].value)) {
						alert('1 이하는 입력할 수 없습니다.');
						resultElement[i].value = defaultValue;
						return false;
					} else if(resultElement[i].value.length == 0) {
						alert('수량을 입력하셔야 합니다.');
					}
					
					if(isNaN(resultElement[i].value)) {  
						console.log("숫자로만 입력이 가능합니다.");  
						resultElement[i].value = defaultValue; 
						return false;  
					}
				}
				return true;
			}
			
			// 버튼으로 수량 추가/감소
			function count(price, amount, total, type)  {
				// 결과를 표시할 element
				var amountResult = document.getElementById(amount);
				var count = amountResult.value;
				
				var priceResult = document.getElementById(price);
				var price = Number(priceResult.innerText);
				
				var totalResult = document.getElementById(total);
				var total = Number(totalResult.innerText);
				
				console.log(total);
				console.log(price);
				
				if(type == 'minus' && count == 1){
					// 변경 불가
					alert("수량은 1 이상이어야 합니다.");
				} else if(type == 'minus') {
					amountResult.value = Number(amountResult.value) - 1;
					total -= price;
					totalResult.innerText = total;
				} else if(type == 'plus') { 
					amountResult.value = Number(amountResult.value) + 1;
					total += price;
					totalResult.innerText = total;
				}
				
				   
				sum();
			}
		</script>
		
		<script>
			$('#select_delete').on('click', function(event) {
				var bool = window.confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
				var one = document.getElementsByName('one');
				var count = 0;
				
				if(bool) {
					for(var i = 0; i < one.length; i++) {
						if(one[i].checked == true) {
							count++;
						}
					}
					
					if(count == 0) {
						alert('선택한 상품이 없습니다.');
						event.stopImmediatePropagation();
					} else {
						$('#cartListForm').attr('action', 'cartSelectDelete.me');
						$('#cartListForm').submit();
						alert('선택하신 상품을 장바구니에서 삭제 완료하였습니다.');
					}
				}
				
			});
			
			$('#select_order').on('click', function(event) {
				var one = document.getElementsByName('one');
				var count = 0;
				
				for(var i = 0; i < one.length; i++) {
					if(one[i].checked == true) {
						count++;
					}
				}
					
				if(count == 0) {
					alert('선택한 상품이 없습니다.');
					event.stopImmediatePropagation();
				} else {
					$('#cartListForm').attr('action', 'cartSelectOrder.me');
					$('#cartListForm').submit();
				}
			});
			
			$('#all_delete').on('click', function() {
				var bool = window.confirm("전체 상품을 장바구니에서 삭제하시겠습니까?");
				
				if(bool) {
					$('#cartListForm').attr('action', 'cartAllDelete.me');
					$('#cartListForm').submit();
					alert('전체 상품을 장바구니에서 삭제 완료하였습니다.');
				}
			});
			
			$('#continue_shopping').on('click', function() {
				location.href='<%=request.getContextPath()%>';
			});
			
		</script>
		
	<% } %>
	<%@ include file="../common/bottontitle.jsp" %>
</body>
</html>