<%@page import="page.PageInfo"%>
<%@page import="question.model.vo.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
    ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("q");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.questionmain {
	width: 100%;
	border-top: 2px solid #909090;
}

.questionTitle {
	padding-top: 30px;
	display: flex;
	width: 1100px;
	margin: 0 auto;
	justify-content: flex-end;
}

.questionSelectList {
	display: flex;
	width: 1300px;
	justify-content: flex-start;
	margin: 0 auto;
}

.questionTable table {
	width: 1300px;
	margin: 30px auto;
}

.questionTable th {
	text-align: center;
}

.questionTable th, td {
	border: 1px solid black;
}

.questionInsert {
	display: flex;
	width: 1300px;
	margin: 0 auto;
	justify-content: flex-end;
}
.pagingArea input, button {
	background: white;
	width: 40px;
	height: 40px;
	font-size: 14px;
	color: black;
	border: 0px;
}
.questionsubTitle a{
	color: black;
	text-decoration: none;
}
#listArea tr td{
	text-align: center;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="questionmain">
		<div class="questionTitle">
			<div style="font-size: 30px; font-weight: bold;">문의사항</div>
			<div class="questionsubTitle" style="margin-left: 350px;">
				<a href="<%= request.getContextPath()%>">홈</a>--><a href="<%= request.getContextPath()%>/community.me">커뮤니티</a>--> <a href="questionList.bo">문의 사항</a>
			</div>
		</div>
	</div>
	
	<div class="questionTable">
		<table border="1" id="listArea" >
			<tr>
				<th width="100px;">번호</th>
				<th width="700px;">제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<% if(list.isEmpty()){ %>
			<tr align="center">
				<td colspan="5">문의사항이 없습니다.</td>
			</tr>
			<%}else{ %>
				
				<%for(Question q : list){ %>
				<tr>
					<td><%=q.getQst_no() %></td>
						<%if(loginUser == null){ %>
							<td>(비밀글)<%=q.getQst_title() %><input type="hidden" value="N"/></td>
						<%}else if(loginUser.getManager().equals("Y")){ %>
							<td><%=q.getQst_title() %><input type="hidden" value="Y"/></td>
						<%}else if(!loginUser.getUserId().equals(q.getUser_id()) ){ %>
							<td>(비밀글)<%=q.getQst_title() %></td>
						<%}else{ %>
							<td><%=q.getQst_title() %><input type="hidden" value="Y"/></td>
							
						<%} %>
					<td><%=q.getUser_id().replaceAll("(?<=.{3}).", "*") %></td>
					<td><%=q.getEnroll_date() %> <input type="hidden" value="<%= q.getQst_no()%>"/></td>
					
				</tr>
				<%} %>
			<%} %>
		</table>
		<div class="questionInsert">
			<input type="button" id="questionInsertBtn" onclick="insertQuestion();" value="글쓰기" />
		</div>
	</div>
	
	<div class="pagingArea" align="center">
		<!-- 맨 처음으로 -->
		<input type="button" id="firstBtn"
			onclick="location.href='<%= request.getContextPath()%>/questionList.bo?curentPage=1'"
			value="처음">
		<script>
			if(<%= pi.getCurrentPage() %> == 1) {
				$('#firstBtn').prop('disabled', true);
				$('#firstBtn').css({'cursor':'text', 'color':'#bbb'});
			}
		</script>
		<!-- 이전 페이지로 -->
		<input type="button" id="beforeBtn"
			onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%=pi.getCurrentPage()-1%>'"
			value="이전">
		<script>
			if(<%= pi.getCurrentPage() %> <= 1) {
				$('#beforeBtn').prop('disabled', true);
				$('#beforeBtn').css({'cursor':'text', 'color':'#bbb'});
			}
		</script>
		<!-- 숫자 버튼 -->
		<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
		<% if(p == pi.getCurrentPage()) { %>
		<input type="button" id="choosen" disabled value="<%= p %>">
		<% } else { %>
		<input type="button" id="numBtn"
			onclick="location.href='<%=request.getContextPath()%>/questionList.bo?currentPage=<%=p%>'"
			value="<%= p %>">
		<% } %>
		<%  } %>
		<!-- 다음 페이지로 -->
		<input type="button" id="afterBtn"
			onclick="location.href='<%= request.getContextPath()%>/questionList.bo?currentPage=<%=pi.getCurrentPage()+1%>'"
			value="다음">
		<script>
			if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
				$('#afterBtn').prop('disabled', true);
				$('#afterBtn').css({'cursor':'text', 'color':'#bbb'});
			}
		</script>
		<!-- 맨 끝으로 -->
		<input type="button" id="lastBtn"
			onclick="location.href='<%=request.getContextPath()%>/questionList.bo?curentPage=<%=pi.getMaxPage()%>'"
			value="끝">
		<script>
			if(<%= pi.getCurrentPage() %> == <%= pi.getMaxPage() %>) {
				$('#lastBtn').prop('disabled', true);
				$('#lastBtn').css({'cursor':'text', 'color':'#bbb'});
			}
		</script>
	</div>
</body>
<script>
	$('#questionInsertBtn').on('click',function(){
		if(<%=loginUser!=null%>){
			location=href="<%= request.getContextPath()%>/insertQuestionForm.qs";
		}else{
			alert("회원만 가능합니다.");
			location.href="<%= request.getContextPath()%>/loginForm.me";
		}
	});
	$('#listArea td').mouseenter(function(){
		$(this).parent().css({'background':'darkgray','cursor':'pointer'});
	}).mouseout(function(){
		$(this).parent().css({'background':'none'});
	}).click(function(){
		var qId = $(this).parent().children().eq(3).children().val();
		var check = $(this).parent().children().eq(1).children().val();

			if(check=="Y"){
				location.href='<%= request.getContextPath() %>/questionDetailForm.qs?qId=' + qId;
			}else{
				alert('비밀글입니다.');
			}
		});
	
	
	
</script>
</html>