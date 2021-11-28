<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.*, material.model.vo.*, java.util.*"%>
<%
	Product p = (Product)request.getAttribute("product");
	ArrayList<Photo> fileList = (ArrayList<Photo>)request.getAttribute("fileList");
	Material m = (Material)request.getAttribute("material");
	
	String mtrlName = m.getMtrlName();
	String mtrlPrice = m.getMtrlPrice();
	
	String[] splitMaterial=mtrlName.split(", ");
	String[] splitPrice=mtrlPrice.split(", ");

	String mPrice="";
	for(int i = 0; i < splitMaterial.length; i++){
		switch(splitMaterial[i]){
		case "콩고기":
			mPrice = "5000";
			break;
		case "야채":
			mPrice = "2000";
			break;
		case "콩":
			mPrice = "2000";
			break;
		case "치즈":
			mPrice = "3000";
			break;
		case "연어":
			mPrice = "4000";
			break;
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">



<style>



/* 헤더 부분 */


	
	.beginVegan{
		text-align: center;
	}
	
	#nav_list{
	height: 50px;
}
a:link {
 	color: black; text-decoration: none;
 }
a:visited {
 color: black; text-decoration: none;
 }

.jumbotron{
	background-color: white !important;

}

.cateNav { 

	float: left;
	width: 1200px; 
	height: 50px; 
	margin: 10px 350px 40px 350px; 
	text-align: center; 
	font-size:20px;
	font-weight: bold;
} 
.cateNav ul { 
	display: table; 
	margin: auto; 
	padding:0; 
} 
.cateNav li {
 	width: 130px;
 	margin: 40px 10px;
 	padding: 0px;
	float: left; 
	text-align: center; 
	display:inline-block; 
}

.cateNav li a{
	text-decoration: none;
	color: black;
}
.cateNav li:hover a{
	background: rbg(0, 100, 0);
	border-radius: 3px;
}
.cateNav::after{
	 clear:both;
}

	
	#productBuyArea{
		width: 1200px;
		margin: 60px auto;
		
	}
	
	.product_detail{
		height: 700px;
	}
	.product_detail *{

		width: 500px;
		margin: 8px 0;
		
	}
	#product_mainPicture{
		float:left;
		width: 50%;

	}
	
	.infoArea{
		float: right;
		width: 50%;
		
	}

	#Detail_product_name{
		display: inline-block;
		width: 390px;
		font-size: 25px;
		font-weight: bold;
	}
	.sns{
		display: inline-block;
		width: 110px;
		padding-right: 0px;
		float: right;
	}
	

	#Detail_product_summary{
		font-size: 15px;
	}
	.Detail_product_price{	
		font-size: 25px;
		font-weight: bold;
		border-bottom: 1px solid black;
	}
	#share{
		width: 110px;
		text-align: left;
	}
	
	#selected_option{
		width: 200px;
		height: 40px;		
	}
	.optionUl{
		margin:0px;
		border-bottom: 1px solid black;
	}
	.optionUl *{
		margin:0px;

	}
		
	.optionFlex{
		display: flex;
		height: 50px;
		justify-content: space-between;
		padding-top: 10px;
		text-align: center;
		flex-basis: 100px;
		
	}
	.optionFlex button{
		width: 30px;
		border: 1px solid black;
		flex-shrink: 0;
		
	}
	.optionFlex input{
		text-align: center;
	}

	#layer1{
		background-color: lightgray;
		display:none;
		margin: 0px;
	}


	#optionCount{
		text-align: right;
		width: 100px;
		height: 40px;
	}
	.icon:hover{
		cursor: pointer;
	}
	#delIcon{
		text-align: right;
		width: 20px;
		height: 20px;
	}
		
	#cart{
		margin-bottom: 20px;
		width: 500px;
		border-bottom: 1px solid black;
	}
	#cart button{
		padding: -10px;
		margin-right: -5px;
		border: 1px solid black;
	}
	
	#product_name_select{		
		width: 200px;
		height: 30px;
	}
	
	.add_product{
		width: 30px;
		height: 30px;
		font-weight: bold;
		background-color: white;
		
	}
	
	.plus1, .minus1{
		width: 30px;
		height: 30px;
		background-color: white;
	}

	.numBox1{
		width: 30px;
		height: 30px;
	}

	#numBox{
		width: 30px;
		height: 30px;
		text-align: center;
		margin-right: -6px;
		border: 1px solid black;
	}
	
	#price_product{
		margin-left: 30px;
		width: 100px;
		height: 30px;
		font-size: 20px;
	}
	.total_cart{
		display: inline-block;
		margin-bottom: 20px;
		display: inline-block;
		width: 500px;
		
	}
	
	#total_price_title{
		display: inline-block;
		width: 200px;
		height: 30px;
		font-size: 25px;
		font-weight: bold;
		
	}
	
	#total_price{
		display: inline-block;
		width: 200px;
		height: 30px;
		font-size: 25px;
		font-weight: bold;
	}
	
	.buy_button *{
		display: inline-block;
		width: 246px;
		height: 50px;
		background-color: white;
		font-weight: bold;
		
	}
	
	#buy_button{
		background-color: rgb(65, 116, 77);
		color: white;
	}

	.nav-link{
		color: black;
	}
	.nav-item{
		width: 300px;
	}
	
	#information *{
		 margin: 60px auto ;
		display:block;
		width: 900px;
	}

</style>
</head>
<body>

 <!--  헤더 부분 -->
<header>
	<%@ include file = "../common/header.jsp" %>
	
	</header>
	<%@ include file = "/WEB-INF/views/common/imgslide.jsp" %>
 
   <!-- 상단 카테고리별 네비게이터 -->

  <div   class="cateNav">
	  <ul>
	  	<li class="active"><a href="<%= request.getContextPath() %>/productList.do">전체</a></li>
	  	<li><a href="#">비건</a></li>
	  	<li><a href="#">락토</a></li>
	  	<li><a href="#">오보</a></li>
	  	<li><a href="#">락토오보</a></li>
	  	<li><a href="#">폴로</a></li>
	  	<li><a href="#">페스코</a></li>
	  	<li><a href="#">플렉시테리안</a></li>
	  </ul>
  </div>

	
   <!-- 상품 메인 사진 -->
   <div id="productBuyArea">
	<div class="product_detail">
		<div id="product_mainPicture">
			<img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(0).getImgChangeName()%>" width="500px" height="620px">
		</div>
	

	<!-- 상품명 -->
	<div class="infoArea">
		<span id="Detail_product_name"><%= p.getProdName() %></span>
		<input type="hidden" name="prodName" value="<%= p.getProdName() %>">
		
		
	<!-- 공유하기 버튼을 클릭하면 하단에 공유가능한 사이트 아이콘 뜨게 하고 클릭하면 공유할 수 있게 하기 -->
		
		<!--  카카오API사용하기 -->
	
		<span id="share"> 
			<a id="kakao-link-btn" href="javascript:sendLink()">
				 <i class="bi bi-share" onclick="share();"></i>
			</a>
		</span>	
			
		<div id="Detail_product_summary">
			<%= p.getShortInfo() %>
		</div>

		<div class="Detail_product_price">
			<div><%= p.getPrice() %></div>
			<input type="hidden" name="price" value="<%= p.getPrice() %>">
		</div>
		<dl class="product_option">
		<!-- 옵션을 클릭하면 하단에 선택한 옵션이 출력되게 하기 -->
		<!-- select동적제어로 검색해보기 (테이블)-->
		<form action="<%= request.getContextPath() %>/insertCart.me" method="post">
		 <input type="hidden" name="pNo" value="<%= p.getProdNo() %>">
			<span>옵션</span>
				<select id="selectBox"class="addProduct" name="addOption">
				<% if(m != null){ %>
				<option value="choice">선택</option>
					<% for(int i = 0; i < splitMaterial.length; i++){ %>					
					<option value="<%= splitMaterial[i]  %>"><%= splitMaterial[i]  %>   <%= splitPrice[i] %></option>			
					<% } %>
				<% }else{ %>
					<option>선택할 옵션이 없습니다.</option>
				<% } %>	
				</select>
				
				<div id="addOpt">
				</div>
		</dlv>
		
		<div id="cart">
			<div id="product_name_select"><%= p.getProdName() %></div>	
			<button type="button" id="plus" class="add_product">+</button>
			 <input type="text" id="numBox" name="numBox" min="1" max=10 value="1" readonly="readonly"/>
			 <button type="button" id="minus" class="add_product" onclick="minusCal(this);">-</button>
			 <span id="price_product"><%= p.getPrice() %></span>
			 <input type="hidden" name="mainPrice" id="mainPrice" value="<%= p.getPrice() %>">
			
		 </div>

		 <div class="total_cart">
			 <div id="total_price_title">총 주문 금액</div>
			 <div id="total_price"><%= p.getPrice() %></div>
		 </div>
		  <div class="buy_button">
		 <input type="button" id="add_button" value="장바구니">
		 <input type="button" id="buy_button" value="바로구매" onclick="location.href='<%= request.getContextPath() %>/paie.me'">
		  </div>
		  </div> 
	</div>	
	</form>
	
	<!-- 상품 상세 설명 -->
	
	<ul class="nav nav-tabs" id="infoNav">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="#detailInfo">상품상세정보</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#shipInfo">배송안내</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#exchange_returnInfo">교환 및 반품안내</a>
	  </li>
	</ul>
	
	<div id="information">
	<div id="detailInfo">
	<img id="detailPicture" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(1).getImgChangeName()%>">
	<%= p.getProdExple() %>
	</div>
	<div id="shipInfo">
	<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(2).getImgChangeName()%>" width="500px" height="400px">
		
	</div>
	<div id="exchange_returnInfo">
	<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= fileList.get(3).getImgChangeName()%>" width="500px" height="400px">
		
	</div>
	</div>
	
		<script>
		var mainPrice = <%= p.getPrice()%>

		$(document).on('change','#selectBox',function(){
			var add = $('#selectBox option:selected').text();
 
			var option = 
				"<ul class='optionUl'>"+
					"<li class='optionFlex'>"+
						"<div class='optionName'>"+$('#selectBox option:selected').html().split("   ")[0]+"</div>"+
						"<button type='button' class='plus1' onclick='plusBtn(this);'>+</button>"+
						" <input type='text' class='numBox1' name='count' min='0' max='10' value='0' readonly='readonly'/>"+
						" <input type='hidden'name='count'value='"+$('#selectBox option:selected').html().split("   ")[1]+"' readonly='readonly'/>"+
						" <button type='button' class='minus1'  onclick='minusBtn(this);'>-</button>"+
						 "<span class='optionPrice1'>"+$('#selectBox option:selected').html().split("   ")[1]+"</span>"+
						" <button class='icon' style='border-style:none; background-color:white;' onclick='icon(this);'><i class='bi bi-x' id='delIcon1'></i></button>"+
					"</li>"+
				"</ul>"
		
			$("#addOpt").append(option);
				
		});
		

		//x표 아이콘 클릭시 삭제
		function icon(a){
			
				$(a).parent().parent().remove();
				
				if($(a).parent().children().eq(2).val() != 0){
					//$(this).parent().children().eq(3).val(0);
					 console.log("mainPrice:"+mainPrice);
					 
					 var total = $(a).parent().children().eq(5).html();
					 console.log("total:"+total);
					
					
					mainPrice -= Number(total);
					
					$('#total_price').html(mainPrice);
					<%--mainPrice = <%= p.getPrice()%>--%>
					//mainPrice = result;
					total = 0;
			}
			
			
		}
		
		function plusBtn(a){
		      var num = $(a).parent().children().eq(2).val();
		      num = Number(num);
		      num +=1;
		      console.log(num);
		      $(a).parent().children().eq(2).val(num);
		      var price =   Number($(a).parent().children().eq(3).val());
		    //var price = $('#selectBox option:selected').text().split("   ")[1];
		    console.log(price);
		    var total = price * num;
		    console.log(total);
		    $(a).parent().children().eq(5).html(total);
			mainPrice += price;
			 $('#total_price').html(mainPrice);
		   
		   }
		   
		   function minusBtn(a){
		      var num = $(a).parent().children().eq(2).val();
		      num = Number(num);
		     
		      if(num>1){
		         num -=1;
		         $(a).parent().children().eq(2).val(num);
		         var price =    $(a).parent().children().eq(3).val();
		        // var price = $('#selectBox option:selected').text().split("   ")[1];
				    console.log(price);
				    var total = price * num;
				
				    console.log(total);
				    $(a).parent().children().eq(5).html(total);
				    mainPrice -= price;
				    $('#total_price').html(mainPrice);
		      }
		   }
		   
		   $('#plus').click(function(){
			   var num = $('#cart').children().eq(2).val();
			      num = Number(num);
			      num +=1;
			      console.log(num);
			      
			      $('#cart').children().eq(2).val(num);
			      var price = <%= p.getPrice()%>
			      var total = price * num;
			   mainPrice += <%= p.getPrice()%>
			   $('#price_product').html(total);
			   $('#total_price').html(mainPrice);
		   });
		   
		   $('#minus').click(function(){
			   var num = $('#cart').children().eq(2).val();
			      num = Number(num);
			     
			      if(num>1){
			         num -=1;
			     
			         $('#cart').children().eq(2).val(num);
			         var price = <%= p.getPrice()%>
				      var total = price * num;	
			   mainPrice -= <%= p.getPrice()%>
			   $('#price_product').html(total);
			   $('#total_price').html(mainPrice);
			      }
		   });
	
		   $('#add_button').click(function() {
			   var sub = new Array();
			   var count = new Array();
			   for(var i = 0; i < $('#addOpt').children().length; i++) {
			     sub[i] = $('.optionFlex').eq(i).children().eq(0).text();
			     count[i] = $('.optionFlex').eq(i).children().eq(2).val();
			     console.log('count[i] : ' + count[i]);
			     console.log('sub[i] : ' + sub[i]);
			   }
			   console.log('count : ' + count);
			   console.log('sub : ' + sub);
			   
			   <% if(loginUser != null) { %>
				   $.ajax({
					   url: 'insertCart.me',
					   data: {prodNo:<%= p.getProdNo() %>, amount: $('#numBox').val(), sub:sub, count:count,
						   total: $('#total_price').text()},
					   type: 'post',
					   traditional : true,
					   success: function(data) {
						   console.log(data);
						   
						   if(data > 0) {
							   var bool = confirm('장바구니를 확인하시겠습니까?');
							   
							   if(bool){
								   location.href='<%= request.getContextPath() %>/cartList.me';
							   }
						   } else {
							   alert('장바구니 담기 실패');
						   }
					   },
					   error: function(data) {
						   console.log(data);
					   }
				   });
			   <% } else { %>
				   alert('회원만 이용 가능합니다.');
				   location.href='<%= request.getContextPath() %>/loginForm.me';
			   <% } %>
			  
			 });
		  
		    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
		  //  Kakao.init('aa1819ed95de3c68d5c3cb1a5b174bcb');
		    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
		  //  Kakao.Link.createDefaultButton({
		  //    container: '#kakao-link-btn',
		   //   objectType: 'feed',
		   //   content: {
		    //    title: $('meta[property="og:title"]').attr( 'content' ),
		    //    description: $('meta[property="og:description"]').attr( 'content' ),
		    //    imageUrl: $( 'meta[property="og:image"]' ).attr( 'content' ),
		    //    link: {
		    //      mobileWebUrl: window.location.href,
		     //     webUrl: window.location.href
		     //   }
		     //},
		      //social: {
		      //  likeCount: 286,
		      //  commentCount: 45,
		      //  sharedCount: 845
		     // },
		      //buttons: [
		       // {
		       //   title: '웹으로 보기',
		        //  link: {
		         //   webUrl: window.location.href
		        //  }
		        //}
		      //]
		  //  });
		  //]]>
	
	</script>
	
		 

</body>
</html>