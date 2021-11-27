<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="User.model.vo.*"%>

<%
User user=(User)request.getSession().getAttribute("loginUser");

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<title>상품후기 양식 페이지</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0 auto;
	font-family: sans-serif;
}

section {
	margin-top: 100px;
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
	right: 180px;
	font-size: 32px;
	color:gray;
}

#route a {
	text-decoration: none;
	color: gray;
	font-size: 28px;
}

#route a:hover {
	text-decoration: "none";
	color: yellowgreen;
}

#imageBox img:hover, #titleImg:hover {
	cursor: pointer;
}

#thumnail-image {
	width: 178px;
	height: 185px;
	border: none;
	background-color: white;
}


#review-table{
 width:1000px;
 margin-left: 150px;

}

#review-table th {
	height: 65px;
	border: 1px solid gray;
	text-align: center;
}

#review-text-title {
    width:300px;
	height: 60px;
	border: none;
}


#option-button-div {
	border: 1px solid #888;
	margin-left: 150px;
	position: relative;
	top: 400px;
	width: 1100px;
}

#ot-backColor, #ot-textColor {
	position: relative;
	top: 3px;
}

#review-content {
	position: absolute;
	top: 800px;
	margin-left: 150px;
}

#imageBox {
	position: absolute;
	left: 150px;
	top: 1000px;
}

#imageBox img {
	margin-top: 30px;
	border: 1px solid gray;
}

#go-button {
	position: absolute;
	width: 80px;
	left: 1200px;
	top: 1400px;
	text-decoration: none;
	font-size: 18px;
	font-weight: 800;
	color: black;
}

#go-button:hover {
	color: yellowgreen;
}

#input-cancle, #input-save {
	border: 1px solid gray;
	position: relative;
	left: 540px;
	top: 750px;
	margin-right: 60px;
	width: 130px;
	height: 50px;
	font-weight: 900;
}

#input-cancle {
	background-color: darkgrey;
}

#input-save {
	background-color: greenyellow;
}

#fileArea {
	position: absolute;
	top: 1900px;
}

#cke_review-text-content {
	width: 1000px;
}
</style>

</head>
<body>



	<%@ include file="../common/header.jsp"%>
	<section>
		<div id="review">
			<span id="review-title">상품후기</span>
			<div id="route">
				<span id="home"><a href="#">홈</a></span> <span>-></span> <span
					id="community"><a href="#">커뮤니티</a></span> <span>-></span> <span
					id="reviewList"><a href="#">상품후기</a></span>
			</div>
		</div>
		<br>
		<br>

		<form action="<%= request.getContextPath() %>/reviewInsert.bo"
			method="post" encType="multipart/form-data">
			<!-- 파일올리는 거기 때문에 -->
			<div id="review-table">
				<table id="review-write">
					<tr>
					   <th colspan="2" rowspan="2" ><img id="titleImg" width="180" height="199"></th>
						<th width="100">제목</th>
						<th width="330px"><input type="text" id="review-text-title"  name="title"
							placeholder="제목 입력" maxlength="15"></th>
					</tr>
					<tr>
						<th>작성자</th>
						<th><%=loginUser.getUserName() %><input type="hidden"
							id="review-text-title" placeholder="이름 입력" name="name"
							value="<%=user.getUserName() %>"></th>
					</tr>

				</table>
			</div>

			<div id="review-content">
				<textarea id="review-text-content" class="editor" name="content"
					cols="150" rows="21" placeholder="이미지%내용입력"></textarea>

			</div>

			<div id="fileArea">
				<input type="file" id="thumbnailImg1" multiple="multiple"
					name="thumbnailImg1" onchange="LoadImg(this,1)" required="required">
			</div>

			<script>
  			 CKEDITOR.replace('content'
  	                , {height: 500 ,
  	                	
  	                 });
  			 
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						$("#titleImg").click(function(){
							//div 내용사진부분을 클릭함으로써 input file의 해당하는 태그는hiddent이므로 그 input을 누르게되는 효과 속성
							$("#thumbnailImg1").click();
								});
					});
					
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
			</script>
			<button type="button" id="go-button">목록</button>
			<input type="button" value="취소" id="input-cancle"> <input
				type="button" value="저장" id="input-save">
		</form>
	</section>

	<script>
		 $('#input-save').click(function(){
			 var value = CKEDITOR.instances['review-text-content'].getData();
			  console.log(value);
			    if($.trim ($('#review-text-title').val())==""){
			        console.log("값이 비어있습니다.");
			        $('#review-text-title').select();
			      alert("제목을 입력해주세요");
			    }else if($.trim(value)==""){
			        console.log("값이 비어있습니다.");
			        $('#review-text-content').select();
			      alert("내용을을 입력해주세요");
			    }else if(!$('#thumbnailImg1').val()){
			    	  alert("썸네일에 들어갈 이미지 파일을 입력해주세요");
			    	  $('#titleImg').click();
			    }
			    else{
			        $('#input-save').attr('type','submit');
			        $('#input-save').submit();
			    }
		 });
		 
		 $('#input-cancle').click(function(){
		     var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
		     if(bool){
		    	 location.href='javascript:history.go(-1);'
		     }
	    });  
		 
		 $('#go-button').click(function(){
			  var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
			  if(bool){
				  location.href='reviewList.bo'
			  }
		 });
		 
		 $('#home').click(function(){
			 var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
			  if(bool){
				   location.href='<%=request.getContextPath()%>/'
			  }
		 });
		 $('#community').click(function(){
			 var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
			  if(bool){
				  location.href='<%=request.getContextPath()%>/community.me'
			  }
			  });

		 $('#reviewList').click(function(){
			 var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
			  if(bool){
				  location.href='<%=request.getContextPath()%>/reviewList.bo'
			  }
			  });
		 
	 </script>

</body>
</html>