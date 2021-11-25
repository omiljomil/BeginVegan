<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,User.model.vo.*,review.model.vo.*,page.PageInfo" %>
  <%
  
   PageInfo pi=(PageInfo)request.getAttribute("pi"); 
  ArrayList<Review> rList=(ArrayList<Review>)request.getAttribute("rList");
  ArrayList<Photo>fList=(ArrayList<Photo>)request.getAttribute("fList");

 
  %>  
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <title>상품후기 목록페이지</title>
    
    
   <style>
   * {
  margin: 0;
  padding: 0;
}
body {
  margin: 0 auto;
  font-family: sans-serif;
}
#title-box {
  width:1500px;
  height:300px;
  margin-top: 100px;
  margin-left:auto;
  margin-right:auto;
}

#review-title {
  display:flex;
  margin:20px auto;
  margin-left:auto;
 
  justify-content:center;
  font-size: 60px;
}
#route {
  display:flex;
  color: #888;
  padding-left: 10px;
  font-size: 29px;
  justify-content: flex-end;
}
#route a {
  color: #888;
  text-decoration: none;
}
#route div {
  display: inline-block;
  padding-left: 10px;
}
#route a:hover {
  text-decoration: none;
  color: yellowgreen;
}
#search {
 margin-top:30px;
 margin-left:50px;
 width:500px; 
}

#search-box-title {
  border: 2px solid darkgray;
  width: 140px;
  height: 49px;
  text-align: center;
  font-size: 18px;
}


#search-box-option {
  border: 1px solid darkslategrey;
  width: 200px;
  height: 45px;
  text-align: center;
  font-size: 20px;
  background-color: gray;
  color: rgb(242, 243, 241);
  border-radius: 5px;
}
#search-box-option option {
  background-color: white;
  color: black;
}

#search-box {
  width: 250px;
  height: 45px;
}

/*타이틀, 검색부분*/

#review {

 width:1200x;
 height:700px;
 margin-top:50px;
 margin-left:150px ;
 margin-right:100px;
  
  
}
.review-list {
   display:inline-block;
   margin-left: 50px;
   margin-right:100px;
  width:1200x;
  height:800px;
  align:center;
  
}
.review-list-box {
  margin-left: 50px;
  margin-top:100px;
  border: 2px solid gray;
  display:inline-block;
  width: 270px;
  height: 300px;
 
}
.review-list-innerbox {
  width: 250px;
  height: 180px;
}
.review-list-innerbox img{
 width:266px;
 height:180px;
}
.review-list-innerbox img:hover{
  cursor:pointer;
}
.review-list-text {
  border-top:2px solid gray;
  text-align: center;
  line-height: 30px;
 
}
.review-list-text a {
  font-weight:600;
  text-decoration:none;
  color: black;
  font-size: 16px;
}
.review-list-text :hover{
  color:rgb(4, 88, 4);
   text-decoration:none;
}
.review-list h2{
 text-align:center;
 width:500px;
 margin-top:350px;
}
/*페이징  */
#paising {
  display: flex;
  margin-top:150px;
  justify-content: center;
  
}
.paising-button {
    text-align:center;
    font-size: 30px;
	margin-right: 30px;
	border: none;
	 background-color: white; 
	 color:black;
}
#paising-number:hover {
	background-color: yellowgreen;
	border-radius: 10px;
}

#insertBtn{
 float:right;
 margin-top:100px;
 margin-right:100px;
 font-weight: 600;
 font-size: 20px;
 border:2px solid darkgray;
 color:black;
 background-color: beige;
}
#insertBtn:hover{
 color:rgb(4, 88, 4);
}
   </style> 
</head>
<body>
    <%@ include file = "../common/header.jsp" %>

        <section id="title-box">
            <span id="review-title">상품후기</span>

            <div id="route">
            <div><a href="<%=request.getContextPath() %>/">홈</a></div>
            <div>--></div>
            <div><a href="<%=request.getContextPath() %>/community.me">커뮤니티</a></div>
             <div>--></div>
            <div><a href="<%=request.getContextPath()%>/reviewList.bo">상품 후기</a></div>
            </div>

          <!--   <div id="search">
            <form action="#" method="#">
           
              <select name="search-box-option" id="search-box-option">
                <option value="">전체 검색</option>
              <option value="">글 번호</option>
              <option value="">글 제목</option>
              <option value="">글 내용</option>
              </select>
              <input type="text" id="search-box">
              </form>
            </div> -->
        
        </section>

         <section id="review">
            <div class="review-list">
               <%if(rList.isEmpty()||fList.isEmpty()){ %>
               		<h2>등록된 상품 후기가 없습니다.</h2>
               	<%}else{ %>
         
               	<%for(int i=0; i< rList.size(); i++){ %>
               	      <%Review r=rList.get(i);%>
               	   <div class="review-list-box">
                 	    <input type="hidden"  value="<%=r.getReviewNo() %>">
                 	    <div class="review-list-innerbox"> 
                    <%for (int j=0; j<fList.size(); j++){ %>
                         <%Photo p=fList.get(j);%>
                         <%if(r.getReviewNo()==p.getReviewNo()){ %>
                         <img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=p.getImgChangeName() %>">
                       	<%} %>
					<%} %>
				</div>	
                       <div class="review-list-text"><a href="#">제목 :<%=r.getReviewTitle() %><br>작성자 : <%=r.getUserName() %><br>작성일 :<%=r.getEnrollDate() %></a></div>
                    </div>
                   <%} %>
               <%} %>
            </div>
            
                
        </section>   
        
         <script>
		  $('.review-list-box').click(function(){
			  if('<%=loginUser%>' == "null"){
			  var bool=confirm('회원만 이용하실 수 있는 서비스입니다. 로그인하시겠습니까?');
			  if(bool){
	    			location.href='<%=request.getContextPath()%>/loginForm.me';
	    		}
			  }else{
			 var bId=$(this).children().eq(0).val();
			 location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId='+bId;
			  }
		  });
  
 		</script>
        
         <%if(loginUser!=null){%>
         <input type="button" onclick="location.href='writeReviewForm.bo'" id="insertBtn" value="작성하기">
          <%} %> 

        <section id="paising">
       <!-- 맨 처음으로  -->

           <button class="paising-button" type="button" onclick="location.href='<%=request.getContextPath()%>/reviewList.bo?currentPage=1'">◀</button>
          
          
          <%--  <!-- 이전페이지 -->
            <button id="beforeBtn" onclick="location.href='/SemiTest_JSPServlet/reviewList.bo?currentPage=<%=pi.getCurrentPage()-1 %>'" >◀ </button>
         <script>
		    if(<%=pi.getCurrentPage()%><=1){
		    	$('#beforeBtn').prop('disabled',true);
		    }
		  </script> --%>
         
          <!-- 숫자버튼 -->
       
          <%for (int p=pi.getStartPage(); p<=pi.getEndPage();p++){ %>
           <%if(p == pi.getCurrentPage()){ %>
           <button class="paising-button" id="paising-number"  disabled>&nbsp;<%=p %>&nbsp;</button>
           <%} else{ %>
           <button  class="paising-button" id="paising-number"  onclick="location.href='<%=request.getContextPath()%>/reviewList.bo?currentPage=<%=p%>'">&nbsp;<%=p %>&nbsp;</button>
            <% } %>
           <%} %>
           
           
         <%--   <!-- 다음 페이지로  -->
           <button id="afterBtn" onclick="location.href='/SemiTest_JSPServlet/reviewList.bo?currentPage=<%=pi.getCurrentPage()+1 %>'" >▶ </button>
          <script>
          if(<%=pi.getCurrentPage() %>>=<%=pi.getMaxPage()%>){
			   $('#afterBtn').prop('disabled',true);
		   }
          </script> --%>
          
          
           <!-- 맨 끝으로 -->
           <button class="paising-button" onclick="location.href='<%=request.getContextPath()%>/reviewList.bo?currentPage=<%=pi.getMaxPage()%>'">▶</button>
      </section> 
 
</body>
</html>