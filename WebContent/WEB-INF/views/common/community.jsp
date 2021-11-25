<%@page import="question.model.vo.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  	  ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("q");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>커뮤니티 페이지</title>
    <style>
    
    * {
  margin: 0;
  padding: 0;
}

 body {
  margin: 0 auto;
  font-family: sans-serif;
}

section a {
  color: black;
  text-decoration: none;
}

/* hearder부분 */

/* body  section부분 */

/*커뮤니티 제목부분*/
#comunity-bar {
  position: absolute;
  top: 330px;
  left: 850px;
}

#comunity-title {
  font-size: 60px;
}

#route {
  display: inline-flex;
  position: relative;
  font-size: 28px;
  left: 300px;
}

#route,
#route a {
  color: #888;
}
#route span {
  padding-left: 20px;
}

#route a:hover {
  text-decoration: none;
  color: yellowgreen;
}

/*여기까지 타이틀과 경로부분*/

/*문의 사항*/
#want-list {
  font-size: 25px;
  position: absolute;
  left: 250px;
  top: 560px;
}
#want-list li:hover {
  cursor: pointer;
  text-decoration: underline;
}
#want-list li {
  padding-bottom: 15px;
}
#want-list div {
  margin-bottom: 20px;
}
#want-list ul{
padding-left:0px;
}
#want-button {
  font-weight: 700;
  font-size: 15px;
  border: 1px solid darkgray;
  width: 100px;
  height: 30px;
  position: absolute;
  left: 380px;
  top: 10px;
  background-color: darkgray;
}
#want-more-button {
  font-weight: 700;
  font-size: 15px;
  border: 1px solid darkgray;
  width: 100px;
  height: 30px;
  position: absolute;
  left: 490px;
  top: 10px;
  background-color: darkgray;
}

#want-list-title {
  width: 362px;
  position: relative;
  background-color: gray;
  color: white;
  text-align: center;
  border: 2px solid gray;
  border-radius: 5px;
}

/*문의사항 리스트 클릭했을때 나올 메시지박스*/

.want-list-answer {
  display: none;
  list-style: none;
  width: 430px;
  height: 90px;
  border: 2px solid gray;
  border-radius: 5px;
  text-align: center;
  margin-bottom: 20px;
}
/*여기까지 문의사항*/

/*공지 사항*/
#notice-list {
  position: absolute;
  font-size: 25px;
  left: 1220px;
  top: 560px;
}

#notice-more-button {
  font-weight: 700;
  font-size: 15px;
  position: absolute;
  left: 105%;
  top: 10px;
  width: 100px;
  height: 30px;
  background-color: darkgray;
  border: 1px solid darkgray;
}
#notice-write-button {
  font-weight: 700;
  font-size: 15px;
  position: absolute;
  left: 135%;
  top: 10px;
  width: 100px;
  height: 30px;
  background-color: darkgray;
  border: 1px solid darkgray;
}
#notice-list li {
  margin-bottom: 15px;
  list-style: none;
  width:370px;
}
#notice-list li a:hover {
  color: rgb(4, 88, 4);
  cursor: pointer;
 
}

#notice-list-title {
  background-color: grey;
  color: white;
  margin-bottom: 20px;
  width: 350px;
  border: 2px solid gray;
  border-radius: 5px;
  text-align: center;
}

#notice-h2{
 width:370px;
}

/*공지사항 부분  */


#review {
  position: absolute;
  top: 1080px;
  left: 40px;
  margin-top: 50px;
}

#review-titlebar {
  position: absolute;
  left: 740px;
  width:500px;
}
#review-write{
 position:relative;
 left:350px;
 bottom:30px;
 font-weight: 700;
  font-size: 16px;
  border: 1px solid darkgray;
  width: 105px;
  height: 30px;
  background-color: darkgray;
}
#review-more-button {
  font-weight: 700;
  position: relative;
  font-size: 17px;
  left:365px;
  bottom:28px;
  width: 100px;
  height: 30px;
  background-color: darkgray;
  border: 1px solid darkgray;
}

#review-title {
  width: 340px;
  background-color: gray;
  text-align: center;
  color: white;
  font-size: 28px;
  border: 1px solid gray;
  border-radius: 5px;
}
#review-button {
  font-weight: 700;
  font-size: 15px;
  position: absolute;
  left: 365px;
  top: 10px;
  width: 100px;
  height: 30px;
  background-color: darkgray;
  border: 1px solid darkgray;
}

#review-list {
  position: absolute;
  width:1100px;
  margin-left: 80px;
  top: 150px;
  display:flex;
}
#review-list h2{
 width:600px;
 margin-left: 640px;

}

.review-list-box {
  border: 2px solid gray;
  margin-left: 110px;
  width: 300px;
  height: 336px;
}
.review-list-innerbox {
 
  width: 300px;
  height: 200px;
}
.review-list-innerbox a {
  background-position: 50% 50%;
  background-repeat: no-repeat;
  background-size: contain;
  display: block;
  width: 296px;
  height:200px;
 
}


.review-list-text  {
 border-top: 2px solid gray;
  justify-content: center;
  line-height: 40px;
  text-align: center;
  font-size:18px;
  font-weight: bolder;
}

.review-list-box:hover,
button:hover{
cursor: pointer;
 color: rgb(4, 88, 4);
}

#review-write:hover,
#review-button:hover,
#notice-more-button:hover,
#notice-write-button:hover,
#want-more-button:hover,
#want-write-button:hover,
#want-button:hover:hover,
#review-more-button:hover {
  color: gray;
}  
  </style>
</head>
<body>
 
      
       <%@include file ="./header.jsp" %>
      <!--  메인 페이지  -->
   
     <form action="#" method="post">
     <section id="comunity-bar">
      <span id="comunity-title"> 커뮤니티
      <div id="route">
        <span ><a href="#" onclick="location.href='<%=request.getContextPath() %>'" >홈</a></span>
        <span id="pointer" >--></span>
        <span><a href="#" onclick="location.href='<%=request.getContextPath()%>/community.me'">커뮤니티</a></span>
       </div>
      </span>
     </section>
    
     
    <section id="want-list">
      <button type="button" id="want-button">문의하기</button>
       <button type="button" id="want-more-button" onclick="location.href='<%=request.getContextPath() %>/questionList.bo'" >더보기</button>
      <div id=want-list-title>문의 사항</div> 
      <ul>
     <%if(list.isEmpty()){%>
					<li class="want-list-QA">문의 사항이 없습니다.</li>
				<%}else{ %>
					<%for(Question q : list){ %>
						<%if(loginUser == null){ %>
							<li class="want-list-QA">(비밀글)<%= q.getQst_title() %></li>
							<div class="want-list-answer">
								<p>비밀글입니다.</p>
							</div>
						<%}else if(loginUser.getUserId().equals(q.getUser_id())||loginUser.getManager().equals("Y")){ %>
						<li class="want-list-QA"><%= q.getQst_title() %></li>
						<div class="want-list-answer">
							
							<p><%= q.getQst_cont() %></p>
						</div>
						<%}else{ %>
						<li class="want-list-QA">(비밀글)<%= q.getQst_title() %></li>
						<div class="want-list-answer">
							<p>비밀글입니다.</p>
							
						</div>
						<%} %>
					<%} %>
				<%} %>
      </ul>
    </section>
    <script>
      $(".want-list-QA").on('click',function(){
        if($(this).next().css('display')=='none'){
          $(this).next().slideDown();
          $(this).next().siblings(".want-list-answer").slideUp();
          }else{
            $(this).next().slideUp();
          }
      });
    </script>

    <section id="notice-list">

      <button type="button" id="notice-more-button" onclick="location.href='noticeList.me'">더보기</button>
      <%if(loginUser!=null&&loginUser.getUserName().equals("운영자")){%>
      <button type="button" id="notice-write-button" onclick="location.href='noticeWrite.me'">글작성하기</button>
      <% }%>
      <div id="notice-list-title">공지 사항</div>
      <ul id="notice-list">
     </ul>
    </section>
    
    <script >
     $(document).ready(function(){
    	 $.ajax({
    		 url:"noticeTitle.me",
    		 data:{},
    		 success:function(data){
    			 console.log(data);
    			 $noticeList=$('#notice-list');
    			 
    			 if(data.length==0){
    				 console.log("데이터의 사이즈가 0");
    				 $h2=$('<h3>').text('게시된 공지사항이 없습니다.').attr('id','notice-h2');
    				 $noticeList.after($h2);
    			 }else{
    				for(var i in data){
    					 $ul=$('<ul>');
        				 $li=$('<li>');
        				 $a=$('<a>').text(data[i].noticeTitle).css('color','blck').attr('href','<%=request.getContextPath()%>/noticeDetail.me?me='+ data[i].noticeNo);
        				 $li.append($a);
        				 $noticeList.append($li);
    				}
    			 }
    		 },
    		 error:function(data){
    			 console.log(data);
    		 }
    	 });
     });
    </script>
    
 <section id="review">
      <div id="review-titlebar">
        <div id="review-title" >상품 후기</div>
           <button id="review-write" type="button" onclick="reviewWrite();">후기 작성하기</button> 
           <button type="button" id="review-more-button" onclick="location.href='<%=request.getContextPath()%>/reviewList.bo'">후기 더보기</button>
      </div>
      
     <script>
     function reviewWrite(){
    	 if('<%=loginUser%>'== "null"){
    		 var bool=confirm("회원만 이용하실수 있는 서비스입니다. 로그인 하시겠습니까?");
		    		 if(bool){
		    			 location.href='<%=request.getContextPath()%>/loginForm.me';
		    		 }
    	 }else{
			 location.href='<%=request.getContextPath()%>/writeReviewForm.bo';
    	}
     }
     
     
     </script> 
          
    <div id="review-list">
	     <!--  <div class="review-list-box">
	          <div class="review-list-innerbox"><a href="#" style="background-image: url(img/logo.png);"></a></div>
	             <div class="review-list-text"><a href="#">제목 : 대박 이것만 먹어요<br>***eqw2(아이디)<br>새싹 샐러드(상품정보)<br>2021-10-20</a></div>
	          </div> --> 
     </div> 
  
  </section>
  </form>
  
   <script>
    $(document).ready(function(){
    	$.ajax({
    		url:"selectRTitle.bo",
    		data:{},
    		success:function(data){
    			console.log(data);
    			console.log(data.rList.length);
    			console.log(data.length);
    			console.log(data.fList);
    			$reviewList=$('#review-list');
    			for(var i in data.rList){
    				console.log(data.rList[i].reviewNo);
    			}
    			
    			if(data.rList.length==0){
    			   $h2=$('<h2>').text('등록된 상품후기가 없습니다').css('width','600px');
    			   $reviewList.append($h2);
    			}else{
	    				for(var i in data.rList){
	    					for(var j in data.fList){
	    					  if(data.rList[i].reviewNo==data.fList[j].reviewNo){
	    						  $listBox=$('<div>').attr('class','review-list-box').attr('onclick','clickReview('+data.rList[i].reviewNo+');'); 
	    						
	  		    				$innerBox=$('<div>').attr('class','review-list-innerbox');
	  		    				$innerA=$('<a>').attr({
	  		    					style:"background-image: url(thumbnail_uploadFiles/"+data.fList[j].imgChangeName+")",
	  		    					'class':'review-image'
	  
	  		    				});
	  		    				$textBox=$('<div>').attr('class','review-list-text');
	  		    				$textA=$('<a>').html('제목 :'+data.rList[i].reviewTitle+'<br>'+'작성자: '+data.rList[i].userName+'<br>'+'작성일 :'+data.rList[i].modifyDate);
	  		    				
	  		    				$textBox.append($textA);
	  		    				
	  		    			    $innerBox.append($innerA);
	  		    				
	  		    				$listBox.append($innerBox);
	  		    				$listBox.append($textBox);
	  		    				
	  		    				$reviewList.append($listBox);
	    					  }
	    				}
	    			}		
    			}
    		},
    		error:function(data){
    			console.log(data);
    		}
    	});
    });
    
   
    function clickReview(no){
    	var reviewNo=no;
    	if('<%=loginUser%>' != "null"){
    		 location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId='+reviewNo;
    	}else{
    		var bool=confirm('회원만 이용하실 수 있는 서비스입니다. 로그인하시겠습니까?');
    		if(bool){
    			location.href='<%=request.getContextPath()%>/loginForm.me';
    		}
    	}
    }
   </script>

</body>
</html>