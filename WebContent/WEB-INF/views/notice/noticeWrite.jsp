<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>공지사항 양식 페이지</title>
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

#notice{
 margin-bottom: 50px;
}
#notice-title {
	margin-left: 140px;
	font-size: 70px;
	
}

#notice-route {
	position: relative;
	display: flex;
	justify-content: right;
	bottom: 100px;
	right: 180px;
	font-size: 29px;
	color: gray;
}

#notice-route a {
	text-decoration: none;
	color: gray;
	font-size: 29px;
}

#notice-route a:hover {
	color: yellowgreen;
}

#notice-table {
	width: 500px;
	position: relative;
	left: 150px;
	height: 100px;
	bottom:100px;
	border-collapse: collapse;
}

#notice-table th {
	height: 45px;
	border: 1px solid gray;
	text-align: center;
}

#notice-table button {
	border: none;
}

#notice-text-title {
	width: 250px;
	height: 50px;
	border: none;
}


#option-button-div {
	border: 1px solid #888;
	margin-left: 150px;
	position: absolute;
	top: 770px;
	width: 1100px;
}

#ot-backColor, #ot-textColor {
	position: relative;
	top: 3px;
}

#notcie-content {
   position:relative;
	width: 1100px;
	height: 500px;
	margin-top: 270px;
	margin-left: 150px;
	bottom:300px;	
}

#go-button {
	position: relative;
	width: 80px;
	left: 1400px;
	bottom: 170px;
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
	left: 490px;
	bottom:80px;
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

#cke_content {
	width: 1200px;
}
</style>
</head>
<body>
<body>
	<%@include file="../common/header.jsp"%>

	<section>
		<div id="notice">
			<span id="notice-title">공지사항</span>
			<div id="notice-route">
				<span id="home"><a href="#">홈</a></span> <span>-></span> <span
					id="community"><a href="#">커뮤니티</a></span> <span>-></span> <span
					id="noticeList"><a href="#">공지사항</a></span>
			</div>
		</div>
		<br>
		<br>
		<form action="<%=request.getContextPath() %>/noticeInsert.me"
			method="post">
			<div id="notice-table">
				<table>
					<tr>
						<th width="150px">제목</th>
						<th width="250px" height="150px"><input type="text"
							id="notice-text-title" placeholder="제목 입력" name="title"></th>
					</tr>
					<tr>
						<th>작성자</th>
						<th>관리자<input type="hidden"
							id="notice-text-title" name="userName"></th>
					</tr>

					<tr>
						<th>작성일</th>
						<th><input type="date" name="date"></th>
					</tr>
				</table>
			</div>



			<div id="notcie-content">
				<textarea id="content" name="content" cols="150" rows="21"
					placeholder="이미지%내용입력" maxlength="12"></textarea>
			</div>

			<script type="text/javascript">
      
    		 CKEDITOR.replace('content'
 	                , {height: 500 ,
 	                	filebrowserUploadUrl:'/SemiTest_JSPServlet/notice/noticeImg.me'
 	                 });
	  </script>


			<button type="button" id="go-button">목록</button>


			<input type="button" value="취소" id="input-cancle"> <input
				type="submit" value="저장" id="input-save">
		</form>
	</section>
</body>
<script>
$('#input-save').click(function(){
    if($.trim ($('#notice-text-title').val())==""){
        console.log("값이 비어있습니다.");
        $('#notice-text-title').select();
      alert("제목을 입력해주세요");
    }else{
        $(this).attr('type','submit');
        $(this).submit();
    }
   });
 
  $('#input-cancle').click(function(){
     var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
     if(bool){
       	/*  $('#updateForm').attr('action','noticeList.me');
    	 $(this).attr('type','submit');
    	 $('#updateForm').submit(); */
    	 location.href='javascript:history.go(-1);'
         
     }
  }); 
  
 $('#go-button').click(function(){
	  var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
	  if(bool){
		  location.href='noticeList.me'
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

 $('#noticeList').click(function(){
	 var bool=confirm("내용이 저장되지 않을 수도 있습니다. 작성을 취소하시겠습니까?");
	  if(bool){
		  location.href='<%=request.getContextPath()%>/noticeList.me'
	  }
	  });

</script>

</html>