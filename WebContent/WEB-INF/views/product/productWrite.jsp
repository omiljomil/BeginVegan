<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="product.model.vo.*, java.util.*"%>
<% 
	Product p = (Product)request.getAttribute("p"); 
	ArrayList<Photo> fileList = (ArrayList<Photo>)request.getAttribute("fileList");
	ArrayList list = new ArrayList();
	
%>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<style>
#contentSize {
	width: 1200px;
	margin: 60px auto;
}
>>>>>>> pro/master

#contentSize * {
	margin: 15px;
}

#insertProductTitle {
	color: rgb(65, 116, 77);
	font-size: 50px;
	font-weight: bold;
	margin: 30px;
}

.productTable {
	width: 1200px;
}

.tableName {
	background-color: rgb(157, 181, 137);
	color: white;
	border-right: 1px solid black;
	text-align: center;
}

.productTable tr, td {
	width: 300px;
	height: 40px;
	border: 1px solid black;
}

.productTable select {
	width: 250px;
}

.categoryArea {
	border-bottom: 1px solid black;
	border-top: 1px solid black;
}

.categoryArea select {
	width: 200px;
}

.inputArea {
	border-bottom: 1px solid black;
}

.inputArea label {
	width: 100px;
}

.imgArea {
	width: 300px;
	height: 200px;
}

#productInfo {
	width: 900px;
	height: 200px;
}

#insertProductBtn {
	float: right;
	width: 60px;
	height: 40px;
	background-color: rgb(65, 116, 77);
	color: white;
	font-weight: bold;
}

</style>
</head>
<body>


	<header>
		<%@ include file="../common/header.jsp"%>

	</header>
	<%@ include file="/WEB-INF/views/common/imgslide.jsp"%>

	<!-- 상품등록 -->
	<div id="contentSize">
		<div id="insertProductTitle">상품등록</div>
		<!-- 저장 버튼을 누르면 insert.pr로 이동(최종적으로 등록하면 등록상품리스트페이지로 이동) -->
		<form action="<%= request.getContextPath() %>/insertProduct.pr"
			enctype="multipart/form-data" method="post">

			<table class="productTable">
				<tr>
					<td class="tableName">메인카테고리</td>
					<td><select id="mainCategory" name="mainCategory">
							<option value="default">선택</option>
							<option value="100">채식유형별</option>
							<option value="200">메인재료별</option>
					</select></td>
					<td class="tableName">상세카테고리</td>
					<td><select id="detailCategory" name="detailCategory">
							<option value="101">비건</option>
							<option value="102">락토</option>
							<option value="103">오보</option>
							<option value="104">락토오보</option>
							<option value="105">폴로</option>
							<option value="106">페스코</option>
							<option value="107">플렉시테리안</option>

							<option value="201">콩고기</option>
							<option value="202">유제품</option>
							<option value="203">생선</option>
							<option value="204">야채</option>
							<option value="205">육류</option>

					</select></td>
				</tr>
				<tr>
					<td class="tableName">상품명</td>
					<td colspan="3"><input type="text" id="productName"
						name="productName"></td>
				</tr>
				<tr>
					<td class="tableName">재료명</td>
					<td colspan="3"><input type="text" id="mainMtrl"
						name="mainMtrl"></td>
				</tr>
				<tr>
					<td class="tableName">상품가격</td>
					<td colspan="3"><input type="text" id="productPrice"
						name="productPrice"></td>
				</tr>
				<tr>
					<td class="tableName">간단상품설명</td>
					<td><input type="text" class="shortInfo" name="shortInfo">
					</td>
				</tr>
				<tr>
					<td class="tableName">해시태그</td>
					<td colspan="3"><input type="text" id="hashtag" name="hashtag">
					</td>
				</tr>
				<tr rowspan="2">
					<td class="tableName">대표이미지등록</td>
					<td>
						<div class="imgArea" id="thumbnailArea">
							<img id="thumImg" width="270px" height="170px">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tableName">이미지등록</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="imgArea1">
							<img id="imgs1" width="270px" height="170px">
						</div>
					</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="imgArea2">
							<img id="imgs2" width="270px" height="170px">
						</div>
					</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="imgArea3">
							<img id="imgs3" width="270px" height="170px">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tableName">상품설명</td>
					<td colspan="3"><textarea id="productInfo" name="productInfo"
							style="resize: none;"></textarea></td>
				</tr>

			</table>
			<!-- 파일 업로드 하는 부분 -->
			<div id="fileArea">
				<input type="file" id="thumbnailImg" multiple="multiple"
					name="thumbnailImg1" onchange="LoadImg(this,1)"> <input
					type="file" id="thumbnailImg1" multiple="multiple"
					name="thumbnailImg2" onchange="LoadImg(this,2)"> <input
					type="file" id="thumbnailImg2" multiple="multiple"
					name="thumbnailImg3" onchange="LoadImg(this,3)"> <input
					type="file" id="thumbnailImg3" multiple="multiple"
					name="thumbnailImg4" onchange="LoadImg(this,4)">
			</div>

			<input type="submit" id="insertProductBtn" value="저장">
			<!-- 취소를 누르면 상품등록리스트로 이동하게 하기 -->
			<input type="button" id="resetProductBtn" value="취소">
		</form>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/bottontitle.jsp"%>
	</footer>
	<div class="toparrow">
		<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>


	<script>
	//옵션추가버튼클릭시 입력창 추가하기


	$('#addOptionBtn').on('click', function(){
		
			var addSelect = 
			'<tr name="add">'+
				'<td class="tableName">재료옵션</td>'+			
				'<td class="addOption"  colspan="3">'+
					'<select name="addOption">'+
						'<option value="1">콩고기 </option>'+
						'<option value="2">야채 </option>'+
						'<option value="3">렌틸콩 </option>'+
						'<option value="4">치즈 </option>'+
						'<option value="5">연어</option>'+
					'</select>'+
					'<select name="addPrice">'+				
						'<option value="11">1000원</option>'+
						'<option value="12">2000원</option>'+
						'<option value="13">3000원</option>'+
						'<option value="14">4000원</option>'+
						'<option value="15">5000원</option>'+
					'</select>'+
					'<input type="button" class="removeOptionBtn" value="옵션삭제" name="removeOptionBtn">'+'<br>'+
				'</td>'+
			'</tr>';
			var selectOpHtml = $('tr[name=add]:last');
			selectOpHtml.after(addSelect);

			
			//삭제버튼
			$(document).on('click','input[name=removeOptionBtn]',function(){
				var trHtml = $(this).parent().parent();
				trHtml.remove();
				
			});
			//옵션 추가하면 value값 저장하기
		

	//사진
	$(function(){
		$("#fileArea").hide();//버튼을 숨김
		
		$("#thumbnailArea").click(function(){
			$("#thumbnailImg").click();
		});
		$("#imgArea1").click(function(){
			$("#thumbnailImg1").click();
		});
		$("#imgArea2").click(function(){
			$("#thumbnailImg2").click();
		});
		$("#imgArea3").click(function(){
			$("#thumbnailImg3").click();
		});
		
	});
		function LoadImg(value, num){
			// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				
			if(value.files && value.files[0]){
				var reader = new FileReader();//파일을 읽기 위함 함수
							
					reader.onload = function(e){								
					switch(num){
					case 1: 
						$("#thumImg").attr("src", e.target.result);//타겟result:경로를 가져옴
						break;
					case 2:
						$("#imgs1").attr("src", e.target.result);
						break;
					case 3:
						$("#imgs2").attr("src", e.target.result);
						break;
					case 4:
						$("#imgs3").attr("src", e.target.result);
						break;
					
					}
				}
					//여러 사진을 선택하여 업로드 할 경우 처음선택한 사진만 업로드 됨(한 공간에는 한 사진만 올라감)			
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		//취소버튼 클릭시 안내창 뜨면서 리스트로 이동
		
		$('#resetProductBtn').click(function(){
			 var bool=confirm("상품등록을 취소하시겠습니까?");
			  if(bool){
				  location.href='<%=request.getContextPath()%>/ManagerProductList.pr'
			  }
			  });
		
		
	</script>




</body>
</html>