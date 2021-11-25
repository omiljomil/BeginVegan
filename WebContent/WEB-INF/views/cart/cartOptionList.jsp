<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="cart.model.vo.Cart" %>
<% Cart c = (Cart)request.getAttribute("c"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 옵션 변경</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
	input[type="button"], input[type="submit"] {cursor: pointer;}
	body {margin: 0px;}
	div {border: 0px solid black;}
	#optionList {margin: 10px 30px; width: 350px; text-align: center; margin-left: auto; margin-right: auto;}
	#optionTitle {text-align: center; height: 50px; font-size: 25px; font-weight: bold;
					 display: flex; justify-content: center; align-items: center;}
	.optionName {display: inline-block; width: 100px; vertical-align: middle; font-weight: bold; margin-left: 65px; margin-right: 30px;}
	.optionChange {display: inline-block; vertical-align: middle;}
	.optionDetail {margin-top: 10px; margin-bottom: 5px;}
	#price1, #price2, #price3 {display: inline-block; margin-top: 5px; margin-bottom: 5px;}
	.minus_product, .add_product {width: 25px; height: 25px; border: 1px solid #ccc; background: white; vertical-align: middle;}
	input[type=text] {width: 25px; height: 19px; border: 1px solid #ccc; vertical-align: middle; text-align: center; padding: 2px 5px;}
	#priceDetail {text-align: right; margin-right: 30px;}
	.total {font-size: 22px; height: 50px;  margin-right: 30px;  padding: 10px auto; vertical-align: middle; display: flex; justify-content: flex-end; align-items: center;}
	#hapgye {vertical-align: middle; line-height: 22px;} 
	#total {font-weight: bold; display: inline-block; vertical-align: middle; line-height: 22px;}
	#option1, #option2, #option3 {margin-top: 10px; margin-bottom: 5px;}
	#line {height: 1px; width: 350px; background: #dfdfdf;}
	.selectbtn {width: 350px; height: 50px; display: flex;	justify-content: center;}
	.selectbtn input {margin: 10px 10px; width: 80px; height: 30px;}
	#ok {border: 1px solid #666; background: #666; color: white;}
	#cancel {border: 1px solid black; background: white; color: black;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
	<form action="<%= request.getContextPath() %>/cartOptionChange.me" method="post">
		<div id="optionList">
			<div id="optionTitle">&lt;옵션 변경&gt;</div>
			
 			<div id="line"></div>
 			
			<div id="option1">
				<div class="optionDetail">
					<div class="optionName">콩고기</div>
					<div class="optionChange">
						<input type="button" id="minus1" class="minus_product" value="-" onclick="count('amount1', 'minus');"><!-- 
						 --><input type="text" id="amount1" name="amount1" min="1" max=10 value="" readonly><!-- 
						 --><input type="button" id="plus1" class="add_product" value="+" onclick="count('amount1', 'plus');" >
					</div>
			 	</div>
				<div id="priceDetail">가격 : <div id="price1"></div></div>
<!-- 				<i class="bi bi-x" id="delIcon1"></i> -->
		 	</div>
			 
 			<div id="line"></div>
 			
			<div id="option2">
				<div class="optionDetail">
					<div class="optionName">야채</div>
					<div class="optionChange">
						<input type="button" id="minus2" class="minus_product" value="-" onclick="count('amount2', 'minus');"><!--
						 --><input type="text" id="amount2" name="amount2" min="1" max=10 value="" readonly><!--
						 --><input type="button" id="plus2" class="add_product" value="+" onclick="count('amount2', 'plus');">
					</div>
				</div>
				<div id="priceDetail">가격 : <div id="price2"></div></div>
<!-- 				<i class="bi bi-x" id="delIcon2"></i> -->
			 </div>
			 
 			<div id="line"></div>
 			
			 <div id="option3">
 				<div class="optionDetail">
					<div class="optionName">콩</div>
					<div class="optionChange">
						<input type="button" id="minus3" class="minus_product" value="-" onclick="count('amount3', 'minus');"><!--
						 --><input type="text" id="amount3" name="amount3" min="1" max=10 value="" readonly><!--
						 --><input type="button" id="plus3" class="add_product" value="+" onclick="count('amount3', 'plus');">
					</div>
				</div>
				<div id="priceDetail">가격 : <div id="price3"></div></div>
<!-- 				<i class="bi bi-x" id="delIcon3"></i> -->
			</div>
			
 			<div id="line"></div>
 			
			 <div id="option3">
 				<div class="optionDetail">
					<div class="optionName">치즈</div>
					<div class="optionChange">
						<input type="button" id="minus4" class="minus_product" value="-" onclick="count('amount4', 'minus');"><!--
						 --><input type="text" id="amount4" name="amount4" min="1" max=10 value="" readonly><!--
						 --><input type="button" id="plus4" class="add_product" value="+" onclick="count('amount4', 'plus');">
					</div>
				</div>
				<div id="priceDetail">가격 : <div id="price4"></div></div>
<!-- 				<i class="bi bi-x" id="delIcon3"></i> -->
			</div>
			 
 			<div id="line"></div>
 			
			 <div id="option3">
 				<div class="optionDetail">
					<div class="optionName">연어</div>
					<div class="optionChange">
						<input type="button" id="minus5" class="minus_product" value="-" onclick="count('amount5', 'minus');"><!--
						 --><input type="text" id="amount5" name="amount5" min="1" max=10 value="" readonly><!--
						 --><input type="button" id="plus5" class="add_product" value="+" onclick="count('amount5', 'plus');">
					</div>
				</div>
				<div id="priceDetail">가격 : <div id="price5"></div></div>
<!-- 				<i class="bi bi-x" id="delIcon3"></i> -->
			</div>
			
			<div id="line"></div>
			
			<div class="total">
				<div id="hapgye">합계 :&nbsp; </div><div id="total"></div>
				<input type="hidden" name="cartNo" value="<%= c.getCartNo() %>">
				<input type="hidden" name="userId" value="<%= c.getUserId() %>">
			</div>
			
			<div id="line"></div>
			
			<div class="selectbtn">
				<input id="ok" type="submit" value="변경">
				<input id="cancel" type="button" value="취소">
			</div>
		</div>
	</form>
	
	<script>
		$(function() {
			sum();
		});
			
			
		function sum(){
			var optionSum1 = parseInt($('#amount1').val() * 5000);
			var optionSum2 = parseInt($('#amount2').val() * 2000);
			var optionSum3 = parseInt($('#amount3').val() * 2000);
			var optionSum4 = parseInt($('#amount4').val() * 3000);
			var optionSum5 = parseInt($('#amount5').val() * 4000);
			var totalAmt = 0;
			
			
			
			$('#price1').text(priceToString(optionSum1) + "원");
			$('#price2').text(priceToString(optionSum2) + "원");
			$('#price3').text(priceToString(optionSum3) + "원");
			$('#price4').text(priceToString(optionSum4) + "원");
			$('#price5').text(priceToString(optionSum5) + "원");
			
			totalAmt += parseInt($('#price1').text().replace(",", ""))
							+ parseInt($('#price2').text().replace(",", ""))
							+ parseInt($('#price3').text().replace(",", ""))
							+ parseInt($('#price4').text().replace(",", ""))
							+ parseInt($('#price5').text().replace(",", ""));
			
			$('#total').text(priceToString(<%= c.getPrice() %> + totalAmt) + "원");
		}
		
		function priceToString(p) {
		    return p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		
		function count(element, type)  {
			// 결과를 표시할 element
			var resultElement = document.getElementById(element);
			var count = resultElement.value;
			
			if(type == 'minus' && count == 0){
				// 변경 불가
				alert("수량은 0 이상이어야 합니다.");
			} else if(type == 'minus') {
				resultElement.value = Number(resultElement.value) - 1;
			} else if(type == 'plus') { 
				resultElement.value = Number(resultElement.value) + 1;
			}
			
			sum();
		}
	</script>
</body>
</html>