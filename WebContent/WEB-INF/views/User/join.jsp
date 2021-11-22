<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
	margin: 0 auto;
	width: 950px;
	justify-content: center;
	border-collapse: collapse;
	border-top: 1px solid #606060;
}

.checktd {
	border-bottom-width: 0px;
}

input[type=password] {
	padding-bottom: 0px;
	margin-bottom: 0px;
}

table tr td {
	border-bottom: 1px solid #606060;
	padding: 5px;
}

table tr td label {
	font-size: 4px;
	padding-top: 0px;
}

.jointitle {
	background: #EEEEEE;
	width: 230px;
	padding-left: 50px;
	font-size: 14px;
}

table tr input {
	margin: 5px;
	border: 1px solid #999;
	padding: 5px;
}

#pwdcon {
	font-size: 2px;
	display: inline;
	color: #999;
}

.phone {
	width: 80px;
}

.labeltd {
	padding-top: 0px;
	padding-left: 10px;
}

.checkbtn {
	margin: 30px auto;
	width: 600px;
	display: flex;
	justify-content: center;
	margin-bottom: 100px;
}

.checkbtn button {
	padding: 7px 30px;
	margin: 0 20px;
	border-style: none;
}

#deletebtn {
	border: 1px solid #999;
}

.headjoin {
	width: 600px;
	margin: 60px auto;
	display: flex;
	justify-content: center;
	font-size: 40px;
	margin-bottom: 20px;
}

.must {
	color: red;
	font-size: 15px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div class="headjoin">회원 가입</div>
	<form action="<%= request.getContextPath() %>/insertJoinServlet.me"
		method="post" name="joinForm" onsubmit="return checkValue()">
		<table>

			<tr>
				<td class="jointitle" rowspan="2"><label class="must">*</label>아이디</td>
				<td class="checktd"><input type="text" name="userId"
					id="userId" style="width: 180px;" />
				<div id="pwdcon">4자리 이상</div></td>
			</tr>
			<tr>
				<td class="labeltd"><label id="idCheck">아이디를 입력해주세요.</label></td>
			</tr>
			<tr>
				<td class="jointitle"><label class="must">*</label>이름</td>
				<td><input type="text" name="username" id="username"
					style="width: 180px;" />
			</tr>
			<tr>
				<td rowspan="2" class="jointitle"><label class="must">*</label>비밀번호</td>
				<td class="checktd"><input type="password" name="userPwd"
					id="userPwd" />
				<div id="pwdcon">영문/숫자/특수문자 조합(8-20자)</div></td>
			</tr>
			<tr>
				<td class="labeltd"><label id="pwdCheck1">비밀번호를 입력해주세요.</label></td>
			</tr>
			<tr>
				<td rowspan="2" class="jointitle"><label class="must">*</label>비밀번호
					확인</td>
				<td class="checktd"><input type="password" name="userPwd2"
					id="userPwd2" /></td>
			</tr>
			<tr>
				<td class="labeltd"><label id="pwdCheck2"></label></td>
			</tr>
			<tr>
				<td class="jointitle" rowspan="3"><label class="must">*</label>이메일</td>
				<td class="checktd"><input type="text" style="width: 150px;"
					id="email1" name="email1" /> @ <input type="text" name="email2"
					id="email2" style="width: 150px;" /> <select name="email3"
					id="email">
						<option value="1">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
				</select> <input type="button" id="emailCheck" value="인증번호 전송" /></td>
			</tr>
			<tr>
				<td class="checktd"><input type="hidden" id="ceNum" /><input
					type=hidden id="ceNumCheck" value="인증번호 확인" /></td>
			</tr>
			<tr>
				<td class="labeltd"><label id="ceNumText" /></label></td>
			</tr>
			<tr>
				<td class="jointitle"><label class="must">*</label>휴대폰 번호</td>
				<td><input type="tel" class="phone" name="phone"
					style="width: 320px;"></td>
			</tr>
			<!--  
			<tr>
				<td rowspan="3" class="jointitle">주소</td>
				<td style="border-style: none; "><input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
			</tr>
			<tr>
				<td style="border-style: none;"><input type="text" id="sample4_roadAddress" placeholder="도로명주소" style=" width:350px; "></td>
				
			
			</tr>
			<tr>
				<td><input type="text" id="sample4_detailAddress" placeholder="상세주소" style=" width:350px; "></td>
				
			</tr>
			-->
		</table>
		<div class="checkbtn">
			<button type="submit" name="joinBtn" id="joinBtn"
				style="background: #469536; color: white;">회원가입</button>
			<button type="button" id="deletebtn"
				style="background: white; color: #606060;" onclick="history.back()">취소</button>

		</div>
	</form>
	<br>
	<footer>
		<%@ include file="../common/bottontitle.jsp"%>
	</footer>
	<!-- 
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                
                
                

                var guideTextBox = document.getElementById("guide");
                
            }
        }).open();
    }
</script>
 -->
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
</script>

	<script>
	function checkValue(){

        var form = document.joinForm;
    	
        if(!form.userId.value){
            alert("아이디를 입력하세요.");
            return false;
        }

        
        if(!form.username.value){
            alert("이름을 입력하세요.");
            return false;
        }
        

        
        if(!form.userPwd.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if(form.userPwd.value != form.userPwd2.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }    

        
        if(!form.email1.value || !form.email2.value ||form.email3.value=="1" ){
            alert("메일 주소를 입력하세요.");
            return false;
        }
       
        
        if(!form.phone.value){
            alert("전화번호를 입력하세요.");
            return false;
        }
        
        if(isNaN(form.phone.value)){
            alert("전화번호는 - 제외한 숫자만 입력해주세요.");
            return false;
        }
        if(!isIdCheck){
    		alert("아이디 중복을 확인해주세요.");
    		return false;
    	}else if(!isPwdCheck){
    		alert("비밀번호를 확인해주세요.");
    		return false;
    	}else if(!isEmailCheck){
    		alert("인증번호를 확인해주세요.");
    		return false;
    	}else{
    		return true;
        
	}
	}
       
    
	
	var isIdCheck = false;
	var isPwdCheck = false;
	var isEmailCheck = false;
	var key = false;
	var userId = $('#userId');
	
	$(userId).on('change paste keyup',function(){
		isIdCheck = false;
	});
	
	$(userId).change(function(){
	if(!userId || userId.val().length < 4){
		alert("아이디는 최소 4자리 이상이어야 합니다.");
		userId.focus();
	}else{
		$.ajax({
			url:'checkId.me',
			data:{inputId:userId.val()},
			success : function(data){
				if(data.trim()=='0'){
					$('#idCheck').text('사용가능한 아이디 입니다.');
					$('#idCheck').css({'color':'green','float':'left','display':'inline-block'});
					isIdCheck = true;
				}else{
						$('#idCheck').text('사용 불가능한 아이디 입니다.');
						$('#idCheck').css({'color':'red','float':'left','display':'inline-block'});
						isIdCheck = false;
						userId.focus();
					
				}
			},
			error:function(data){
				
			}
		});
	}
});
	$('#userPwd').on('chage paste keyup',function(){
		var pw = $(this).val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		 if(pw.length < 8 || pw.length > 20){
			$('#pwdCheck1').text("8자리 ~ 20자리 이내로 입력해주세요.");
			$('#pwdCheck1').css({'color':'red','float':'left','display':'inline-block'});
			isPwdCheck = false;
		 }else if(pw.search(/\s/) != -1){
		 	 $('#pwdCheck1').text("비밀번호는 공백 없이 입력해주세요.");
				$('#pwdCheck1').css({'color':'red','float':'left','display':'inline-block'});
				isPwdCheck = false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
		 		 $('#pwdCheck1').text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				$('#pwdCheck1').css({'color':'red','float':'left','display':'inline-block'});
				isPwdCheck = false;
		 }else {
			console.log("통과"); 
			isPwdCheck = true;
			$('#pwdCheck1').text("안전한 비밀번호 입니다.");
			$('#pwdCheck1').css({'color':'green','float':'left','display':'inline-block'});
		 }
	});
	
	$('#userPwd2').on('chage paste keyup',function(){
		if($('#userPwd2').val() !=$('#userPwd').val()){
			$('#pwdCheck2').text("비밀번호가 다릅니다.");
			$('#pwdCheck2').css({'color':'red','float':'left','display':'inline-block'});
		}else{
			$('#pwdCheck2').text("비밀번호가 같습니다.");
			$('#pwdCheck2').css({'color':'green','float':'left','display':'inline-block'});
		}
	});
	
	$('#emailCheck').click(function(){
		if($('#email1').val() !="" && $('#email2').val() !="" && $('#email3').val() != '1'){
		var email = $('#email1').val() + "@" + $('#email2').val();
		$.ajax({
			url:'checkEmail.me',
			data:{email:email},
			success : function(data){
					console.log(data.key);
					key = data.key;
					$('#ceNum').prop('type','text');
					$('#ceNumCheck').prop('type','button');
					alert("메일 인증번호를 보냈습니다.");	
			},
			error:function(data){
				
			}
		});
	}else{
		alert("이메일을 적어주세요.")
	}
	});
	
	
	$('#ceNumCheck').on('click',function(){
		if($('#ceNum').val() == key){
			isEmailCheck = true;
			$('#ceNumText').text("인증되었습니다.");
			$('#ceNumText').css({'color':'green','float':'left','display':'inline-block'});
		}else{
			isEmailCheck = false;
			$('#ceNumText').text("인증번호가 다릅니다.");
			$('#ceNumText').css({'color':'red','float':'left','display':'inline-block'});
		}
	});
	
	
		



	
</script>

</body>
</html>