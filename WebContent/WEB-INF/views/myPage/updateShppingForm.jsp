<%@page import="User.model.vo.Shpping"%>
<%@page import="User.controller.loginUserServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	Shpping s = (Shpping)request.getAttribute("s");
    	String checked=null;
    	if(s.getBasics().equals("Y")){
    		checked="checked";
    	}else{
    		checked="";
    	}
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<style>
.shppingimg {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 5px 25px;
	width: 420px;
	height: 30px;
}

.shppingTable {
	border-spacing: 15px;
	margin-left: 10px;
	border-bottom: 1px solid #909090;
}

.shppingTable th {
	border-top: 2px solid yellowgreen;
	border-bottom: 1px solid yellowgreen;
	padding: 10px;
}

.shppingTable td {
	font-size: 12px;
	width: 85px;
}

.shppingTable td input {
	padding: 6px;
	border: 1px solid #cccccc;
}

form input[type=button] {
	border-style: none;
	background-color: yellowgreen;
	color: white;
	padding: 4px;
	padding-bottom: 7px;
}

.diBtn input {
	padding: 10px;
	width: 100px;
	margin: 15px;
}
</style>
<body>
	<form name="insertSP" id="insertSP">
		<div class="shppingimg">
			<div>
				<img src="<%=request.getContextPath() %>/img/logo.png"
					align="middle" width="120px;" height="60px;" />
			</div>

		</div>
		<table class="shppingTable">
			<tr>
				<th colspan="2"
					style="border-bottom: 1px solid #909090; padding-bottom: 10px;">배송지
					상세 등록</th>
			</tr>
			<tr>
				<td>배송지명</td>
				<td><input type="text" name="alias" id="alias"
					value="<%= s.getAlias()%>" /></td>
			</tr>
			<tr>
				<td>수령인</td>
				<td><input type="text" name="recipient" id="recipient"
					value="<%= s.getRecipient()%>" /></td>
			</tr>
			<tr>
				<td rowspan="3" style="vertical-align: top;">주소</td>
				<td><input type="text" style="width: 100px;" name="postal"
					id="postal" value="<%= s.getPostal_code()%>" /><input type="button"
					value="주소검색" onclick="execDaumPostcode()"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" style="width: 300px;"
					name="address" id="address" value="<%= s.getAddress()%>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" style="width: 300px;"
					name="de_address" id="de_address" placeholder="상세주소"
					value="<%= s.getDe_address()%>" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="tel" style="width: 230px;" name="sp_Phone"
					id="sp_Phone" placeholder="'-'를 빼고 적어주세요."
					value="<%= s.getSp_phone()%>" /></td>
			</tr>
			<tr>
				<td><div>기본 배송지</div></td>
				<td><input type="checkbox" name="basics" id="basics"
					<%= checked %> />기본 배송지로 설정</td>


			</tr>
		</table>
		<div style="margin-left: 10px; margin-top: 10px; font-size: 12px;">입력/수정하신
			배송지는 배송지 목록에 저장됩니다.</div>
		<div align="center" class="diBtn">
			<input type="hidden" name="ship_no" id="ship_no"
				value="<%=s.getShip_no()%>" /> <input type="button"
				onclick="window.close()" value="취소"
				style="border: 1px solid black; color: black; background-color: white;" />
			<input type="button" value="수정" onclick="sbBtn();" id="submitclose" />
		</div>


	</form>
</body>
<script>
	function sbBtn(){
		 var form = document.insertSP;
		 var checked = null;

		if($("#basics").is(":checked") == true){
			checked = 'Y';
		}else{
			checked = 'N';
		}
	        if(!form.alias.value){
	            alert("배송지명을 입력하세요.");
	            return false;
	        }

	        
	        if(!form.recipient.value){
	            alert("수령인을 입력하세요.");
	            return false;
	        }
	        

	        
	        if(!form.postal.value || !form.address.value){
	            alert("주소를 입력하세요.");
	            return false;
	        }
	        
	        
	        if(!form.sp_Phone.value){
	            alert("전화번호를 입력하세요.");
	            return false;
	        }
	        
	        
	        
	        $.ajax({
	        	url:'<%=request.getContextPath() %>/updateAddress.me',
	        	data:{ship_no:$('#ship_no').val(),alias:$('#alias').val(),recipient:$('#recipient').val(),postal:$('#postal').val(),
	        		address:$('#address').val(),de_address:$('#de_address').val(),sp_Phone:$('#sp_Phone').val(),
	        		basics:checked,userId:$('#userId').val()},
	        		success:function(data){
	        			opener.parent.location.reload();
	        			window.close();
	        		},
	        		error:function(data){
	        			console.log(data);
	        		}
	        });
		
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
            document.getElementById('postal').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullRoadAddr;
            document.getElementById('de_address').focus();
        }
    }).open();
}

	$('#sp_Phone').on('change paste keyup',function(){
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^0-9]/gi,''));	
	});
	
	
</script>


</html>