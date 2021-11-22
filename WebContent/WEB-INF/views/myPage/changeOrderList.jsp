<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.order_ship{
		float: left; /*정렬*/
	    width: 800px; 
	    height: 200px;
	    margin-left: 30px;
		margin-top: 30px;
		font-size: 0;
		padding: 0 0 25px 25px;
		text-align: center;
	    text-align: center;
	}
	
	
	.order_refer > li{
		padding:0 0 10px 0px; 
		border-bottom:2px solid #cccccc; 
		font-size:22px; 
		font-weight: bold; 
		margin-top: 50px;
		margin-bottom: 30px;
		text-align: left;
		}
	.order_search  li{
		font-size:13px; 
		float: left;
		width: 150px;
		height: 40px;
	}
	#ship_search{
		float: left;
		font-size: x-small;
		text-align: center;
		border: 1px solid #A4A4A4;
		border-right: 1px solid #A4A4A4;
		background-color: #E2E2E2;
	
	}
	.ship_table{
		margin-top: 70px;
		margin-left: 33px;
	}
	
	.ship_button{
		background: #E2E2E2;
		cursor: pointer;
		width: 45px;
		padding: 5px 5px;
		border: 0;
	}
	#product_search {
		border: 1px solid #A4A4A4;
		border-radius: 3px;
		padding: 3px 3px;
		font-size: 1em;
	}
	#picker2{
		border: 1px solid #A4A4A4;
		border-radius: 3px;
		padding: 3px 3px;
		font-size: 1em;
		width: 100px
	}
	#picker3{
		border: 1px solid #A4A4A4;
		border-radius: 3px;
		padding: 3px 3px;
		font-size: 1em;
		width: 100px
	}
	.btn_date_check{
		width: 80px;
		height: 28px;
		font-size: x-small;
		font-weight: bold;
		border-radius: 3px;
		border: none;
		background: rgb(60, 127, 68);
		color: white;
		margin-left: 10px;
	}
	.order_form{
		align-content: flex-start;
	}
	.order_product_title{
		float: left;
		font-size: medium;
		font-weight: bold;
		margin-top: 40px;
		margin-left: 35px;
	}
	.order_search{
		background: white;
		border: none;
	}
	<!-- 날짜 조회 -->
	.order_product_form{
		margin-bottom: 50px;	
	}
	.order_product_report div{
		border: 1px solid #E2E2E2; 
		margion-bottom: 100px;
		font-size: large;
	}
	.not_order_page{
		font-size: 12px;
		text-align: left;
		margin-top: 10px;
		margin-left: 25px;
	}
	
</style>
</head>
<body>
	<%@ include file = "../common/myPage.jsp" %>
		<div class="order_ship">
				<ul class="order_refer">
					<li>주문 취소/반품/교환 내역</li>
				</ul>
				<ul class="order_search">
					<li><input type="text" id="product_search" size="53" maxlength="20" height="50px;" placeholder="주문한 상품을 검색해 보세요"></li>
				</ul>
				<%@ include file = "../myPage/dateCheck.jsp" %>

       
       		<div class="order_product_title" style="width: 100%; position: relative; text-align: left;">
                <p>주문 상품 정보</p>
			</div>
				<ul>
	           		<li class="not_order_page">- 취소/반품/교환 신청한 내역을 확일할 수 있습니다.</li>
	           		<li class="not_order_page">- 해당 목록에 없는 상품은 문의하기를 통해 문의해 주세요.</li>
				</ul>
            </div>
	

</body>
</html>