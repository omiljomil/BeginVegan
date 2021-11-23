<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	User m = (User)request.getAttribute("m");
	String myId = m.getUserId();
	String myName = m.getUserName();
	String myEmail = m.getEmail();
	String myPhone = m.getPhone();
	
	String[] selected = new String[5];
	String[] splitEmail = myEmail.split("@");
	
	if(!myEmail.equals("null")) {
		
		switch(splitEmail[1]) {
		case "gmail.com": selected[0] = "selected"; break;
		case "hanmail.net": selected[1] = "selected"; break;
		case "nate.com": selected[2] = "selected"; break;
		case "naver.com": selected[3] = "selected"; break;
		default: selected[4] = "selected";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Begin Vegan</title>
<style>
	/* 정보수정 폼 */
	.layout {width:100%; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto; max-width: 1300px;}
	#space {height: 60px;}
 	#line {background: #C4C4C4; height: 2px; width: 940px;}
	#subject {font-weight: bold; height: 105px; text-align: center; font-size: 40px; padding: 20px;}
	table {margin-left: auto; margin-right: auto; height: 40px;}
	.border1 {background: #C4C4C4; height: 2px;}
	.border2 {background: #EAEAEA; height: 1px;}
	.tablelist1 {background: #F7FAF7; padding: 10px 30px 10px 30px; width: 240px; height: 70px;}
	.tablelist2 {background: #F7FAF7; padding: 10px 30px 10px 30px; width: 240px; height: 148px;}
	.tablelist3 {background: #F7FAF7; padding: 10px 30px 10px 30px; width: 240px; height: 60px;}
	.tablelist4 {background: #F7FAF7; padding: 10px 30px 10px 30px; width: 240px; height: 30px;}
	.tablelist5 {background: #F7FAF7; padding: 10px 30px 10px 30px; width: 240px; height: 20px;}
	.tablecontent1 {width: 700px; height: 70px; padding: 0px 20px 0px 20px;}
	.tablecontent2 {width: 700px; height: 148px; padding: 0px 20px 0px 20px;}
	.tablecontent3 {width: 700px; height: 60px; padding: 0px 20px 0px 20px;}
	.tablecontent4 {width: 700px; height: 30px; padding: 0px 20px 0px 20px;}
	.tablecontent5 {width: 700px; height: 20px; padding: 0px 20px 0px 20px;}
	#email1, #email2, #emailSelect, #emailCheck, #ceNum, #ceNumCheck {vertical-align: middle;}
	#emailCheck, #ceNumCheck {border: 1px solid black; background: white; width: 100px; height: 30px; font-size: 14px;}
	.modifyUserInfomation input {border: 1px solid #a4a4a4; height: 30px; margin: 3px 5px; padding: 0px 5px 0px 5px; vertical-align: middle;}
	#userId, #userName {margin: 5px;}
	#userPwd, #userPwd2 {width: 200px;}
	#checkPwd, #checkPwd2, #checkPhone, #checkEmail, #ceNumText {margin: 2px 5px; font-size: 12px;}
	#ceNumText {margin: 5px 5px 10px 5px; font-size: 12px;}
	#pwdcon {display: inline; font-size: 12px; color: #888; vertical-align: middle;}
/* 	input[name*=phone] {width: 95px;} */
	input[name=phone] {width: 150px;}
	input[name*=email] {width: 150px; vertical-align: middle;}
	select {height:30px; border-radius: 0px; border: 1px solid #A4A4A4; margin: 0px; vertical-align: middle;}
	#zipcode {width: 200px; vertical-align: middle;}
	#search-zipcode {
		font-size: 14px; background: white; color: black;
		border: 1px solid black; height:30px; width: 110px;
		vertical-align: middle;}
	input[name*=address] {width: 450px;}
	
	/* 하단 버튼 */
	#space2 {height: 105px; text-align: center;}
	#space3 {height: 70px; text-align: center;}
	
	.checkbtn {margin: 30px auto; width: 600px; display: flex; justify-content: center; margin-bottom: 100px;}
	.checkbtn button {padding: 7px 30px; margin: 0 20px; font-weight: bold;}
	#modifybtn {border: 1px solid #469536; background: #469536; color:white;}
	#deletebtn {border : 1px solid black; background: white; color: black;}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<!-- 회원 정보 수정 폼 -->
	<div class="layout" id="space"></div>
	<div class="layout" id="subject">회원 정보 수정</div>
	<form action="<%= request.getContextPath() %>/update.me" method="post" name="updateForm" onsubmit="return checkValue()">
		<table class="modifyUserInfomation">
			<tr>
				<td colspan="2" class="border1"></td>
			</tr>
			<tr>
				<td class="tablelist1"><b>아이디</b></td>
				<td class="tablecontent1">
					<span id="userId"><%= myId %></span>
					<input type="hidden" name="userId" value="<%= myId %>">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			<tr>
				<td class="tablelist1"><b>이름</b></td>
				<td class="tablecontent1">
					<span id="userName"><%= myName %></span>
					<input type="hidden" name="userName" value="<%= myName %>">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			<tr>
				<td class="tablelist1"><b>비밀번호</b></td>
				<td class="tablecontent1">
					<input type="password" id="userPwd" name="userPwd"><div id="pwdcon">영문/숫자/특수문자 조합(8-20자)</div>
					<div id="checkPwd"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			<tr>
				<td class="tablelist1"><b>비밀번호 확인</b></td>
				<td class="tablecontent1">
					<input type="password" id="userPwd2" name="userPwd2">
					<div id="checkPwd2"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			<tr>
				<td rowspan="3" class="tablelist3"><b>이메일</b></td>
				<td class="tablecontent3">
				<%
				 	if(!myEmail.equals("null")) {
				 		String[] splitE = myEmail.split("@");
				%>
					 		
					<input type="text" id="email1" name="email1" value="<%= splitE[0] %>">@<input type="text" id="email2" name="email2" value="<%= splitE[1] %>"><!-- 
					 --><select id="selectEmail" name="selectEmail">
				<%  } %>
						<option value="1" <%= selected[4] %>>직접입력</option>
						<option value="gmail.com" <%= selected[0] %>>gmail.com</option>
						<option value="hanmail.net" <%= selected[1] %>>hanmail.net</option>
						<option value="nate.com" <%= selected[2] %>>nate.com</option>
						<option value="naver.com" <%= selected[3] %>>naver.com</option>
					</select><!-- 
					--><input type="button" id="emailCheck" value="인증번호 전송">
					<div id="checkEmail"></div>
				</td>
			</tr>
			<tr>
				<td class="tablecontent4"><input type="hidden" id="ceNum"><input type=hidden id="ceNumCheck" value="인증번호 확인"></td>				
			</tr>
			<tr>
				<td class="tablecontent5"><label id="ceNumText"></label></td>				
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			<tr>
				<td class="tablelist1"><b>휴대폰 번호</b></td>
				<td class="tablecontent1">
			<% 
				if(!myPhone.equals("null")) {
// 					String[] splitPhone = myPhone.split("-");
			%>
				<input type="text" id="phone" name="phone" value="<%= myPhone %>">
<%-- 					<input type="text" id="phone1" name="phone1" value="<%= splitPhone[0] %>"><!--  --%>
<%-- 					 -->-<input type="text" id="phone2" name="phone2" value="<%= splitPhone[1] %>"><!-- --%>
<%-- 					 -->-<input type="text" id="phone3" name="phone3" value="<%= splitPhone[2] %>"> --%>
			<%	} %>
				<div id="checkPhone"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="border2"></td>
			</tr>
			
<!--
			<tr>
				<td class="tablelist2"><b>주소</b></td>
				<td class="tablecontent2">
					<div>
						<input type="text" name="zipcode" id="zipcode"><button type="button" id="search-zipcode">우편번호 검색</button>
					</div>
					<div style="border: 0px solid black;">
						<input type="text" name="address1" id="address1">
					</div>
					<div style="border: 0px solid black;">
						<input type="text" name="address2" id="address2">
					</div>
				</td>
			</tr>
-->

			<tr>
				<td colspan="2" class="border1"></td>
			</tr>
		</table>
		<div class="layout" id="space2">
			<div class="checkbtn">
				<button id="modifybtn">정보수정</button>
				<button type="button" id="deletebtn" onclick="deleteUser();">회원탈퇴</button>
			</div>
		</div>
	</form>
	<div class="layout" id="space3"></div>
	
	<script>
		$(function() {
			$('#userPwd').on('keyup keypress blur change paste input focus', function() {
				if($(this).val().length == 0 || $(this).val() == '' || $(this).val() == ' ') {
					$('#checkPwd').html('');
				} else if($(this).val().length < 8) {
					$('#checkPwd').css('color', 'red');
					$('#checkPwd').html('비밀번호를 8자 이상으로 입력해주세요.');
				} else if($(this).val().length < 10) {
					$('#checkPwd').css('color', 'orange');
					$('#checkPwd').html('비밀번호가 안전하지 않습니다.');
				} else if($(this).val().length > 10) {
					$('#checkPwd').css('color', 'blue');
					$('#checkPwd').html('안전한 비밀번호입니다.');
				}
			});
			$('#userPwd2').on('keyup keypress blur change paste input focus', function() {
				if($(this).val().length == 0 || $(this).val() == '' || $(this).val() == ' ') {
					$('#checkPwd2').html('');
				} else if($(this).val() !== $('#userPwd').val()) {
					$('#checkPwd2').css('color', 'red');
					$('#checkPwd2').html('비밀번호가 일치하지 않습니다.');
				} else if($(this).val() == $('#userPwd').val()) {
					$('#checkPwd2').css('color', 'blue');
					$('#checkPwd2').html('비밀번호가 일치합니다.');
				}
			});
			
			var num = /[0-9]*/gi;
			var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;
			var eng = /[a-zA-Z]/gi;
			var teuk = /[`~!@#$%^&*()_|+\-=?;:,.<>\{\}\[\]\\\/ 	]/gi;
			var teuk2 = /[`~!@#$%^&*()|+\=?;:,<>\{\}\[\]\\\/ 	]/gi;
			var teuk3 = /[`~!@#$%^&*()_|+\-=?;:,<>\{\}\[\]\\\/ 	]/gi;
			
// 			$('#phone1').on('change paste keyup', function() {
// 				if(teuk.test($('#phone1').val()) || eng.test($('#phone1').val()) ||	kor.test($('#phone1').val())) {
// 					$('#checkPhone').html('숫자로 입력하셔야 합니다.');
// 					$('#checkPhone').css('color', 'red');
// 				} else if($('#phone1').val().length == 0 || num.test($('#phone1').val())) {
// 					$('#checkPhone').html('');
// 				}
// 			});
// 			$('#phone2').on('change paste keyup', function() {
// 				if(teuk.test($('#phone2').val()) || eng.test($('#phone2').val()) || kor.test($('#phone2').val())) {
// 					$('#checkPhone').html('숫자로 입력하셔야 합니다.');
// 					$('#checkPhone').css('color', 'red');
// 				} else if($('#phone2').val().length == 0 || num.test($('#phone2').val())) {
// 					$('#checkPhone').html('');
// 				}
// 			});
// 			$('#phone3').on('change paste keyup', function() {
// 				if(teuk.test($('#phone3').val()) || eng.test($('#phone3').val()) || kor.test($('#phone3').val())) {
// 					$('#checkPhone').html('숫자로 입력하셔야 합니다.');
// 					$('#checkPhone').css('color', 'red');
// 				} else if($('#phone3').val().length == 0 || num.test($('#phone3').val())) {
// 					$('#checkPhone').html('');
// 				}
// 			});
			
			$('#phone').on('change paste onblur', function() {
				if(teuk.test($('#phone').val()) || eng.test($('#phone').val()) || kor.test($('#phone').val())) {
					$('#checkPhone').html('폰번호는 - 제외한 숫자로만 입력하셔야 합니다.');
					$('#checkPhone').css('color', 'red');
				} else if($('#phone').val().length == 0 || num.test($('#phone').val())) {
					$('#checkPhone').html('');
				}
			});
			$('#email1').on('change paste keyup', function() {
				if(teuk2.test($('#email1').val()) || kor.test($('#email1').val())) {
					$('#checkEmail').html('-_. 외의 특수문자와 한글은 사용할 수 없습니다.');
					$('#checkEmail').css('color', 'red');
				} else if($('#email1').val().length == 0 || !teuk2.test($('#email1').val()) || eng.test($('#email1').val()) || num.test($('#email1').val())) {
					$('#checkEmail').html('');
				}
			});
			$('#email2').on('change paste keyup', function() {
				if(teuk3.test($('#email2').val()) || kor.test($('#email2').val()) || num.test($('#email2').val())) {
					$('#checkEmail').html(' . 외의 특수문자와 한글, 숫자는 사용할 수 없습니다.');
					$('#checkEmail').css('color', 'red');
				} else if($('#email2').val().length == 0 || !teuk3.test($('#email2').val()) || eng.test($('#email2').val())) {
					$('#checkEmail').html('');
				}
			});
		});
	</script>
	
	<script>		
		$("#selectEmail").change(function() {
            if($(this).val() == "1") {
            	$("#email2").val('');
            	$("#email2").prop('readonly', false);
            } else {
                $("#email2").val($(this).val());
            	$("#email2").prop('readonly', true);
            }
        });
		
		$('#phone').on('keyup', function() {
			var input = $(this).val();
			var inputLength = input.length;
			
			if(inputLength > 11) {
				var piece = input.substring(0, 11);
				$(this).val(piece);
			}
		});
// 		$('#phone1').on('keyup', function() {
// 			var input = $(this).val();
// 			var inputLength = input.length;
			
// 			if(inputLength > 3) {
// 				var piece = input.substring(0, 3);
// 				$(this).val(piece);
// 			}
// 		});
// 		$('#phone2').on('keyup', function() {
// 			var input = $(this).val();
// 			var inputLength = input.length;
			
// 			if(inputLength > 4) {
// 				var piece = input.substring(0, 4);
// 				$(this).val(piece);
// 			}
// 		});
// 		$('#phone3').on('keyup', function() {
// 			var input = $(this).val();
// 			var inputLength = input.length;
			
// 			if(inputLength > 4) {
// 				var piece = input.substring(0, 4);
// 				$(this).val(piece);
// 			}
// 		});
		$('#userPwd').on('keyup', function() {
			var input = $(this).val();
			var inputLength = input.length;
			
			if(inputLength > 20) {
				var piece = input.substring(0, 20);
				$(this).val(piece);
				alert('20자까지 입력할 수 있습니다.');
			}
		});
		$('#userPwd2').on('keyup', function() {
			var input = $(this).val();
			var inputLength = input.length;
			
			if(inputLength > 20) {
				var piece = input.substring(0, 20);
				$(this).val(piece);
				alert('20자까지 입력할 수 있습니다.');
			}
		});
	</script>
	
	<script>
		$('#emailCheck').click(function() {
			if($('#email1').val() != '' && $('#email2').val() != '') {
				var email = $('#email1').val() + '@' + $('#email2').val();
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
					error:function(data) {
						
					}
				});
			} else {
				alert("이메일을 적어주세요.");
			}
		});
		
		var isEmailCheck = false;
		
		$('#ceNumCheck').on('click', function() {
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
		
		function checkValue() {
			var form = document.updateForm;
			
			var num = /[0-9]/gi;
			var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;
			var eng = /[a-zA-Z]/gi;
			var teuk = /[`~!@#$%^&*()_|+\-=?;:,.<>\{\}\[\]\\\/ 	]/gi;
			var teuk2 = /[`~!@#$%^&*()|+\=?;:,<>\{\}\[\]\\\/ 	]/gi;
			var teuk3 = /[`~!@#$%^&*()_|+\-=?;:,<>\{\}\[\]\\\/ 	]/gi;
			var phone1 = document.getElementById('phone1');
			var phone2 = document.getElementById('phone2');
			var phone3 = document.getElementById('phone3');
			var email1 = document.getElementById('email1');
			var email2 = document.getElementById('email2');
			
			if(!form.userPwd.value) {
				alert('비밀번호를 입력하세요');
				form.userPwd.focus();
				return false;
			} else if(!form.userPwd2.value) {
				alert('비밀번호 확인를 입력하세요');
				form.userPwd2.focus();
				return false;
			} else if(form.userPwd.value != form.userPwd2.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.userPwd2.focus();
				return false;
			} else if(form.userPwd.value.length < 8) {
				alert('비밀번호를 8자 이상으로 입력해주세요.');
				form.userPwd.focus();
				return false;
			} else if(!form.email1.value) {
				alert("메일 주소를 입력하세요.");
	            form.email1.focus();
	            return false;
			} else if(!form.email2.value){
	            alert("메일 주소를 입력하세요.");
	            form.email2.focus();
	            return false;
// 			} else if(!form.phone1.value) {
// 				alert("휴대폰 번호를 입력하세요.");
// 				form.phone1.focus();
// 				return false;
// 			} else if(form.phone1.value.length < 3) {
// 				alert("3자로 입력하세요.");
// 				form.phone1.focus();
// 				return false;
// 			} else if(!form.phone2.value) {
// 				alert("휴대폰 번호를 입력하세요.");
// 				form.phone2.focus();
// 				return false;
// 			} else if(form.phone2.value.length < 4) {
// 				alert("4자로 입력하세요.");
// 				form.phone2.focus();
// 				return false;
// 			} else if(!form.phone3.value) {
// 				alert("휴대폰 번호를 입력하세요.");
// 				form.phone3.focus();
// 				return false;
// 			} else if(form.phone3.value.length < 4) {
// 				alert("4자로 입력하세요.");
// 				form.phone3.focus();
// 				return false;
			} else if(!form.phone.value) {
				alert("휴대폰 번호를 입력하세요.");
				form.phone.focus();
				return false;
			} else if(form.phone.value.length < 11) {
				alert("휴대폰 번호를 11자로 입력하세요.");
				form.phone.focus();
				return false;
			}
			
// 			if(teuk.test(phone1.value) || eng.test(phone1.value) ||	kor.test(phone1.value)) {
// 				alert('숫자로 입력하셔야 합니다.');
// 				phone1.value = '';
// 				phone1.focus();
// 				return false;
// 			} else if(teuk.test(phone2.value) || eng.test(phone2.value) || kor.test(phone2.value)) {
// 				alert('숫자로 입력하셔야 합니다.');
// 				phone2.value = '';
// 				phone2.focus();
// 				return false;
// 			} else if(teuk.test(phone3.value) || eng.test(phone3.value) || kor.test(phone3.value)) {
// 				alert('숫자로 입력하셔야 합니다.');
// 				phone3.value = '';
// 				phone3.focus();
// 				return false;
			if(teuk.test(phone.value) || eng.test(phone.value) ||	kor.test(phone.value)) {
				alert('휴대폰 번호는 - 제외한 숫자로 입력하셔야 합니다.');
				phone.value = '';
				phone.focus();
				return false;
			} else if(teuk2.test(email1.value) || kor.test(email1.value)) {
				alert('-_.외의 특수문자와 한글은 사용할 수 없습니다.');
				email1.focus();
				return false;
			} else if(teuk3.test(email2.value) || kor.test(email1.value) || num.test(email2.value)) {
				alert('.외의 특수문자와 한글, 숫자는 사용할 수 없습니다.');
				email2.focus();
				return false;
			} else if($('#ceNum').val() == '' || $('#ceNum').val().length == 0) {
				alert('이메일 인증 해주세요.');
				return false;
			} else if(!isEmailCheck) {
				alert('인증번호를 확인해주세요.');
				return false;
			} else {
				alert('정보 수정이 성공적으로 완료되었습니다^^');
				return true;
			}
		}
	</script>
	
	<script>
		function deleteUser() {
			var bool = confirm("정말 탈퇴하시겠습니까? \n '확인'을 누르면 비밀번호 입력창으로 넘어갑니다.");
			
			if(bool) {
				location.href='<%= request.getContextPath() %>/deleteForm.me';
			}
		}
	</script>
	
	<%@ include file="../common/bottontitle.jsp" %>	
</body>
</html>