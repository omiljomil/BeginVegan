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
<style>
	.newproduct table {
	width: 950px;
	margin: 0 auto;
	}

	.newproduct table td {
		text-align: center;
	}
	
	.newproduct table td div {
		display: inline-block;
	}
	.newproduct .imgsell td {
	padding-top: 50px;
	width : 400px;
	text-align: center;
	
	}
	.newproduct .imgsell td a{
	color:black;
	text-decoration: none;
	}
	
	
	.imgfile {
		width: 200px;
		height: 200px;
		border: 1px solid black;
	}
	
	.mdtag {
		width: 350px;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
	}
	
	.mdtag button {
		padding: 5px 20px;
		background-color: transparent;
		text-transform: uppercase;
		font-weight: bold;
		border: 2px solid black;
		border-radius: 25px;
		position: relative;
		transition: all 0.3s;
		overflow: hidden;
	}
	
	.mdtag button:focus {
		outline: none;
	}
	
	.mdtag button::before {
		content: "";
		position: absolute;
		height: 100%;
		width: 100%;
		background-color: orange;
		top: 0;
		right: 100%;
		transition: all 0.4s;
		z-index: -1;
		border-radius: 20px;
		border: 0px solid black;
	}
	
	.mdtag button:hover::before {
		transform: translateX(100%);
	}
	
	.mdtag button:hover {
		color: white;
	}
	
	.toparrow {
		display: scroll;
		position: fixed;
		bottom: 15px;
		right: 100px;
	}
	
	.toparrow>a {
		font-size: 30px;
		color: black;
	}
	
	.toparrow>a:hover {
		color: black;
	}
	.col-md-4{
		
		display: flex;
		
		margin: 0 auto;
	}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>

	</header>
	<%@ include file="imgslide.jsp"%>
	

	
	<div style="margin-top: 80px; text-align: center;">
		<h4 style="margin-top: 80px;">신상품</h4>
	</div>
	<% if(pList.isEmpty() || fList.isEmpty()){ %>
	<div class="col-md-4" style="width: 180px;">등록된 상품이 없습니다.</div>
			<% }else{ %>
			
	<div class="newproduct">
	
		<table>
		<tr class="imgsell">
		<%
			for(int i = 0; i < pList.size(); i++){ 
			 Product p = pList.get(i);
			 
			 %>

			<% for(int j = 0; j < fList.size(); j++){ %>
			<% Photo ph = fList.get(j); %>
			<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %>
		
				<td>
					<a class="proThumb" href="#"> <input type="hidden" value="<%= p.getProdNo() %>">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="200px" height="200px"><br>
							<%= p.getProdName() %><br>
						<%= p.getPrice() %>원
					</a>
				</td>
					<% } %>
				<% } %>
			<% } %>
				
			</tr>
		</table>
	</div>
	<%} %>
	
	<h4 style="margin-top: 80px; text-align: center;">MD PICK</h4>

	<div class="newproduct">
		<div class="mdtag">
			<button value="#초보" id="qq">#초보</button>
			<button value="#중수" id="ww">#중수</button>
			<button value="#고수" id="ee">#고수</button>
		</div>
		<% if(pList.isEmpty() || fList.isEmpty()){ %>
	<div class="col-md-4" style="width: 180px;">등록된 상품이 없습니다.</div>
			<% }else{ %>
		<table>
			<tr class="imgsell" id="qqq"style="display: block;">
		<%
			for(int i = 0; i < pList.size(); i++){ 
			 Product p = pList.get(i);
		 %>
	<%if(p.getProdTag().equals("#초보")){ %>
			<% for(int j = 0; j < fList.size(); j++){ %>
			<% Photo ph = fList.get(j); %>
			<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %>
			
				<td>
					<a class="proThumb" href="#"> <input type="hidden" value="<%= p.getProdNo() %>">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="200px" height="200px"><br>
							<%= p.getProdName() %><br>
						<%= p.getPrice() %>원
					</a>
				</td>
						<% } %>
					<% } %>
				<%} %>
			<% } %>	
			</tr>
			
			
			<tr class="imgsell" id="www"style="display: none;">
		<%
			for(int i = 0; i < pList.size(); i++){ 
			 Product p = pList.get(i);
		 %>
	<%if(p.getProdTag().equals("#중수")){ %>
			<% for(int j = 0; j < fList.size(); j++){ %>
			<% Photo ph = fList.get(j); %>
			<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %>
			
				<td>
					<a class="proThumb" href="#"> <input type="hidden" value="<%= p.getProdNo() %>">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="200px" height="200px"><br>
							<%= p.getProdName() %><br>
						<%= p.getPrice() %>원
					</a>
				</td>
						<% } %>
					<% } %>
				
				<%} %>
			<% } %>	
			</tr>
			
			
			<tr class="imgsell" id="eee" style="display: none;">
		<%
			for(int i = 0; i < pList.size(); i++){ 
			 Product p = pList.get(i);
		 %>
	<%if(p.getProdTag().equals("#고수")){ %>
			<% for(int j = 0; j < fList.size(); j++){ %>
			<% Photo ph = fList.get(j); %>
			<% if(ph.getProdNo() == p.getProdNo() && ph.getType() == 0){ %>
			
				<td>
					<a class="proThumb" href="#"> <input type="hidden" value="<%= p.getProdNo() %>">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="200px" height="200px"><br>
							<%= p.getProdName() %><br>
						<%= p.getPrice() %>원
					</a>
				</td>
						<% } %>
					<% } %>
				
				<%} %>
			<% } %>	
			</tr>
		</table>
		
		<%} %>
	</div>
<script>
	$('#qq').click(function(){
		$('#www').css('display','none');
		$('#eee').css('display','none');
		$('#qqq').css('display','block');
		
	});
	$('#ww').click(function(){
		$('#www').css('display','block');
		$('#eee').css('display','none');
		$('#qqq').css('display','none');
		
	});
	$('#ee').click(function(){
		$('#www').css('display','none');
		$('#eee').css('display','block');
		$('#qqq').css('display','none');
		
	});
	
	 $('.proThumb').click(function(){
			var pNo = $(this).children().eq(0).val();
			location.href = "<%= request.getContextPath() %>/proDetail.bo?pNo=" + pNo;
		}); 
</script>
	
	<footer>
		<%@ include file="bottontitle.jsp"%>
	</footer>
	<div class="toparrow">
		<a href="#" title="top"><i class="bi bi-arrow-up-circle"></i></a>
	</div>
</body>
</html>