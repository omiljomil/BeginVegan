<%@page import="question.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		Question q = (Question)request.getAttribute("q");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.insertTitle {
	display: flex;
	width: 1300px;
	margin: 30px auto;
	justify-content: space-between;
}

.insertTable1 {
	display: flex;
	margin: 0 auto;
	width: 1300px;
	justify-content: flex-start;
}

.insertTable1 td {
	border: 1px solid black;
	text-align: center;
	padding: 5px;
}

.insertTable1 td input {
	border-style: none;
	border-bottom: 1px solid #cccccc;
}

.QuestionTextArea {
	width: 1300px;
	margin: 20px auto;
}

h3 {
	margin-top: 20px;
	margin-left: 140px;
}

.inputarea {
	margin-left: 140px;
}

.select_img {
	margin: 20px 0;
}

#contentImgArea1 {
	width: 150px;
	height: 100px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.quesImgArea {
	width: 1300px;
	margin: 30px auto;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div style="border-top: 2px solid #909090;">
		<div class="insertTitle">
			<div style="font-size: 30px; font-weight: bold;">문의사항</div>
			<div style="margin-left: 350px;">
				<a href="<%= request.getContextPath()%>">홈</a>--><a href="<%= request.getContextPath()%>/community.me">커뮤니티</a>--> <a href="questionList.bo">문의 사항</a>
			</div>

		</div>
		<form action="<%= request.getContextPath()%>/insertQuestion.qs" method="post">
		<div class="insertTable1">
			<table>
				<tr>
					<td>말머리</td>
					<td><select name="brackets" id="brackets">
						<option value="(주문)">주문</option>
						<option value="(회원 정보)">회원 정보</option>
						<option value="(제품)">제품</option>
						<option value="(기타)">기타</option>
					</select></td>

				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2" width="260px;"><input type="text" name="title"/></td>

				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><input type="text"  value="<%= loginUser.getUserId() %>" disabled/>
									<input type="hidden" name="userId" value="<%= loginUser.getUserId()%>"/></td>
				</tr>
			</table>
		</div>
		<h3 style="margin-top: 20px;">문의 작성</h3>
		<div class="QuestionTextArea">
			<textarea name="questionContent" id="questionContent" cols="140"rows="13"></textarea>
		</div>
		<div><input type="submit" value="등록하기"/></div>
		</form>
		<!-- 
		<div class="quesImgArea">
			<label for="quesImg"> -이미지 등록- </label>

			<div id="contentImgArea1">
				<img id="contentImg1" width="400" height="300">
			</div>

			<input type="file" id="quesImg" name="quesImg" />

		</div>
 -->



	</div>
</body>
<script>
/*
	$('#quesImg').change(function(){
			
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				$('#contentImg1').attr("src",data.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	

	$(function(){
		$("#quesImg").hide();
		
		$("#contentImgArea1").click(function(){
			$("#quesImg").click();
		});
	});
	*/
	
	
	</script>
	
</html>