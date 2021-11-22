<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, product.model.vo.*"%>
<%
	ArrayList<Product> pList = (ArrayList)request.getAttribute("pList"); 
	ArrayList<Photo> fList = (ArrayList<Photo>)request.getAttribute("fList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script type="text/javascript"
	src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<style>
#button input {
	width: 200px;
	height: 30px;
}

.productList {
	width: 1200px;
	margin: 60px auto;
}

#boardTable {
	width: 1200px;
}

#boardTable tr {
	width: 200px;
	border: 1px solid black;
}

#boardTable th {
	height: 30px;
	text-align: center;
}

#boardTable td {
	width: 130px;
	height: 200px;
	text-align: center;
}

table img {
	width: 120px;
	height: 120px;
}

.updateProduct {
	background-color: white;
}

.deleteProduct {
	background-color: rgb(65, 116, 77);
	color: white;
}

#addProductButton {
	float: right;
	background-color: white;
}

.pagination {
	justify-content: center;
}
</style>
</head>
<body>

	<!--  헤더 부분 -->
	<header>
		<%@ include file="../common/header.jsp"%>

	</header>
	<%@ include file="/WEB-INF/views/common/imgslide.jsp"%>


	<!-- 체크박스  -->
	<div class="productList">

		<!-- 상품등록 버튼을 누르면 상품등록폼이 있는 곳으로 이동 -->
		<form action="<%= request.getContextPath() %>/insertProductForm.pr"
			method="post" id="productListForm">
			<table border="1" id="boardTable">

				<tr>
					<th>상품번호</th>
					<th colspnan="2">이미지</th>
					<th>상품명</th>
					<th>등록일</th>
					<th>상품가격</th>
					<th>카테고리</th>
					<th>수정/삭제</th>
				</tr>

				<% if(pList.isEmpty() || fList.isEmpty()){%>
				<tr>
					<td colspan="9">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
				<%	for(int i = 0; i < pList.size(); i++){ %>
				<%  Product p = pList.get(i);%>

				<tr>
					<td><%= p.getProdNo() %> <%--자꾸 리스트의 마지막이 삭제됨 --%></td>
					<td>
						<% for(int j = 0; j < fList.size(); j++){ %> <% Photo ph = fList.get(j); %>
						<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %> <img
						src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>">
					</td>
					<% } %>
					<% } %>
					<td><%= p.getProdName() %></td>
					<td><%=p.getEnrollDate() %></td>
					<td><%= p.getPrice() %></td>
					<td><%=p.getCtgryName() %></td>

					<td><input type="button" class="updateProductBtn" value="수정"
						onclick="updateProduct();"> <input type="hidden"
						name="pNo" value="<%= p.getProdNo() %>"> <input
						type="button" class="deleteProductBtn" value="삭제"
						onclick="deleteProduct();"></td>
					<% } %>
					<% } %>
				</tr>
			</table>


			<input type="submit" id="addProductButton" value="상품등록">
		</form>

		<!-- 페이지네이션 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 가는 버튼 -->
			<!-- 이전, 이후 버튼은 활성화가 안되야함 -->
			<button
				onclick="location.href='<%=request.getContextPath() %>/ManagerProductList.pr?currentPage=1'">&lt;&lt;</button>
			<!--  이번 페이지로 가는 버튼 -->
			<button id="beforeBtn"
				onclick="location.href='<%=request.getContextPath() %>/ManagerProductList.pr?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
			<script>
			if(<%= pi.getCurrentPage() %> <= 1){
					$('#beforeBtn').prop('disabled', true);
				}
			</script>

			<!--  숫자 버튼 -->
			<% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++){ %>
			<%		if(i == pi.getCurrentPage()){ %>
			<button id="choosen" disabled><%= i %></button>
			<%		}else{ %>
			<button id="numBtn"
				onclick="location.href='<%= request.getContextPath() %>/ManagerProductList.pr?currentPage=<%= i %>'"><%= i %></button>
			<%		} %>
			<% } %>
			<!--  다음 페이지로 가는 버튼 -->
			<button id="afterBtn"
				onclick="location.href='<%=request.getContextPath() %>/ManagerProductList.pr?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
			<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
					$('#afterBtn').prop('disabled', true);
				}			
			</script>
			<!--  맨 끝으로 가는 버튼 -->
			<!-- 이전, 이후 버튼은 활성화가 안되야함 -->
			<button
				onclick="location.href='<%= request.getContextPath() %>/ManagerProductList.pr?currentPage=<%=pi.getMaxPage() %>'">&gt;&gt;</button>

		</div>


		<script>

		//클릭하면 삭제하겠냐는 alert창 뜨고 확인을 누르면 삭제되게 하기
	
			$('.deleteProductBtn').click(function(){
				 var bool = confirm('정말 삭제하시겠습니까?');
				 var pNo = $(this).prev().eq(0).val();
					console.log(pNo);
				 if(bool){
					 location.href = '<%= request.getContextPath() %>/productDelete.pr?pNo=' + pNo;
					 }
			});

		//상품수정(url로 상품번호 받아와야함)
		$('.updateProductBtn').click(function(){
			console.log(123);
			var pNo = $(this).next().eq(0).val();
			console.log(pNo);
			location.href = '<%= request.getContextPath() %>/prouctUpdateForm.pr?pNo=' + pNo;
		});

		//$('#updateProductBtn').click(function(){
		//	$(this).attr('action', 'prouctUpdateForm.pr');
		//	$('#productListForm').submit();
		//});

	</script>
</body>
</html>