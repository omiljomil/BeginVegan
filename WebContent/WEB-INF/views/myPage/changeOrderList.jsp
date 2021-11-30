<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, paiement.model.vo.Paiement,
      product.model.vo.*, myPage.model.vo.PageInfo"%>
<% 
   ArrayList<Paiement> list = (ArrayList)request.getAttribute("list"); 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Photo> fList = (ArrayList<Photo>)request.getAttribute("fList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

<style>
   .order_ship{
      float: left; /*정렬*/
       width: 800px; 
       height: 200px;
       margin-left: 30px;
      margin-top: 30px;
      margin-bottom: 30px;
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
   .not_order_page{
      font-size: 12px;
      text-align: left;
      margin-top: 10px;
      margin-left: 25px;
   }
   .order_both{
      margin-left: 40px;
      width: 90%;
        height: 230px;
   }
   .left{
       width: 77%;
       height: 230px;
         float: left;
         font-size: 15px;
         border: 1px solid #E2E2E2;
         border-radius: 10px;
   }
   
   .right{
      width: 23%;
      height: 230px;
        float: right;
         font-size: 15px;
         border: 1px solid #E2E2E2;
         border-style: dashed;
   }
   

   .order_left_table {
       margin: 25px 20px 20px 20px;
   }

   .sub_order_left_table{
      width: 110px;
      height: 60px;
      font-size: 14px;
      text-align: left;
   }
   .sub_order_right_table{
      width: 180px;
      height: 60px;
      font-size: 14px;
      text-align: left;
   }
   
   #shipBtn{
   box-shadow: 3px 4px 0px 0px #3e7327;
      background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
      background-color:#77b55a;
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
      border:1px solid #4b8f29;
      display:inline-block;
      cursor:pointer;
      color:#ffffff;
      font-family:Arial;
      font-size: 13px;
      padding:6px 10px;
      text-decoration:none;
      text-shadow:0px 1px 0px #5b8a3c;
   }
   #reorderBtn{
      box-shadow: 3px 4px 0px 0px #3e7327;
      background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
      background: rgb(60, 127, 68);
      border-top-left-radius: 5px;
      border-bottom-left-radius: 5px;
      border:1px solid #4b8f29;
      display:inline-block;
      cursor:pointer;
      color:#ffffff;
      font-family:Arial;
      font-size: 13px;
      padding:6px 10px;
      text-decoration:none;
      text-shadow:0px 1px 0px #5b8a3c;
   }
   .rightBtn{
      margin-left: 25px;
      margin-top: 40px;
   }
   .sub_right_table{
      text-align: left;
      width: 100px;
      height: 70px;
   }
      #orderName, #orderAmount, #orderPrice{
      font-size: 13px;
      font-family: 'Black Han Sans', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
      text-indent: 10px;
   }
   #orderDate{
      font-size: 25px;
      font-family: 'Black Han Sans', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: bold;
      width: 140px;
      height: 60px;
      text-align: left;
      text-indent: 10px;
   }
   #orderType {
      font-size: 23px;
      font-family: 'Black Han Sans', sans-serif;
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: bold;
      width: 140px;
      height: 60px;
      text-align: left;
   }
   
   .pagingArea .pageBtn{
   margin-top: 80px;
   margin-bottom: 40px;
   background: white;
   width: 40px;
   height: 40px;
   font-size: 14px;
   color: black;
   border: 0px;
   font-size: 16px;
   font-family: 'Black Han Sans', sans-serif;
   font-family: 'Noto Sans KR', sans-serif;
   color: rgb(60, 127, 68);
   }
   
</style>
</head>
<body>
   <%@ include file = "../common/myPage.jsp" %>
      <div class="order_ship">
            <ul class="order_refer">
               <li>주문 취소 조회</li>
            </ul>
            
            <ul class="order_search">
               <li><input type="text" id="product_search" size="53" maxlength="20" height="50px;" placeholder="주문한 상품을 검색해 보세요"></li>
            </ul>
            <%@ include file = "../myPage/dateCheck.jsp" %>

       
             <div class="order_product_title" style="width: 100%; position: relative; text-align: left;">
                <p>주문 상품 정보</p>
         </div>
         <%if(list.isEmpty()) { %>
            <ul>
                    <li class="not_order_page">- 취소 신청한 내역을 확일할 수 있습니다.</li>
                    <li class="not_order_page">- 해당 목록에 없는 상품은 문의하기를 통해 문의해 주세요.</li>
            </ul>
         <%} else {%>
         <%      for(int i = 0; i <list.size(); i++) { %>
               <div class="order_both">
               <input type="hidden" id="orderNo" value="<%= list.get(i).getOrderNo() %>">
                  <div class="left" style="margin-top: 30px;">
                     <table class="order_left_table">
                        <tr>
                        <td  colspan="2" class="sub_orderDate" id="orderDate"><%= list.get(i).getEnrollDate() %></td>
                        
                              <%
                                    
                                       String type="";
                                       switch(list.get(i).getOrderType()) {
                                       case 0:
                                          type="주문 완료"; break;
                                       case 1:
                                          type="상품 준비중"; break;
                                       case 2:
                                          type="베송중"; break;
                                       case 3: 
                                          type="배송 완료"; break;
                                       case 4:
                                          type="주문 취소"; break;
                                       default: 
                                          type="관리자 문의";
                                       }
                                    
                                    %>
                        
                        <td colspan="3" class="sub_order_right_table" id="orderType" style="text-indent: 15px;"><%= type %></td>
                        </tr>
                        <tr>
                           <td rowspan="5" style="height: 100px; width: 100px; text-indent: 10px;">
                           <% for(int j = 0; j < fList.size(); j++) { %>
                           <% Photo ph = fList.get(j); %>
                           <% if(list.get(i).getProdNo() == ph.getProdNo() && ph.getType() == 0) { %>   
                              <a href="<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>">
                                 <img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%= ph.getImgChangeName() %>" width="100%" height="100%">
                              </a>
                           <% } %>
                        <% } %>
                           </td>
                           <td rowspan="5" style="height: 100px; width: 10px;"></td>
                           <td class="sub_order_left_table" id="orderName"  style="text-indent: 18px;"><%= list.get(i).getProdName() %></td>
                           <td class="sub_order_right_table" id="orderAmount"><%= list.get(i).getAmount() %>개</td>
                        </tr>
                        <tr>
                           <td class="sub_order_left_table"  id="orderPrice" style="vertical-align: top; text-indent: 18px;"><%= list.get(i).getPrice()%>원</td>
                           <td class="sub_order_right_table" id="orderAmount" style="vertical-align: top;"><%= list.get(i).getAmount()%>개</td>
                        </tr>
                     </table>
               </div>
               <div class="right" style="margin-top: 30px;">
                  <div class="rightBtn">
                     <table class="right_table">
                        <tr>
                           <td class="sub_right_table"><input type="button" id="shipBtn" value="배송 조회" class="orderBtn"></td>
                        </tr>
                        <tr>
                           <td class="sub_right_table"><input type="button"  id="reorderBtn" value="상품 재주문" class="orderBtn"
                           onclick="location.href='<%=request.getContextPath() %>/proDetail.bo?pNo=<%= list.get(i).getProdNo() %>'">
                           </td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
            <%      } %>
         <% } %>
         
         <div class="pagingArea" align="center">
            <% if(list.isEmpty()) { %>
               <div class="layout" id="space7"></div>
            <% } else { %>
               <!-- 이전 페이지로 -->
               <input type="button" id="beforeBtn" class="pageBtn"
                  onclick="location.href='<%= request.getContextPath() %>/deleteOrderList.pe?currentPage=<%= pi.getCurrentPage() - 1 %>'"
                  value="&#11164;">
               <script>
                  if(<%= pi.getCurrentPage() %> <= 1) {
                     $('#beforeBtn').prop('disabled', true);
                     $('#beforeBtn').css({'cursor':'text', 'color':'#bbb'});
                  }
               </script>
               
               <!-- 숫자 버튼 -->
               <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
                  <% if(p == pi.getCurrentPage()) { %>
                     <input type="button" class="pageBtn" id="choosen" disabled value="<%= p %>">
                  <% } else { %>
                     <input type="button" id="numBtn" class="pageBtn"
                        onclick="location.href='<%= request.getContextPath() %>/deleteOrderList.pe?currentPage=<%= p %>'"
                        value="<%= p %>">
                  <% } %>
               <% } %>
               
               <!-- 다음 페이지로 -->
               <input type="button" id="afterBtn" class="pageBtn"
                  onclick="location.href='<%= request.getContextPath() %>/deleteOrderList.pe?currentPage=<%= pi.getCurrentPage() + 1 %>'"
                  " value="&#11166;">
               <script>
                  if(<%= pi.getCurrentPage() %> >= <%= pi.getMaxPage() %>) {
                     $('#afterBtn').prop('disabled', true);
                     $('#afterBtn').css({'cursor':'text', 'color':'#bbb'});
                  }
               </script>
               
               <!-- 맨 끝으로
               <input type="button" id="lastBtn" class="pageBtn"
                  onclick="location.href='<%= request.getContextPath() %>/deleteOrderList.pe?currentPage=<%= pi.getMaxPage() %>'"
                  value="끝">
               <script>
                  if(<%= pi.getCurrentPage() %> == <%= pi.getMaxPage() %>) {
                     $('#lastBtn').prop('disabled', true);
                     $('#lastBtn').css({'cursor':'text', 'color':'#bbb'});
                  }
               </script>
                  -->
            <% } %>
            </div>
         
            </div>
 <script>

 </script>        
   

</body>
</html>