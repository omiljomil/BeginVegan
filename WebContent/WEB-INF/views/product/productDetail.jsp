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
				<!-- 
					<span> 야채</span>
					<span> 
						<button type="button" id="plus1" class="add_product">+</button>
							 <input type="text" id="numBox1" min="1" max=10 value="1" readonly="readonly"/>
							 <button type="button" id="minus1" class="add_product">-</button>
					</span>
					<span> 20000</span>
					 -->
				</div>
				<div id="layer1" name="add">
					<ul class="optionUl">
						<li class="optionFlex">
							<div class="optionName"></div>
							<button type="button" id="plus1" class="add_product">+</button>
							 <input type="text" id="numBox1" min="1" max=10 value="1" readonly="readonly"/>
							 <button type="button" id="minus1" class="add_product">-</button>
							 <span id="optionPrice1"></span>
							 <i class="bi bi-x" id="delIcon1"></i>
						</li>
					</ul>
				 </div>
		</dlv>
		
		<div id="cart">
			<div id="product_name_select"><%= p.getProdName() %></div>
	
			<button type="button" id="plus" class="add_product">+</button>
			 <input type="text" id="numBox" name="numBox" min="1" max=10 value="1" readonly="readonly"/>
			 <button type="button" id="minus" class="add_product" onclick="minusCal(this);">-</button>
			 <span id="price_product"></span>
			 <input type="hidden" name="mainPrice" id="mainPrice" value="<%= p.getPrice() %>">
		 </div>

		 <div class="total_cart">
			 <div id="total_price_title">총 주문 금액</div>
			 <div id="total_price"></div>
		 </div>
		  <div class="buy_button">
		 <input type="submit" id="add_button" value="장바구니">
		 <input type="button" id="buy_button" value="바로구매">
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
	
		$(document).on('change','#selectBox',function(){
			var add = $('#selectBox option:selected').text();
			var optionPrice = 0;
			
			console.log(add); 
			var option = 
				"<ul class='optionUl'>"+
					"<li class='optionFlex'>"+
						"<div class='optionName'>"+$('#selectBox option:selected').html().split("   ")[0]+"</div>"+
						"<button type='button' class='plus1' onclick='plusBtn(this);'>+</button>"+
						" <input type='text' class='numBox1' name='count' min='1' max='10' value='1' readonly='readonly'/>"+
						" <button type='button' class='minus1'  onclick='minusBtn(this);'>-</button>"+
						 "<span class='optionPrice1'></span>"+
						" <span class='icon'><i class='bi bi-x' id='delIcon1'></i></span>"+
					"</li>"+
				"</ul>"
		
			$("#addOpt").append(option);
				
				//x표 아이콘 클릭시 삭제
				$('.icon').click(function(){
					$(this).parent().parent().remove();
				});
		});
		
		function plusBtn(a){
		      var num = $(a).parent().children().eq(2).val();
		      num = Number(num);
		      num +=1;
		      console.log(num);
		      $(a).parent().children().eq(2).val(num);
		    var price = $('#selectBox option:selected').text().split("   ")[1];
		    console.log(price);
		    var total = price * num;
		    console.log(total);
		    $(a).parent().children().eq(4).html(total);
		    
		   }
		   
		   
		   function minusBtn(a){
		      var num = $(a).parent().children().eq(2).val();
		      num = Number(num);
		      if(num>1){
		         num -=1;
		         $(a).parent().children().eq(2).val(num);
		         var price = $('#selectBox option:selected').text().split("   ")[1];
				    console.log(price);
				    var total = price * num;
				    console.log(total);
				    $(a).parent().children().eq(4).html(total);
		      }
		   }
		   
		   var num = 0;
		   $(document).on('click','#plus',function(){

			   num = Number(num);
			     num +=1;
				console.log(num);
			    $('#numBox').val(num);     
			    var price = $('#mainPrice').val();
				console.log(price);
				var total = price * num;
				console.log(total);
				$('#price_product').html(total);   

		   });
		   $(document).on('click','#minus',function(){

			   num = Number(num);
			   if(num > 1){
			     num -=1;
				console.log(num);
			    $('#numBox').val(num);     
			    var price = $('#mainPrice').val();
				console.log(price);
				var total = price * num;
				console.log(total);
				$('#price_product').html(total);   
			   }

		   });


			$('#total_price').html(4);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
				//버튼클릭시 현재자신이 있는 곳의 input에 숫자 증감소 해야함
			/* 
				function fnCalCount(type, ths){
		
				    var $input = $(ths).parent().children().find('.numBox1');
				    var tCount = Number($input.val());//input값을 숫자로 변환
				    console.log(tCount);
				    var tEqCount = Number($(ths).parent().children().find("input[name='count']").html());
				    
				    if(type=='p'){
				        if(tCount > 0){
				        	$(this).siblings('.numBox1').html(tCount+1)
				        	$input.val(Number(tCount)+1);
				        	optionPrice = tCount * $('#selectBox option:selected').html().split("   ")[1];
				        	$(this).siblings().find(".optionPrice").html(optionPrice);
				        }
				    }else if(type == 'm'){
				        if(tCount >0) {
				        	$input.val(Number(tCount)-1);  
				        }
				    }
				}
				
				$("#selectBox option:eq(0)").prop("selected", true);

		
		
		
		$('#plus').click(function(){
			console.log(12);
			var count = 1;
			if(count >= 1){
				count++;
				console.log(count);
				$('#numBox').html(count);
				var price = $('#mainPrice').val();
				console.log(price);
				var totalPrice = price * count;
				$('#price_product').html(totalPrice);
			}
			
		});
		
		 */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	/* 	
		var mCnt = 1;
		var changeCnt = 0;
		var changeCnt2 = 0;
		$(document).ready(function(){
			
			
		//옵션

		 $(".addProduct").on("change",function(){
				
		mCnt = 1;
		var addOpt = "<div><span>" + $("option:selected",this).text().split("   ")[0] +"</span>" +
		 "	<span> " +
		 "		<button type='button' id='plus1' class='add_product' onclick='plusCal("+ $("option:selected",this).text().split("   ")[1]+ ", \""+changeCnt+"\" , 1);' >+</button>" +
			 "	<input type='text' id='numBox1_"+changeCnt+"' min='1' max=10 value='1' style='width:50px;' readonly='readonly'/>" +
			 "	<button type='button' id='minus1' class='add_product' onclick='minusCal("+ $("option:selected",this).text().split("   ")[1]+ ", "+changeCnt+");'>-</button>" +
			 "	</span>" +
			 "	<span id='matprice_"+changeCnt+"'> " + $("option:selected",this).text().split("   ")[1] +"</span>"
			 "<i class='bi bi-x' id='delIcon1'>"+"</i>"+"</div>";
		$("#addOpt").append(addOpt);
				
		changeCnt =  changeCnt +1;
		});
			
			
		}); 
		
		// 재료 수량 추가, 감소 함수 작성

		function plusCal(vPrice,vId,vCnt) {
			mCnt = mCnt + 1 ;
			console.log("vPrice:" + vPrice  + "       vId: numBox1_"+vId + "       mCnt"+mCnt);
			
			
			$("#numBox1_"+vId).val(mCnt);
			$("#matprice_"+vId).text(parseInt(vPrice)*parseInt(mCnt));
		} 
		
		function minusCal(vPrice,vId,vCnt) {
			if(mCnt > 1){
			mCnt = mCnt - 1 ;
			console.log("vPrice:" + vPrice  + "       vId: numBox1_"+vId + "       mCnt"+mCnt);
			}else{
				mCnt = 1;
			}
			
			$("#numBox1_"+vId).val(mCnt);
			$("#matprice_"+vId).text(parseInt(vPrice)*parseInt(mCnt));
		} 
		
		//메인상품 수량 추가, 삭제 금액
		var count = 0;
		var add_total_price = 0;
	 	$(document).on('click', '#plus', function(){
	 		if(count >=1){
	 			count += 1;
		 	
	 		}else{
	 			count = 1;
	 		}
	 		$('#numBox').val(count);
	 		
	 		add_total_price = count * 15000;
		 	$('#price_product').text(add_total_price);	

		 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;	
		 	$('#total_price').text(sum);

	 	});	

	 	$(document).on('click', '#minus', function(){
	 		if(count >= 2){
	 			count -= 1;
				 		
	 		}else{
	 			count = 1;
	 		}		 		
	 		$('#numBox').val(count);		 	
	 	add_total_price = count * 15000;
	 	$('#price_product').text(add_total_price);
	 
	 	
	 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;	
	 	$('#total_price').text(sum);
	 	
	 	
	});	
		
		 */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

			//옵션 선택 후 옵션값을 초기화함--첫번째 옵션으로 선택됨
				
		//	});
		//});
		
		//옵션의 x버튼 클릭시 삭제(토글을 이용하여 숨기고 보여줌)
	/* 	$('#delIcon1').hover(function(){
			$(this).css('cursor','pointer');
			$(document).ready(function(){
				$('#delIcon1').on('click', function(){
					$('#layer1').toggle();
					
	
				});
			});
		
		});
		
	 */	
		
		/* $('#delIcon2').hover(function(){
			$(this).css('cursor','pointer');
			$(document).ready(function(){
				$('#delIcon2').on('click', function(){
					$('#layer2').toggle();
					console.log($('#price_product').val());
				
				});
			});
		
		});
		$('#delIcon3').hover(function(){
				$(this).css('cursor','pointer');
			$(document).ready(function(){
				$('#delIcon3').on('click', function(){
					$('#layer3').toggle();
				});
			});
		
		}); */

		// 재료 수량 추가, 감소 함수 작성
		
		
		/* function plusCal(vPrice,vId,vCnt) {
			mCnt = mCnt + 1 ;
			console.log("vPrice:" + vPrice  + "       vId: numBox1_"+vId + "       mCnt"+mCnt);
			
			
			$("#numBox1_"+vId).val(mCnt);
			$("#matprice_"+vId).text(parseInt(vPrice)*parseInt(mCnt));
		} */
		
		
		/* $(document).ready(function(){
		//1. 옵션1
		var sum = 0;
		var count = 0;
		var optionCount1 = 0;
		var optionCount2 = 0;
		var optionCount3 = 0;
		var add_option_price1 = 0;
		var add_option_price2 = 0;
		var add_option_price3 = 0;
		var add_total_price = 0;

		
		
		$(document).on('click', '#plus1', function(){
	 		if(optionCount1 >=1){
	 			optionCount1 += 1;
		 		console.log(optionCount1);
	 		}else{
	 			optionCount1 = 1;
	 		}
	 		$('#numBox1').val(optionCount1);
	 		
	 		add_option_price1 = optionCount1 * 5000;
		 	$('#optionPrice1').text(add_option_price1);
		 	
			sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;
		 	$('#total_price').text(sum);
		 	
	 	});

	 	$(document).on('click', '#minus1', function(){
	 		if(optionCount1 >= 2){
	 			optionCount1 -= 1;
		 		
	 		}else{
	 			optionCount1 = 1;
	 		}
	 		
	 		$('#numBox1').val(optionCount1);
	 		add_option_price1 = optionCount1 * 5000;
	 		$('#optionPrice1').text(add_option_price1);
	 		
	 		
	 		
	 		sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;		 
		 	$('#total_price').text(sum);

		 	
	 	});
	
	 	
	 	//1. 옵션2
		var optionCount2 = 0;
		var add_option_price2 = 0;
		 	$(document).on('click', '#plus2', function(){
		 		if(optionCount2 >=1){
		 			optionCount2 += 1;
		 		}else{
		 			optionCount2 = 1;
		 		}
		 		$('#numBox2').val(optionCount2);
		 		
		 		add_option_price2 = optionCount2 * 3000;
			 	$('#optionPrice2').text(add_option_price2);
			 	
			 	
			 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;
			 	$('#total_price').text(sum);
		 	});
		 	
		 	
		 	$(document).on('click', '#minus2', function(){
		 		if(optionCount2 >= 2){
		 			optionCount2 -= 1;
			 						 		
		 		}else{
		 			optionCount2 = 1;
		 		}			 		
		 		$('#numBox2').val(optionCount2);
		 		add_option_price2 = optionCount2 * 3000;
		 	$('#optionPrice2').text(add_option_price2);
		 		
		 		
		 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;	
		 	$('#total_price').text(sum);
		 	});
		 

		 	//1. 옵션3
			var optionCount3 = 0;
			var add_option_price3 = 0;
			 	$(document).on('click', '#plus3', function(){
			 		if(optionCount3 >=1){
			 			optionCount3 += 1;
			 		}else{
			 			optionCount3 = 1;
			 		}
			 		$('#numBox3').val(optionCount3);				 		
			 		add_option_price3 = optionCount3 * 1000;
				 	$('#optionPrice3').text(add_option_price3);

				 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;		
				 	$('#total_price').text(sum);
				 	
			 	});
			 	

			 	$(document).on('click', '#minus3', function(){
			 		if(optionCount3 >= 2){
			 			optionCount3 -= 1;				 		
			 		}else{
			 			optionCount3 = 1;
			 		}				 		
			 		$('#numBox3').val(optionCount3);
			 		add_option_price3 = optionCount3 * 1000;
			 	$('#optionPrice3').text(add_option_price3);
				 	
				 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;		
				 	$('#total_price').text(sum);
			 		
			 	});


	//메인상품 수량 추가, 삭제 금액
		var count = 0;
		var add_total_price = 0;
	 	$(document).on('click', '#plus', function(){
	 		if(count >=1){
	 			count += 1;
		 	
	 		}else{
	 			count = 1;
	 		}
	 		$('#numBox').val(count);
	 		
	 		add_total_price = count * 15000;
		 	$('#price_product').text(add_total_price);	

		 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;	
		 	$('#total_price').text(sum);

	 	});	

	 	$(document).on('click', '#minus', function(){
	 		if(count >= 2){
	 			count -= 1;
				 		
	 		}else{
	 			count = 1;
	 		}		 		
	 		$('#numBox').val(count);		 	
	 	add_total_price = count * 15000;
	 	$('#price_product').text(add_total_price);
	 
	 	
	 	sum = add_option_price1 + add_option_price2 + add_option_price3 + add_total_price;	
	 	$('#total_price').text(sum);
	 	
	 	
	});	
	 	
	
	 	
	}); */

		  //<![CDATA[
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