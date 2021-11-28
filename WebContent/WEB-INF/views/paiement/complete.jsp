<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
   .complete_title{
      border-bottom: 1px solid #E2E2E2;
      margin-top: 150px;
      min-height:100%;
      box-sizing: border-box;
      margin: 0 auto;
      width: 600px;
   }
   .orderIcon{
      margin-top: 150px;
      text-align: center;
      font-size: 40px;
      color: rgb(60, 127, 68);
      list-style: none;
      font-size: 95px;
   }
   .orderCom{
      margin-top: 20px;
      margin-bottom: 40px;
      text-align: center;
      font-size: 23px;
      color: #606060;
      list-style: none;
   }
   .compBtn{
      text-align: center;
   }
   #orderBtn{
      margin-left:20px;
      margin-right: -4px;
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
      font-size: 15px;
      font-weight:bold;
      padding:12px 44px;
      text-decoration:none;
      text-shadow:0px 1px 0px #5b8a3c;
   }
   #mainBtn{
      margin-top: 50px;
      font-size: 15px;
      margin-left:-3px;
      box-shadow: 3px 4px 0px 0px #3e7327;
      background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
      background: rgb(60, 127, 68);
      border-bottom-right-radius: 5px;
      border-top-right-radius: 5px;
      border:1px solid #4b8f29;
      display:inline-block;
      cursor:pointer;
      color:#ffffff;
      font-family:Arial;
      font-weight:bold;
      padding:12px 44px;
      text-decoration:none;
      text-shadow:0px 1px 0px #5b8a3c;
   }
   .compBtn button:hover{
      color: white;
      background: rgb(60, 127, 68);
   }
</style>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
      <div class="complete">
      <div class="complete_title">
         <ul>
            <li class="orderIcon"><i class="fas fa-user-check"></i></li>
            <li class="orderCom">고객님의 주문이 완료되었습니다.</li>
         </ul>
      </div>
      <div class="compBtn">
         <input type="button" class="allBtn" id="orderBtn" value="주문 내역" onclick="location.href='<%=request.getContextPath() %>/orderList.me'">
         <input type="button" class="allBtn" id="mainBtn" value="메인 화면" onclick="location.href='<%=request.getContextPath() %>'">
      </div>
   </div>


</body>
</html>
