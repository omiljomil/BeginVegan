<%@page import="question.model.vo.Question_Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="question.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		Question q = (Question)request.getAttribute("q");
		ArrayList<Question_Comment> list = (ArrayList<Question_Comment>)request.getAttribute("list");
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
		background-color: white;
		text-align: center;
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
	.deleteBtn{
		display: flex;
		margin : 0 auto;
		width: 820px;
		justify-content : flex-end;
	}
	.replySelectArea{
		width: 1059px;
		margin: 0 auto 0 140px;
		
	}
	#replyQuestionSelectTable{
		border-spacing: 10px;
		border-collapse: separate;
	}
	
	#replyQuestionSelectTable tr td{
		font-size : 16px;
		padding: 5px;
	}
	#replyQuestionSelectTable tr:nth-child(even)>td{

		border-bottom: 1px solid #cccccc;
	}
	#replyQuestionSelectTable tr td span{
		color : #909090;
		font-size : 12px;
		padding-left: 5px;
	}
	#replyQuestionSelectTable tr td input{
		color : red;
		font-size : 8px;
		padding-left: 5px;
		border-style: none;
		background-color: white;
	}
	
	
	.replyInsert{
		background-color: #cccccc;
			padding: 10px;
			margin: 10px auto 10px 140px;
			width: 1059px;
	}
	.questionTitle a{
		color: black;
		text-decoration: none;
	}
	
	
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div style="border-top: 2px solid #909090;">
		<div class="insertTitle">
			<div style="font-size: 30px; font-weight: bold;">문의사항</div>
			<div style="margin-left: 350px;" class="questionTitle">
				<a href="<%= request.getContextPath()%>">홈</a>--><a href="<%= request.getContextPath()%>/community.me">커뮤니티</a>--> <a href="questionList.bo">문의 사항</a>
			</div>

		</div>
		<form action="<%= request.getContextPath()%>/insertQuestion.qs" method="post">
		<div class="insertTable1">
			<table>
				<tr>
					<td>말머리</td>
					<td><input type="text" value="<%= request.getAttribute("brackets")%>" disabled/>
						<input type="hidden" name="brackets" value="<%= request.getAttribute("brackets")%>"/>
					</td>

				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2" width="260px;">
						<input type="text"  value="<%= request.getAttribute("title")%>" disabled/>
						<input type="hidden" name="title" value="<%= request.getAttribute("title")%>"/>
													
					</td>

				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><input type="text"  value="<%= q.getUser_id() %>" disabled/>
									<input type="hidden" name="userId" value="<%= q.getUser_id()%>"/></td>
				</tr>
			</table>
		</div>
		<h3 style="margin-top: 20px;">문의 작성</h3>
		<div class="QuestionTextArea">
			<textarea id="questionContent" cols="140"rows="13" disabled><%=q.getQst_cont() %></textarea>
			<input type="hidden" name="questionContent" value="<%=q.getQst_cont() %>"/>
		</div>
			<div class="deleteBtn"><input type="button" value="삭제하기" onclick="deleteQuestion()" /></div>
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
 		
 		<div class="replyArea">
 			<div class="replyInsert">
	 			<table class="replyContent">
	 			
	 				<tr><td>댓글 작성</td></tr>
	 				<tr>
	 					<td><textarea name="replyQuestion" id="replyQuestion" cols="110" rows="3"></textarea></td>
	 				</tr>
	 				<tr><td><button id="replyQuestionBtn">comment</button></td></tr>
	 			</table>
 			</div>
 		</div>
		<div class="replySelectArea">
			<table id="replyQuestionSelectTable">
				
				<%if(list.isEmpty()){ %>
					<tr><td colspan="3">댓글이 없습니다.</td></tr>
				<%}else{ %>
					<%for(int i = 0; i<list.size(); i++){ %>			
						<tr>
							<td width="50px"><%=list.get(i).getUser_id() %>
								<span><%=list.get(i).getEnroll_date() %></span>
								<%if(list.get(i).getUser_id().equals(loginUser.getUserId())){ %>
									<input type="button" onclick="deleteReply(<%=list.get(i).getQst_comt_no() %>);" value="x">
								<%}%>
									
							</td>
						</tr>
						<tr>
							<td colspan="2" width="400px" class="contentTable"><%=list.get(i).getQst_cont() %></td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>


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
	
	function deleteQuestion(){
		var bool = confirm("정말 삭제하시겠습니까?");
		if(bool){
			location.href='<%= request.getContextPath()%>/deleteQuestion.qs?qId=<%= q.getQst_no()%>'
		}
	}
	$('#replyQuestionBtn').on('click',function(){
		
		var writer = '<%= loginUser.getUserId()%>';
		
		var content = $('#replyQuestion').val();
		var qId = '<%= q.getQst_no()%>';
		
		$.ajax({
			url:'insertQuestionCommont.qs',
			data:{writer:writer,content:content,qId:qId},
			success:function(data){
				$replyTable = $('#replyQuestionSelectTable');
				$replyTable.html('');
				for(var i in data){

					var $tr = $('<tr>');
					var $td = $('<td>');
					
					var $writerTd = $td.text(data[i].user_id).css("width",'50px');
					
					$td.append($('<span>').text(data[i].medify_date));
					$tr.append($td);
					$replyTable.append($tr);
					$tr = $('<tr>');
					var $contentTd = $('<td .contentTable>').text(data[i].qst_cont).css("width",'400px');
					$tr.append($contentTd);
					$replyTable.append($tr);
				}
				$('#replyQuestion').val("");
			},
			error:function(data){
				console.log(data);
			}
		});
	});
	
	function deleteReply(de){
		var bool = confirm("정말 삭제하시겠습니까?");
		if(bool){
			$.ajax({
				url:'deleteQuestionComment.qs',
				data:{no:de},
				success:function(data){
					window.location.reload();
				},
				error:function(data){
					a;ert("삭제하지 못했습니다.")
				}
			});
		}
		
	}
	</script>
	
</html>