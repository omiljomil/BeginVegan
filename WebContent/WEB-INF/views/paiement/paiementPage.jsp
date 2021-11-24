<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, paiement.model.vo.Paiement" %>
<% ArrayList<Paiement> list = (ArrayList<Paiement>)request.getAttribute("list"); %>
<%
	int result = 0;
	for(int i = 0; i < list.size(); i++) {
		result += list.get(i).getTotal();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/*결제 페이지*/
.payment {
	position: realative;
	width: 1200px;
	margin: 0 auto;
	margin-left: 300px;
	margin-top: 150px;
	min-height: 100%;
	box-sizing: border-box;
}

.payment_h4 {
	text-align: center;
	color: #909090;
	margin-top: 100px;
	margin-bottom: 40px;
}

.payment_table {
	border-radius: 5px;
	box-shadow: 0 0 0 1px #E2E2E2;
}

.payment_table td {
	font-size: 11px;
	text-align: center;
	color: #A4A4A4;
	height: 60px;
}

.payment_table_tr {
	border-bottom: 1px solid #E2E2E2;
}

.payment_order_h6 {
	font-weight: bold;
	color: #909090;
	margin-bottom: 20px;
	margin-left: 20px;
	font-size: small;
}

.order_info {
	margin-top: 80px;
	border-top: 1px solid #E2E2E2;
	border-bottom: 1px solid #E2E2E2;
}

.order_info_title {
	margin-left: 20px;
	margin-top: 30px;
	margin-bottom: 10px;
	font-size: small;
	font-weight: bold;
}

.order_info_table tr {
	border-bottom: 1px solid #E2E2E2;
}

.order_info_table td {
	height: 60px;
	font-size: x-small;
	color: #909090;
}

.order_info_sub_title1 {
	width: 150px;
	text-indent: 2em;
}

.order_info_sub_title2 {
	width: 1050px;
}

input {
	border: 1px solid #BCB9B9;
	border-radius: 2px;
	margin-top: 5px;
}

.order_select, .normal_phone_select, .phone_select {
	border: 1px solid #BCB9B9;
	border-radius: 2px;
	margin-top: 5px;
	font-size: small;
}

.last_address1, .last_address2 {
	margin-bottom: 10px;
}

.first_address {
	margin-top: 10px;
}

.post_numberBtn {
	margin-left: 8px;
	font-size: small;
	background: white;
	padding: 2px;
}

/*배송 정보*/
.deliver_info {
	margin-top: 80px;
	border-top: 1px solid #E2E2E2;
	border-bottom: 1px solid #E2E2E2;
}

.deliver_info_title {
	margin-left: 20px;
	margin-top: 30px;
	margin-bottom: 10px;
	font-size: small;
	font-weight: bold;
}

.deliver_info_table tr {
	border-bottom: 1px solid #E2E2E2;
}

.deliver_info_table td {
	height: 60px;
	font-size: x-small;
	color: #909090;
}

.deliver_info_sub_title1 {
	width: 150px;
	text-indent: 2em;
}

.deliver_info_sub_title2 {
	width: 1050px;
}

.deliver_checkbox {
	margin-left: 10px;
}

.deliver_label {
	margin-right: 10px;
	font-size: small;
}

.deliver_listBtn {
	margin-left: 8px;
	font-size: small;
	background: white;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 3px;
	padding-top: 3px;
}
/*총 결제 금액*/
.all_order {
	margin-top: 80px;
}

.all_order table tr td {
	width: 400px;
	height: 80px;
}

.all_order_first {
	background: #FAF9F9;
	font-size: small;
	text-align: center;
}

.all_order_second {
	border: 1px solid #E2E2E2;
	font-size: x-large;
	color: #909090;
	text-align: center;
}

.all_order_third {
	text-align: center;
}

.all_orderBtn1 {
	margin-right: 5px;
	margin-top: 80px;
	padding: 20px 80px 20px 80px;
	border: none;
	border-radius: 3px;
	font-size: large;
}

.all_orderBtn2 {
	margin-left: 15px;
	margin-top: 80px;
	padding: 20px 80px 20px 80px;
	border: none;
	background: #7B7A7A;
	color: white;
	border-radius: 3px;
	font-size: large;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- 결제 페이지 -->
	<div class="payment">
		<div class="payment_bottom">
			<h4 class="payment_h4">ORDER</h4>
		</div>
		<form action="<%= request.getContextPath() %>/paie.me" method="post"
			name="paieForm" onsubmit="return checkValue()">
			<div class="payment_order">
				<h6 class="payment_order_h6">상품 주문 내역</h6>
				<table class="payment_table">
					<tr class="payment_table_tr">
						<td style="width: 150px;">이미지</td>
						<td style="width: 600px;">상품 정보</td>
						<td style="width: 130px;">판매가</td>
						<td style="width: 130px;">수량</td>
						<td style="width: 130px;">배송비</td>
						<td style="width: 130px;">합계</td>
					</tr>
					<% for(int i = 0; i < list.size(); i++) { %>
						<tr>
							<td style="height: 130px; border-bottom: 1px solid #E2E2E2">이미지</td>
							<td style="height: 130px; border: 1px solid #E2E2E2"><%= list.get(i).getProdName() %></td>
							<td style="height: 130px; border: 1px solid #E2E2E2"><%= list.get(i).getPrice() %></td>
							<td style="height: 130px; border: 1px solid #E2E2E2"><%= list.get(i).getAmount() %></td>
							<td style="height: 130px; border: 1px solid #E2E2E2">0원</td>
							<td style="height: 130px; border: 1px solid #E2E2E2"><%= list.get(i).getTotal() %></td>
						</tr>
					<% } %>
					<tr>
						<td colspan="5"></td>
						<td>합계 : <%= result %></td>
					</tr>
				</table>
			</div>

			<div class="order_info">
				<div class="order_info_title">주문 정보</div>
			</div>

			<table class="order_info_table" style="margin-bottom: 5px;">
				<tr>
					<td class="order_info_sub_title1">주문자</td>
					<td class="order_info_sub_title2"><input type="text"
						name="orderName" id="orderName"
						style="height: 25px; width: 200px;"></td>
				</tr>
				<tr>
					<td class="order_info_sub_title1">주소</td>
					<td class="order_info_sub_title2"><input type="text"
						class="first_address" name="postal" id="postal"
						style="height: 25px; width: 70px;"><input type="button"
						onclick="execDaumPostcode()" class="post_numberBtn"
						id="post_number" value="우편번호 >"><br> <input
						type="text" name="address" id="address"
						style="height: 25px; width: 450px; margin-top: 10px;"
						placeholder="기본 주소"><br> <input type="text"
						class="last_address1" name="de_address" id="de_address"
						style="height: 25px; width: 450px; margin-top: 10px;"
						placeholder="상세 주소"></td>
				</tr>
				<tr>
					<td class="order_info_sub_title1">일반전화</td>
					<td class="order_info_sub_title2"><select
						class="normal_phone_select" name="normal_phone" id="normal_phone"
						style="height: 25px; width: 60px;">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">055</option>
					</select> - <input type="text" style="height: 25px; width: 80px;"> -
						<input type="text" style="height: 25px; width: 80px;"></td>
				</tr>
				<tr>
					<td class="order_info_sub_title1">휴대전화</td>
					<td class="order_info_sub_title2"><select class="phone_select"
						name="phone1" id="phone1" style="height: 25px; width: 60px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input type="text" name="phone2" id="phone2"
						style="height: 25px; width: 80px;"> - <input type="text"
						name="phone3" id="phone3" style="height: 25px; width: 80px;">
					</td>
				</tr>
				<tr>
					<td class="order_info_sub_title1" style="height: 80px">이메일</td>
					<td class="order_info_sub_title2"><input type="text"
						style="height: 25px; width: 180px;"> @ <input type="text"
						style="height: 25px; width: 180px;"> <select
						class="order_select" name="email3" id="email"
						style="height: 25px; width: 100px;">
							<option value="1">직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="naver.com">naver.com</option>
					</select></td>
				</tr>
			</table>

			<div class="deliver_info">
				<div class="deliver_info_title">배송 정보</div>
			</div>
			<table class="deliver_info_table" style="margin-bottom: 50px;">
				<tr>
					<td class="deliver_info_sub_title1">배송지 선택</td>
					<td class="deliver_info_sub_title2"><label
						class="deliver_label"> <input type="checkbox"
							class="deliver_checkbox"> 주문자 정보와 동일
					</label> <label class="deliver_label"> <input type="checkbox"
							class="deliver_checkbox"> 새로운 배송지
					</label> <input type="button" class="deliver_listBtn" value="주소록 보기">
					</td>
				</tr>
				<tr>
					<td class="deliver_info_sub_title1">주문자</td>
					<td class="deliver_info_sub_title2"><input type="text"
						style="height: 25px; width: 200px;"></td>
				</tr>
				<tr>
					<td class="deliver_info_sub_title1">주소</td>
					<td class="deliver_info_sub_title2"><input type="text"
						class="first_address" id="postal2"
						style="height: 25px; width: 70px;"><input type="button"
						class="post_numberBtn" onclick="execDaumPostcode2()"
						value="우편번호 >"><br> <input type="text" id="address2"
						style="height: 25px; width: 450px; margin-top: 10px;"
						placeholder="기본 주소"><br> <input type="text"
						id="de_address2" class="last_address2"
						style="height: 25px; width: 450px; margin-top: 10px;"
						placeholder="상세 주소"></td>
				</tr>
				<tr>
					<td class="deliver_info_sub_title1">일반전화</td>
					<td class="deliver_info_sub_title2"><select
						class="normal_phone_select" name="normal_phone" id="normal_phone"
						style="height: 25px; width: 60px;">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">055</option>
					</select> - <input type="text" style="height: 25px; width: 80px;"> -
						<input type="text" style="height: 25px; width: 80px;"></td>
				</tr>
				<tr>
					<td class="deliver_info_sub_title1">휴대전화</td>
					<td class="deliver_info_sub_title2"><select
						class="phone_select" name="phone" id="phone"
						style="height: 25px; width: 60px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input type="text" style="height: 25px; width: 80px;"> -
						<input type="text" style="height: 25px; width: 80px;"></td>
				</tr>
				<tr>
					<td class="deliver_info_sub_title1" style="height: 130px">배송
						메시지</td>
					<td class="deliver_info_sub_title2"><input type="textarea"
						style="height: 80px; width: 450px;"></td>
				</tr>
			</table>

			<div class="all_order" style="margin-bottom: 300px;">
				<table>
					<tr>
						<td class="all_order_first">총 주문 금액</td>
						<td class="all_order_first">배송료</td>
						<td class="all_order_first">총 결제 예정 금액</td>
					</tr>
					<tr>
						<td class="all_order_second">21,400원</td>
						<td class="all_order_second">2,500원</td>
						<td class="all_order_second">= 23,900원</td>
					</tr>
					<tr>
						<td colspan="3" class="all_order_third"><input type="button"
							value="취소하기" class="all_orderBtn1"> <input type="button"
							value="결제하기" class="all_orderBtn2" id="all_orderBtn2"></td>
					</tr>
				</table>

			</div>
		</form>
	</div>
	<script>
			$('#all_orderBtn2').on('click', function(){
				window.open('realPaiement.me', 'order', 'width=900, height=800');
			})
		</script>


	<script>
	// 우편 번호와 주소 불러오기
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	           
	            	
	            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postal').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullRoadAddr; // 주소 
	            document.getElementById('de_address').focus();	// 상세 주소
	        }
	    }).open();
	}
	
	function execDaumPostcode2() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postal2').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address2').value = fullRoadAddr; // 주소 
	            document.getElementById('de_address2').focus();	// 상세 주소
	        }
	  	  }).open();
		}
	</script>

	<script>
	function checkValue(){
		var form = document.paieForm;
		
		if(!form.orderName.value){
			alert("주문자를 입력하세요.");
			return false;
		}
		
		if(!form.postal.value){
			alert("우편번호를 입력하세요.");
			return false;
		}
		
		if(!form.address.value){
			alert("주소를 입력하세요.");
			return false;
		}
		
		if(!form.phone1.value || !form.phone2.value || !form.phone3.value){
			alert("전화번호를 입력하세요.");
			return false;
		}
		
	}
	</script>

</body>
</html>