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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
div {
	background-color: white;
}

#nav_list {
	height: 50px;
}

.cateNav {
	background-color: none;
	float: left;
	width: 1200px;
	height: 50px;
	margin: auto 350px;;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#cateNavDiv {
	background-color: white;
}

.cateNav ul {
	display: table;
	margin: auto;
	padding: 0;
}

.cateNav li {
	width: 130px;
	margin: 40px 10px;
	padding: 0px;
	float: left;
	text-align: center;
	display: inline-block;
}

.cateNav li a {
	text-decoration: none;
	color: black;
}

.cateNav li:hover a {
	background: rbg(0, 100, 0);
	border-radius: 3px;
}

.cateNav::after {
	clear: both;
}

.prodContent {
	margin: 40px auto;
	width: 1200px;
}

.proFlex {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
}

.prodCol {
	margin: 40px;
	width: 33%;
	padding-right: 8px;
	text-align: center;
}

.prodCol a {
	text-decoration: none;
	color: black;
	flex-shrink: 0; /* 이 속성 이용하면 너비 조정이 가능함*/
	width: 300px;
	height: 300px;
}

.prodCol *:hover {
	cursor: pointer;
}

.nav-item {
	margin: 30px 0;
	font-size: 20px;
	font-weight: bold;
	font-color: black;
}

.nav-link {
	color: black;
}

/*.img-thumb {
		width: 100%;
		border-style: none;
		}*/
.name-product {
	margin: 16px 0 4px 0;
	font-weight: bold;
}

.price-product {
	font-size: 20px;
	font-weight: bold;
	line-height: 150%;
	color: red;
}

.proThumb:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>

	</header>
	<%@ include file="/WEB-INF/views/common/imgslide.jsp"%>


	<!--  메인 페이지  -->


	<!-- 상단 카테고리별 네비게이터 -->
	<div class="jumbotron" style="background-color: white !important;">
		<div class="cateNav" id="cateNavDiv">
			<ul>
				<li class="active" value="100" name="cNo" id="total"><a href="#">전체</a></li>
				<li  value="101" name="cNo" id="vegan"><a href="#">비건</a></li>
				<li value="102" name="cNo" id="lacto"><a href="#">락토</a></li>
				<li value="103" name="cNo" id="ovo"><a href="#">오보</a></li>
				<li value="104" name="cNo" id="lacOvo"><a href="#">락토오보</a></li>
				<li value="105" name="cNo" id="pollo"><a href="#">폴로</a></li>
				<li value="106" name="cNo" id="pesco"><a href="#">페스코</a></li>
				<li value="107" name="cNo" id="flexi"><a href="#">플렉시테리안</a></li>
			</ul>
		</div>
	</div>

	<!-- 부트스트랩 컨테이너 -->

	<br class="clear">

	<%-- <div class="jumbotron" style="margin: 0;">--%>
		<div class="container"></div>
	</div>

	<div class=container>
		<div class="row" align="center">
			<% if(pList.isEmpty() || fList.isEmpty()){ %>
			<div class="col-md-4">등록된 상품이 없습니다.</div>
			<% } %>
			<%
			for(int i = 0; i < pList.size(); i++){ 
			 Product p = pList.get(i);
			 
			 %>

			<% for(int j = 0; j < fList.size(); j++){ %>
			<% Photo ph = fList.get(j); %>
			<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %>
			<div class="col-md-4" width="300px" height="300" id="proInfo">
				<a class="proThumb"> <input type="hidden"
					value="<%= p.getProdNo() %>">
					<p>
						<img
							src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>"
							width="300px" height="300px">
					<h3><%= p.getProdName() %></h3>
					<p><%= p.getPrice() %>원
						<%= p.getProdNo() %></a>
			</div>
			<% } %>
			<% } %>
			<% } %>
		</div>
		<hr>

	</div>

	<!-- 페이지네이션 -->
	<div class="pagingArea" align="center">
		<!-- 맨 처음으로 가는 버튼 -->
		<!-- 이전, 이후 버튼은 활성화가 안되야함 -->
		<button
			onclick="location.href='<%=request.getContextPath() %>/productList.do?currentPage=1'">&lt;&lt;</button>
		<!--  이번 페이지로 가는 버튼 -->
		<button id="beforeButton"
			onclick="location.href='<%=request.getContextPath() %>/productList.do?currentPage=<%=pi.getCurrentPage()-1%>'">&lt;</button>
		<script>
			if(<%= pi.getCurrentPage() %> <= 1){
					$('#beforeButton').prop('disabled', true);
				}
		</script>

		<!--  숫자 버튼 -->
		<% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++){ %>
		<%		if(i == pi.getCurrentPage()){ %>
		<button id="choice" disabled><%= i %></button>
		<%		}else{ %>
		<button id="numButton"
			onclick="location.href='<%= request.getContextPath() %>/productList.do?currentPage=<%= i %>'"><%= i %></button>
		<%		} %>
		<% } %>
		<!--  다음 페이지로 가는 버튼 -->
		<button id="afterButton"
			onclick="location.href='<%=request.getContextPath() %>/productList.do?currentPage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
		<script>
				if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>){
					$('#afterButton').prop('disabled', true);
				}			
		</script>
		<!--  맨 끝으로 가는 버튼 -->
		<!-- 이전, 이후 버튼은 활성화가 안되야함 -->
		
		<button onclick="location.href='<%= request.getContextPath() %>/productList.do?currentPage=<%= pi.getMaxPage() %>'">&gt;&gt;</button>

	</div>
	<footer>
		<%@ include file="/WEB-INF/views/common/bottontitle.jsp"%>
	</footer>

	<script>	
 $('.proThumb').click(function(){
		console.log(123);
		var pNo = $(this).children().eq(0).val();
		console.log(pNo);
		location.href = "<%= request.getContextPath() %>/proDetail.bo?pNo=" + pNo;
	}); 
 
 $(document).on('click','#cateNavDiv a',function(){
	 var cateVal = $(this).parent().val();
	 console.log(cateVal);
	 var cNo = $(this).parent().eq(0).val();
	 console.log("cNo:"+cNo);
	 location.href = "<%= request.getContextPath() %>/productList.do?cNo=" + cNo;
	 /* switch(cateVal){
	 case "100":
		 
		 break;
	 case "101":
		 break;
	 case "102":
		 break;
	 case "103":
		 break;
	 case "104":
		 break;
	 case "105":
		 break;
	 case "106":
		 break;
	 case "107":
		 break;
	 } */
 });
 
 
 
 
 
 
	</script>


</body>
</html>