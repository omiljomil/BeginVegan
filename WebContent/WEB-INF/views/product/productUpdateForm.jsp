<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="product.model.vo.*, java.util.*"%>
<% 
	Product p = (Product)request.getAttribute("product"); 
	ArrayList<Photo> fileList = (ArrayList<Photo>)request.getAttribute("fileList");
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

#contentSize * {
	margin: 15px;
}

#updateProductTitle {
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
	text-align: center;
}

.productTable tr, td {
	width: 300px;
	height: 50px;
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

#productInfo {
	width: 900px;
	height: 400px;
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
		<div id="updateProductTitle">상품등록</div>
		<!-- 저장 버튼을 누르면 insert.pr로 이동(최종적으로 등록하면 등록상품리스트페이지로 이동) -->
		<form action="<%= request.getContextPath() %>/productUpdate.pr"
			enctype="multipart/form-data" method="post">

			<table class="productTable">
				<tr>
					<td class="tableName">메인카테고리</td>
					<td><select id="updateMainCategory" name="mainCategory">
							<option value="default">선택</option>
							<option value="100">채식유형별</option>
							<option value="200">메인재료별</option>
					</select></td>
					<td class="tableName">상세카테고리</td>
					<td><select id="updateDetailCategory" name="detailCategory">
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
					<td colspan="3"><input type="text" id="updateProductName"
						name="productName" value="<%= p.getProdName() %>"></td>
				</tr>
				<tr>
					<td class="tableName">재료명</td>
					<td colspan="3"><input type="text" id="updateMainMtrl"
						name="mainMtrl" value="<%= p.getMtrlName() %>"></td>
				</tr>
				<tr>
					<td class="tableName">상품가격</td>
					<td colspan="3"><input type="text" id="updaetProductPrice"
						name="productPrice" value="<%= p.getPrice() %>"></td>
				</tr>
				<tr>
					<td class="tableName">간단상품설명</td>
					<td><input type="text" class="shortInfo" name="shortInfo"
						value="<%= p.getShortInfo() %>"></td>
				</tr>
				<tr>
					<td class="tableName">해시태그</td>
					<td colspan="3"><input type="text" id="updateHashtag"
						name="hashtag" value="<%= p.getProdTag() %>"></td>
				</tr>
				<tr rowspan="2">
					<td class="tableName">대표이미지등록</td>
					<td>
						<div class="imgArea" id="updateThumbnailArea">
							<img id="updateThumImg" width="270px" height="170px"
								src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getImgChangeName()%>">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tableName">이미지등록</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="updateImgArea1">
							<img id="updateImgs1" width="270px" height="170px"
								src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(1).getImgChangeName()%>">
						</div>
					</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="updateImgArea2">
							<img id="updateImgs2" width="270px" height="170px"
								src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(2).getImgChangeName()%>">
						</div>
					</td>
					<td style="border: 1px solid black;">
						<div class="imgArea" id="updateImgArea3">
							<img id="updateImgs3" width="270px" height="170px"
								src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(3).getImgChangeName()%>">
						</div>
					</td>
				</tr>
				<tr>
					<td class="tableName">상품설명</td>
					<td colspan="3"><textarea id="productInfo" name="productInfo"
							style="resize: none;"> <%= p.getProdExple() %></textarea></td>
				</tr>

			</table>
			<!-- 파일 업로드 하는 부분 -->
			<div id="updateFileArea">
				<input type="file" id="updateThumbnailImg" multiple="multiple"
					name="thumbnailImg1" onchange="LoadImg(this,1)"> <input
					type="file" id="updateThumbnailImg1" multiple="multiple"
					name="thumbnailImg2" onchange="LoadImg(this,2)"> <input
					type="file" id="updateThumbnailImg2" multiple="multiple"
					name="thumbnailImg3" onchange="LoadImg(this,3)"> <input
					type="file" id="updateThumbnailImg3" multiple="multiple"
					name="thumbnailImg4" onchange="LoadImg(this,4)">
			</div>

			<input type="submit" id="insertProductBtn" value="저장">
			<!-- 취소를 누르면 상품등록리스트로 이동하게 하기 -->
			<input type="reset" id="resetProductBtn" value="취소"
				onclick="location.href='<%= request.getContextPath() %>/ManagerProductList.pr'">
		</form>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/bottontitle.jsp"%>
	</footer>
	<div class="toparrow">
		<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>


	<script>
	$(function(){
		$("#updateFileArea").hide();//버튼을 숨김
		
		$("#updateThumbnailArea").click(function(){
			$("#updateThumbnailImg").click();
		});
		$("#updateImgArea1").click(function(){
			$("#updateThumbnailImg1").click();
		});
		$("#updateImgArea2").click(function(){
			$("#updateThumbnailImg2").click();
		});
		$("#updateImgArea3").click(function(){
			$("#updateThumbnailImg3").click();
		});
		
	});
		function LoadImg(value, num){
			// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
				
			if(value.files && value.files[0]){
				var reader = new FileReader();//파일을 읽기 위함 함수
							
					reader.onload = function(e){								
					switch(num){
					case 1: 
						$("#updateThumImg").attr("src", e.target.result);//타겟result:경로를 가져옴
						break;
					case 2:
						$("#updateImgs1").attr("src", e.target.result);
						break;
					case 3:
						$("#updateImgs2").attr("src", e.target.result);
						break;
					case 4:
						$("#updateImgs3").attr("src", e.target.result);
						break;
					
					}
				}
					//여러 사진을 선택하여 업로드 할 경우 처음선택한 사진만 업로드 됨(한 공간에는 한 사진만 올라감)			
				reader.readAsDataURL(value.files[0]);
			}
		}

	</script>




</body>
</html>