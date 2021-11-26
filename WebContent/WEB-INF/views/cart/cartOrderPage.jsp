<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, cart.model.vo.Cart, product.model.vo.*" %>
<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
ArrayList<Photo> fList = (ArrayList<Photo>)request.getAttribute("fList");
%>
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<style>
      /*결제 페이지*/
      table a:link {text-decoration: none; color: #909090;}
		table a:visited {text-decoration: none; color: #909090;}
		table a:active {text-decoration: none; color: #909090;}
		table a:hover {text-decoration: none; color: #909090;}
		
      .payment{
      position: realative;
      width: 1200px;
      margin: 0 auto;
      margin-left: 300px;
      margin-top: 150px;
      min-height:100%;
      box-sizing: border-box;
   }
   .payment_h4{
      text-align: center;
      color: #909090;
      margin-top: 100px;
      margin-bottom: 40px;
   }
   .payment_table{
      border-radius: 5px;
      box-shadow: 0 0 0 1px #E2E2E2;
   }
   .payment_table td {
      font-size: 11px;
      text-align: center;
      color: #A4A4A4;
      height: 60px;
   }
   .payment_table_tr{
      border-bottom: 1px solid #E2E2E2;
   }
   .payment_order_h6 {
      font-weight: bold;
      color: #909090;
      margin-bottom: 20px;
      margin-left: 20px;
      font-size: small;
   }
   .order_info{
      margin-top: 80px;
      border-top: 1px solid #E2E2E2;
      border-bottom: 1px solid #E2E2E2;
   }
   .order_info_title{
      margin-left: 20px;
      margin-top: 30px;
      margin-bottom: 10px;
      font-size: small;
      font-weight: bold;
   }
   .order_info_table tr{
      border-bottom: 1px solid #E2E2E2;
   }
   .order_info_table td{
      height: 60px;
      font-size: small;
      color: #909090;
   }
   .order_info_sub_title1{
      width: 150px;
      text-indent: 2em;
      
   }
   .order_info_sub_title2{
      width: 1050px;
   }
   input{
      border: 1px solid #BCB9B9;
      border-radius: 2px;
      margin-top: 5px;
   }
   .order_select, .normal_phone_select, .phone_select{
      border: 1px solid #BCB9B9;
      border-radius: 2px;
      margin-top: 5px;
      font-size: small;   
      }
   .last_address1, .last_address2 {
      margin-bottom: 10px;
   }
   .first_address{
      margin-top: 10px;
   }
   .post_numberBtn{
      margin-left: 8px;
      font-size: small;
      background: white;
      padding: 2px;
   }
   
      /*배송 정보*/
   .deliver_info{
      margin-top: 80px;
      border-top: 1px solid #E2E2E2;
      border-bottom: 1px solid #E2E2E2;
   }
   .deliver_info_title{
      margin-left: 20px;
      margin-top: 30px;
      margin-bottom: 10px;
      font-size: small;
      font-weight: bold;
      
   }
   .deliver_info_table tr{
      border-bottom: 1px solid #E2E2E2;
   }
   .deliver_info_table td{
      height: 60px;
      font-size: small;
      color: #909090;
   }
   .deliver_info_sub_title1{
      width: 150px;
      text-indent: 2em;
      
   }
   .deliver_info_sub_title2{
      width: 1050px;
   }
   
   .deliver_checkbox {
      margin-left: 10px;
   }
   .deliver_label {
      margin-right: 10px;
      font-size: small;
   }
   
   .deliver_listBtn{
      margin-left: 8px;
      font-size: small;
      background: white;
      padding-left: 10px;
      padding-right: 10px;
      padding-bottom: 3px;
      padding-top: 3px;
   }
   /*총 결제 금액*/
   
   .all_order{
      margin-top: 80px;
   }
   
   .all_order table tr td{
      width: 400px;
      height: 80px;
   }
   .all_order_first{
      background:  #FAF9F9;
      font-size: small;
      text-align: center;
   }
   .all_order_second{
      border: 1px solid #E2E2E2;
      font-size: x-large;
      color: #909090;
      text-align: center;
   }
   .all_order_third{
      text-align: center;
   }
   .all_orderBtn1{
      margin-right: 5px;
      margin-top: 80px;
      padding: 20px 80px 20px 80px;
      border: none;
      border-radius: 3px;
      font-size: large;
   }
   .all_orderBtn2{
      margin-left:15px;
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
<%@ include file = "../common/header.jsp" %>
<!-- 결제 페이지 -->

         <div class="payment">
         <div class="payment_bottom">
            <h4 class="payment_h4">ORDER</h4>
         </div>
         
         <form action="<%= request.getContextPath() %>/insertOrder.me"
         method="post" name="orderForm" autocomplete="off">
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
							<td style="height: 130px; border-bottom: 1px solid #E2E2E2">
								<% for(int j = 0; j < fList.size(); j++) { %>
									<% Photo ph = fList.get(j); %>
									<% if(list.get(i).getProdNo() == ph.getProdNo() && ph.getType() == 0) { %>	
										<a href="<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>">
											<img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="100%" height="100%">
										</a>
									<% } %>
								<% } %>
							</td>
							<td style="height: 130px; border: 1px solid #E2E2E2">
								<a href="<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>"><b><%= list.get(i).getProdName() %></b></a>
								<br>
								<%
		    						String[] opn = list.get(i).getOptionName().split(", ");
		    						String[] opc = list.get(i).getOptionCount().split(", ");
		    						int[] opcArr = new int[opc.length];
		    						
		    						for(int j = 0; j < opc.length; j++) {
		    							opcArr[j] = Integer.parseInt(opc[j]);
		    						}
		    						String opArr = "";
		    						
		    						for(int j = 0; j < opn.length; j++) {
		    							if(j == 0) {
		    								opArr += "옵션 : " + opn[j] +  " - " + opcArr[j];
		    							} else {
		    								opArr += ", " + opn[j] +  " - " + opcArr[j];
		    							}
		    						}
	    						%>
				    			<%= opArr %>
							</td>
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
            <div class="order_info_title">
               주문 정보
            </div>
            </div>

            <table class="order_info_table" style="margin-bottom: 5px;">
               <tr>   
                  <td class="order_info_sub_title1">주문자</td>
                  <td class="order_info_sub_title2"><input type="text" id="orderName" name="orderName" style="height: 25px; width:200px;"></td>
               </tr>
               <tr>   
                  <td class="order_info_sub_title1">주소</td>
                  <td class="order_info_sub_title2">
                  <input type="text" class="first_address" id="postal1" style="height: 25px; width:70px;" readonly><input type="button" onclick="execDaumPostcode()" class="post_numberBtn" id="post_number" value="우편번호 >"><br>
                  <input type="text" id="address1" style="height: 25px; width:450px; margin-top: 10px;" placeholder="기본 주소" readonly><br>
                  <input type="text" class="last_address1" id="deAddress1" style="height: 25px; width:450px; margin-top: 10px;" placeholder="상세 주소">
                  </td>
               </tr>
               <tr>   
                  <td class="order_info_sub_title1">일반전화</td>
                  <td class="order_info_sub_title2">
                  <select class="normal_phone_select" name = "normalPhone1" id="normalPhone1" style="height: 25px; width:60px;">
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
                  </select> -
                  <input type="text" name = "normalPhone2" id="normalPhone2"  style="height: 25px; width:80px;" maxlength='4' /> - <input type="text" name = "normalPhone3" id="normalPhone3"  style="height: 25px; width:80px;" maxlength='4' />
                  </td>
               </tr>
               <tr>   
                  <td class="order_info_sub_title1">휴대전화</td>
                  <td class="order_info_sub_title2">
                  <select class="phone_select" name = "phone1" id="phone1" style="height: 25px; width:60px;">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
                  </select> - 
                  <input type="text" name = "phone2" id="phone2" style="height: 25px; width:80px;" maxlength='4' /> - <input type="text" name = "phone3" id="phone3" style="height: 25px; width:80px;" maxlength='4' />
                  </td>
               </tr>
               <tr>   
                  <td class="order_info_sub_title1" style="height: 80px">이메일</td>
                  <td class="order_info_sub_title2">
                  <input type="text" name = "email1" id="email1" style="height: 25px; width:180px;"> @ <input type="text" name = "email2" id="email2" style="height: 25px; width:180px;">
                  <select class="order_select" name = "email3" id="email" style="height: 25px; width:100px;">
                     <option value="1">직접입력</option>
                     <option value="gmail.com">gmail.com</option>
                     <option value="hanmail.net">hanmail.net</option>
                     <option value="nate.com">nate.com</option>
                     <option value="naver.com">naver.com</option>
                  </select>
                  </td>
               </tr>
            </table>
         
         
         <div class="deliver_info" id="deliver_info">
            <div class="deliver_info_title">
               배송 정보
            </div>
            
         
            <table class="deliver_info_table" style="margin-bottom: 50px;">
               <tr>   
                  <td class="deliver_info_sub_title1">배송지 선택</td>
                  <td class="deliver_info_sub_title2">
                     <label class="deliver_label"> <input type="checkbox" class="deliver_checkbox" name="deliverCheckbox" id="deliverCheckbox1" value="Y" onclick="doOpenCheck(this)" > 주문자 정보와 동일</label>
                  </td>
               </tr>
               <tr>   
                  <td class="deliver_info_sub_title1">주문자</td>
                  <td class="deliver_info_sub_title2"><input type="text" name="shipName" id="shipName" style="height: 25px; width:200px;"></td>
               </tr>
               <tr>   
                  <td class="deliver_info_sub_title1">주소</td>
                  <td class="deliver_info_sub_title2">
                  <input type="text" class="first_address" id="postal2" style="height: 25px; width:70px;" readonly><input type="button" class="post_numberBtn" onclick="execDaumPostcode2()" value="우편번호 >"><br>
                  <input type="text" id="address2" style="height: 25px; width:450px; margin-top: 10px;" placeholder="기본 주소" readonly><br>
                  <input type="text" id="deAddress2" class="last_address2" style="height: 25px; width:450px;  margin-top: 10px;" placeholder="상세 주소">
                  
                  </td>
               </tr>
               <tr>   
                  <td class="deliver_info_sub_title1">일반전화</td>
                  <td class="deliver_info_sub_title2">
                  <select class="normal_phone_select" name = "normalPhone11" id="normalPhone11" style="height: 25px; width:60px;">
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
                  </select> -
                  <input type="text" name = "normalPhone22" id="normalPhone22"  style="height: 25px; width:80px;"> - <input type="text" name = "normalPhone33" id="normalPhone33"  style="height: 25px; width:80px;">
                  </td>
               </tr>
               <tr>   
                  <td class="deliver_info_sub_title1">휴대전화</td>
                  <td class="deliver_info_sub_title2">
                  <select  class="phone_select" name = "phone11" id="phone11" style="height: 25px; width:60px;">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
                  </select> - 
                  <input type="text"  name = "phone22" id="phone22" style="height: 25px; width:80px;"> - <input type="text" name = "phone33" id="phone33" style="height: 25px; width:80px;">
                  </td>
               </tr>
               <tr>   
                  <td class="deliver_info_sub_title1" style="height: 130px">배송 메시지</td>
                  <td class="deliver_info_sub_title2">
                  <input type="textarea" id="message" style="height: 80px; width:450px;">
                  
                  </td>
               </tr>
            </table>
         </div>
         
         <div class="all_order" style="margin-bottom: 300px;">
            <table>
               <tr>
                  <td class="all_order_first">총 주문 금액</td>
                  <td class="all_order_first">배송료</td>
                  <td class="all_order_first">총 결제 예정 금액</td>
               </tr>
               <tr>
                  <td class="all_order_second"><%= result %></td>
                  <td class="all_order_second">2500</td>
                  <td class="all_order_second" name="totalPrice" value="1,000">
                  	= <%= result + 2500 %>
                  	<input type="hidden" name="totalPrice" value="<%= result + 2500 %>">
                  </td>
                  
               </tr>
               <tr>
                  <td colspan="3" class="all_order_third">
                     <input type="button" value="취소하기" class="all_orderBtn1">
                     <input type="button" value="결제하기" class="all_orderBtn2" id="all_orderBtn2" onclick="a()">
                  </td>
               </tr>
            </table>
         </div>
         
         <input type="hidden" id="userId" value="<%= loginUser.getUserId() %>">
         
            </form>
      </div>
         
      
<!--        <script>
         $('#all_orderBtn2').on('click', function(){
            window.open('insertOrderInfo.me', 'order', 'width=900, height=800');
         })
      </script>  -->
      

	<script>
	   
	   
	   function a() {
	      
	      var nameCheck = RegExp(/^[가-힣]+$/);
	      var phoneCheck = RegExp(/^01[0179][0-9]{7,8}$/);
	      var emailCheck = RegExp(/.+@[a-z]+(\.[a-z]+){1,2}$/);
	      
	      
	   
	      if(!$('#orderName').val()){
	         alert('주문자를 입력해 주세요.');
	         return false;
	      } else if(!nameCheck.test($('#orderName').val())){
	         alert('주문자는 한글로 입력해 주세요.');
	         return false;
	      } else if(!$('#postal1').val()){
	         alert('우편번호를 입력해 주세요.');
	         return false;
	      } else if(phoneCheck.test($('#normalPhone22').val() || $('#normalPhone33').val())) {
	         alert('일반전화는 숫자로 입력해 주세요.');
	         $('#normalPhone2').focus();
	         return false;
	      } else if(!$('#phone2').val() || !$('#phone3').val()){
	         alert('휴대전화를 입력해 주세요.')
	         return false;
	      } else if(phoneCheck.test($('#phone2').val() || $('#phone3').val())) {
	         alert('휴대전화는 숫자로 입력해 주세요.');
	         $('#phone2').focus();
	         return false;
	      } else if(emailCheck.test($('#email').val() || $('#email').val())) {
	         alert('이메일을 영문으로 입력해 주세요.');
	         return false;
	      } else if(!$('#shipName').val()) {
	         alert('주문자를 입력해 주세요.');
	         return false;
	      } else if(!nameCheck.test($('#shipName').val())){
	         alert('주문자는 한글로 입력해 주세요.');
	         return false;
	      } else if(!$('#postal2').val()){
	         alert('우편번호를 입력해 주세요.');
	         return false;
	      } else if(phoneCheck.test($('#normalPhone22').val() || $('#normalPhone33').val())) {
	         alert('일반전화는 숫자로 입력해 주세요.');
	         $('#normalPhone2').focus();
	         return false;
	      } else if(!$('#phone22').val() || !$('#phone33').val()){
	         alert('휴대전화를 입력해 주세요.')
	         return false;
	      } else if(phoneCheck.test($('#phone22').val() || $('#phone33').val())) {
	         alert('휴대전화는 숫자로 입력해 주세요.');
	         $('#phone2').focus();
	         return false;
	      }
	       
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      else {
	      
	         IMP.init('imp45319267');
	   
	            IMP.request_pay({
	               pg : 'inicis', // version 1.1.0부터 지원.
	               pay_method : 'card',
	               merchant_uid : 'merchant_' + new Date().getTime(),
	               name : '주문명:비긴테스트',
	               amount : 100, //판매 가격
	               buyer_email : $('#email1').val()+$('#email2').val(),
	               buyer_name : $('#shipName').val(),
	               buyer_tel : $('#phone1').val() + $('#phone2').val() + $('#phone3').val(),
	               buyer_addr : $('#address2').val()+$('#deAddress2').val(),
	               buyer_postcode : $('#postal2').val()
	            }, function(rsp) {
	               if ( rsp.success ) {
	                  //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                  jQuery.ajax({
	                     url: "ticketing/success", //cross-domain error가 발생하지 않도록 주의해주세요
	                     type: 'POST',
	                     dataType: 'json',
	                     data: {
	         
	                        //기타 필요한 데이터가 있으면 추가 전달
	                     }
	                  }).done(function(data) {
	                     //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                     if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\n결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	         
	                        alert(msg);
	                     } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                     }
	                  });
	                  //성공시 이동할 페이지
	                 $.ajax({
	                    url:'InsertCartOrder.me',
	                    data:{
	                       userId: $('#userId').val(),
	                       orderNo: new Date().getTime(),
	                       prodName:
	                       	<%
	                       		String prodNameStr = "";
	                       		for(int i = 0; i < list.size(); i++) {
	                       			if(i == 0) {
	                       				prodNameStr += list.get(i).getProdName();
	                       			} else {
	                       				prodNameStr += ", " + list.get(i).getProdName();
	                       			}
	                       		}
	                       	%>
	                       	<%= prodNameStr %>, 
	                       price: <%= result + 2500 %>,
	                       receiver: $('#shipName').val(),
	                       postal: $('#postal2').val(),
	                       address: $('#address2').val(),
	                       deAddress: $('#deAddress2').val(),
	                       normalPhone:$('#normalPhone11').val()+$('#normalPhone22').val()+$('#normalPhone33').val(),
	                       phone:$('#phone1').val() + $('#phone2').val() + $('#phone3').val(),
	                       message: $('#message').val(),
	                       amount: 
		                       	<%
		                       		int amountResult = 0;
		                       		for(int i = 0; i < list.size(); i++) {
		                       			amountResult += list.get(i).getAmount();
		                       		}
	                       		%>
	                       		<%= amountResult %>
	                    },
	                 
	                    success : function(data){
	                       alert('주문이 완료되었습니다.');
	                       location.href="CartOrderComplete.me";
	                    },
	                    error:function(data){
	                       alert("결제 실패");
	                       
	                    }
	                 });
	               } else {
	                  msg = '결제에 실패하였습니다.';
	                  msg += '에러내용 : ' + rsp.error_msg;
	                  //실패시 이동할 페이지
	                  alert(msg);
	               }
	            });
	      }
	};
	</script>
      
   <script>
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
	               document.getElementById('postal1').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('address1').value = fullRoadAddr; // 주소 
	               document.getElementById('deAddress1').focus();   // 상세 주소
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
	               document.getElementById('deAddress2').focus();   // 상세 주소
	           }
	       }).open();
	   }
	</script>
	<script>
	   
	   function checkValue(){
	      var form = document.orderForm;
	      
	      if(!checkOrderName(form.orderName.value)) {
	         return false;
	      } else if(!checkPostal(form.postal.value)) {
	         return false;
	      } else if(!checkAddress(form.address.value)){
	         return false;
	      } else if(!checkDeAddress(form.deAddress.value)){
	         return false;
	      } 
	      
	      return true
	   }
	      
	      
	      
	/*       for (var i=0; i<$("#orderName").val().length; i++)  { 
	          var chk = $("#orderName").val().substring(i,i+1); 
	
	          if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
	             alert("주문자를 정확히 입력해 주세요");
	              return false;
	          }
	
	          if(chk.match(/([^가-힣\x20])/i)){
	             alert("주문자를 정확히 입력해 주세요");
	              return false;
	          }
	
	          if($("#orderName").val() == ""){
	             alert("주문자를 정확히 입력해 주세요");
	              return false;
	
	          }
	
	      }  
	      
	   } 
	      */
	      
	      
	
	      
	      
	   
	</script>
	<script type="text/javascript">
	   
	   // 주문자 정보와 동일을 누르면 주문 정보의 정보가 배송 정보에 세팅됨
	         $(function(){
	       
	       var form = document.orderForm;
	       
	      $('#deliverCheckbox1').on('click', function(){
	         var same = this.checked;
	         
	         $('#shipName').val(same ? $('#orderName').val():'');
	         $('#phone11').val(same ? $('#phone1').val():'');
	         $('#phone22').val(same ? $('#phone2').val():'');
	         $('#phone33').val(same ? $('#phone3').val():'');
	         $('#normalPhone11').val(same ? $('#normalPhone1').val():'');
	         $('#normalPhone22').val(same ? $('#normalPhone2').val():'');
	         $('#normalPhone33').val(same ? $('#normalPhone3').val():'');
	         $('#postal2').val(same ? $('#postal1').val():'');
	         $('#address2').val(same ? $('#address1').val():'');
	         $('#deAddress2').val(same ? $('#deAddress1').val():'');
	         if(same == true){
	            $('#deliver_info input').filter('input:text').attr('readonly', true);
	         } else {
	            $('#deliver_info input').filter('input:text').removeAttr('readonly');
	         }
	         
	         
	         
	      })
	   })  
	
	
	/* 
	   var name = "";
	   var postal = false;
	   var address = false;
	   var de_address = "";
	
	   function copy(frm){
	      
	
	      
	      name = frm.orderName.value; */
	/*       postal = frm.postal1.value;
	      address = frm.address1.value;
	      de_addres s = frm.de_address.value; */
	      
	//   }
	   
	/*    function shipCopy(frm){
	      if(frm.copy.checked){
	          initValue(frm); 
	          
	          document.getElementById('shipName').value = document.getElementById('orderName').value;
	          
	          frm.deliver_checkbox1.checked = name;
	      } else {
	         frm.shipCopy.value = "";
	      }
	   } */
	   
	   
	/*     $("input[name=deliverCheckbox]").click(function(){
	      if($(this).value() == "Y"){
	         samech();
	      } else{
	         notSameCh();
	      }
	   }) */
	   
	/*    function notSameCh(){
	      $('#shipName').val('');
	      $('#phone11').val('');
	      $('#phone22').val('');
	      $('#phone33').val('');
	      $('#normalPhone11').val('');
	      $('#normalPhone22').val('');
	      $('#normalPhone33').val('');
	      $('#postal2').val('');
	      $('#address2').val('');
	      $('#deAddress2').val('');
	   } */
	   
	
	   
	</script>
	
	<script>
	   $('#deliverCheckbox2').click(function(){
	      $(".deliver_label option").prop('selected', false);
	      
	/*       $(':select:not([id=normalPhone1])').val('');
	      $(':text:not([id=normalPhone2])').val('');
	      $(':text:not([id=normalPhone3])').val('');
	      
	      $(':select:not([id=phone1])').val('');
	      $(':text:not([id=phone2])').val('');
	      $(':text:not([id=phone3])').val(''); */
	   })
	
	</script>
	
	<script>
	   function doOpenCheck(chk){
	      var obj = document.getElementsByName('deliverCheckbox');
	      for(var i = 0; i < obj.length; i++) {
	         if(obj[i] != chk) {
	            obj[i].checked =false;
	         }
	      }
	   }
	</script>
	
	
	<script>
	
	   $('#email').change(function(){ 
	      $("#email option:selected").each(function () { 
	         if($(this).val()== '1'){ 
	            $("#email2").val(''); 
	            $("#email2").attr("readonly",false);
	         }else{
	            $("#email2").val($(this).text());
	            $("#email2").attr("readonly",true); 
	         } 
	         }); 
	   });
	/*    function clickCheck(target){
	      
	      document.querySelectorAll('input[type=checkbox]').forEach(el => el.checked = false);
	   
	      target.checked = true;
	   } */
	</script>



      
</body>
</html>