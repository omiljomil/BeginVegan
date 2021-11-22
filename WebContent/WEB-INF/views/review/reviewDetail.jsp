<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="review.model.vo.*, java.util.*,User.model.vo.*"%>

<%
Review r=(Review)request.getAttribute("review");
String userName=r.getUserName();
 ArrayList<Photo> f=(ArrayList<Photo>)request.getAttribute("fileList"); 
 System.out.println(userName);
 
  %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>상품후기 상세 페이지</title>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
<style>
* {
	box-sizing: border-box;
}

section {
	margin-top: 100px;
}

body {
	margin: 0 auto;
	font-family: sans-serif;
}

#review-title {
	margin-left: 140px;
	font-size: 70px;
}

#route {
	position: relative;
	display: flex;
	justify-content: right;
	bottom: 100px;
	right: 150px;
	font-size: 29px;
	color: gray;
}

#route a {
	text-decoration: none;
	color: gray;
}

#route a:hover {
	color: yellowgreen;
}

#review-porduct {
	position: relative;
	margin-left: 150px;
	margin-bottom: 100px;
	border: 2px solid gray;
	width: 550px;
	height: 200px;
}

#review-product-image {
	display: inline-block;
	border-collapse: separate;
	border-right: 2px solid gray;
	width: 200px;
	height: 200px;
}

#review-product-image img {
	width: 198px;
	height: 195px;
}

#product-title {
	display: inline-block;
	width: 350px;
	height: 80px;
	position: absolute;
	font-size: 23px;
	padding-left: 40px;
	margin-top: 30px;
	border-bottom: 2px solid gray;
}

#review-porduct button {
	border: 2px solid gray;
	position: absolute;
	left: 50%;
	top: 130px;
	width: 200px;
	height: 30px;
	background-color: rgb(102, 134, 99);
}

#review-porduct button a {
	text-decoration: none;
	color: beige;
	font-size: 15px;
	font-weight: 700;
}

#review-table {
	position: relative;
	left: 150px;
	height: 100px;
	border: 1px solid gray;
}

#review-table th {
	border: 2px solid gray;
	text-align: center;
}

#review-date {
	text-align: center;
	width: 450px;
	height: 35px;
	border: 1px solid darkgray;
	margin-left: 150px;
}

#review-content {
	position: relative;
	top: 40px;
	height: 500px;
	margin-left: 150px;
}

hr {
	border: 1.5px solid gray;
}

#answer {
	position: absolute;
	left: 150px;
}

.answer-user {
	margin-left: 150px;
	font-size: 20px;
	font-weight: 600;
}

#answer-title {
	margin-left: 150px;
	font-weight: 600;
	font-size: 30px;
}

p {
	margin-left: 150px;
	font-size: 19px;
}

#inform {
	width: 500px;
}

#outform {
	position: relative;
	top: 100px;
	margin-top: 50px;
	margin-left: 150px;
}

#outform textarea {
	background-color: rgba(175, 172, 172, 0.712);
	color: black;
}

#answer-content-acept {
	position: relative;
	bottom: 45px;
	left: 50px;
	width: 100px;
	height: 40px;
	font-weight: 600;
	background-color: gray;
	color: white;
	border: 1px solid darkgrey;
}

#answer-content-acept:hover {
	color: greenyellow;
}

#button-bind1 {
	position: absolute;
	left: 830px;
	bottom: 880px;
}

form input {
	margin-left: 15px;
}

#next-or-back {
	text-align: center;
	position: relative;
	padding-left: 150px;
	top: 200px;
}

#next-or-back a {
	text-decoration: none;
	color: black;
}

#next-or-back th {
	border: 2px solid gray;
}

#next-or-back a:hover {
	color: rgb(4, 88, 4);
}

#go-button {
	position: relative;
	width: 80px;
	left: 800px;
	top: 300px;
}

#go-button a {
	text-decoration: none;
	font-size: 18px;
	font-weight: 800;
	color: black;
}

#delete-button:hover, #modify-button:hover, #go-button a:hover {
	color: yellowgreen;
	text-decoration: none;
}

#answer-box {
	position: relative;
	margin-top: 100px;
}

#delete-button {
	width: 65px;
	position: absolute;
	top: 1600px;
	left: 1280px;
	font-weight: 600;
}

#modify-button {
	width: 65px;
	position: absolute;
	top: 1600px;
	left: 1170px;
	font-weight: 600;
}

#cke_notcie-content-text {
	width: 1000px;
	height: 500px;
}
</style>

</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<section>
		<div id="review">
			<span id="review-title">상품후기</span>
			<div id="route">
				<span><a href="#">홈</a></span> <span>-></span> <span><a
					href="#">커뮤니티</a></span> <span>-></span> <span><a href="#">상품후기</a></span>
			</div>
		</div>
		<form action="<%= request.getContextPath() %>/reviewUpdateForm.bo"
			method="post" id="inform">
			<div id="review-list">
				<div id="review-porduct">
					<div id="review-product-image">
						<a
							href="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=f.get(0).getImgChangeName() %>">
							<img id=detailImg class="detailImg"
							src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=f.get(0).getImgChangeName() %>">
						</a> <input type="hidden" name="file"
							value="<%=f.get(0).getImgChangeName() %>">
					</div>
					<div id="product-title">상품:새싹새러드 8500원</div>
					<button>
						<a href="#">상품 상세 정보</a>
					</button>
				</div>

				<table id="review-table">
					<tr>
						<th width="130px" height="50px">말머리</th>
						<th width="350px">제품</th>
					</tr>
					<tr>
						<th width="130px" height="50px">제목</th>
						<th><input type="hidden" name="title"
							value="<%=r.getReviewTitle() %>"><%=r.getReviewTitle() %></th>
					</tr>
					<tr>
						<th width="130px" height="50px">작성자</th>
						<th><input type="hidden" name="wirter"
							value="<%=r.getUserName()%>"><%=r.getUserName()%></th>
					</tr>
				</table>
				<div id="review-date">
					<span>작성일: <%=r.getEnrollDate()%></span>
				</div>
				<input type="hidden" name="date" value="<%=r.getEnrollDate() %>">
				<input type="hidden" name="reviewNo" value="<%=r.getReviewNo() %>">
			</div>

			<div id="review-content">
				<textarea id="notcie-content-text" cols="150" rows="20"
					readonly="readonly" name="content"><%=r.getReviewCon()%></textarea>
			</div>
			<%if (loginUser!=null&&loginUser.getUserName().equals(userName)){ %>
			<button type="submit" id="modify-button" class="system">수정</button>
			<button type="button" id="delete-button" class="system"
				onclick="deleteReview();">삭제</button>
			<%} %>

			<script>
     
     CKEDITOR.replace('content'
               , {height: 500 ,
               	
                }); 
     function deleteReview(){
     	var bool= confirm("정말삭제하시겠습니까?");
 		if(bool){
 		 $('#inform').attr('action','reviewDelete.bo');
 		 $('#inform').submit();
 		}    	
     }
     
     
     
     </script>
		</form>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<hr>

		<div id="answer-box">
			<span id="answer-title">댓글</span><br>
			<br> <span class="answer-user">관리자</span>
			<p>
				상품 후기 감사합니다! 더욱 맛있는 제품 드릴수 있도록 최선을다하는 Begin Vegan이 되겠습니다~!<br>
				<br> 2021-10-24 11:33
			</p>
			<hr>
			<br> <span class="answer-user">***like1</span>
			<p>
				우와! 저도 먹어봐야 겠네요~ 완전 맛있어 보여요! <br>
				<br> 2021-10-25-12:00
			</p>
			<hr>
		</div>

		<form action="#" method="#" id="outform">
			<!-- <div id="button-bind1">
        <input type="button" value="수정" class="com-button1"  id="modify-button">
        <input type="button" value="삭제" class="com-button1"  id="delete-button">
    </div>
    <div id="button-bind2">
        <input type="button" value="수정" class="com-button2"  id="modify-button">
        <input type="button" value="삭제" class="com-button2"  id="delete-button">
    </div> -->

			<textarea name="#" id="answer-content" cols="100" rows="5"
				placeholder="댓글내용 입력"></textarea>
			<input type="submit" value="확인" id="answer-content-acept">

		</form>


		<div id="next-or-back">
			<table>
				<tr>
					<th width="200px" height="40px"><a href="#">이전 글</a></th>
					<th width="500px;"></th>
				</tr>

				<tr>
					<th height="40px"><a href="#">다음 글</a></th>
					<th><a href="#">상품이 훼손되서 왔어요</a></th>
				</tr>
			</table>
		</div>
		<button type="button" id="go-button">
			<a href="<%=request.getContextPath()%>/reviewList.bo">목록</a>
		</button>


	</section>

</body>
</html>