<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.*,User.model.vo.*"%>
  
<%
Review r=(Review)request.getAttribute("review");
String userName=r.getUserName();
 ArrayList<Photo> f=(ArrayList<Photo>)request.getAttribute("fileList"); 
 ArrayList<Comment>cList=(ArrayList<Comment>)request.getAttribute("cList");
 
  %>  

<!DOCTYPE html>
<html lang="en">
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>상품후기  상세 페이지</title>
     <script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <style>
 * {
  box-sizing: border-box;
}
section{
 margin-top: 100px;
}
body {
  margin: 0 auto;
   font-family: 'Black Han Sans', sans-serif;
font-family: 'Noto Sans KR', sans-serif;
}
.review-title {
  margin-left: 140px;
  font-size: 30px;
  font-family: 'Black Han Sans', sans-serif;
font-family: 'Noto Sans KR', sans-serif;
}
#review{
  font-size: 30px;
  font-family: 'Black Han Sans', sans-serif;
font-family: 'Noto Sans KR', sans-serif;
}

#route {
  position: relative;
  display: flex;
  justify-content: right;
  bottom: 100px;
  right: 150px;
  font-size: 29px;
  color:gray;
}

#route a{
text-decoration: none;
  color:gray;
}

#route a:hover {
  color: yellowgreen;
}
/*루트 타이틀부분  */

#review-list{
width:800px;
}
#review-table {
  position: relative;
  left: 150px;
  height: 100px;
  border:1px solid gray;
}
#review-table th{
border:2px solid gray;
text-align: center;
 
}
#review-date {
  text-align: center;
  width: 450px;
  height: 35px;
  border: 1px solid darkgray;
  margin-left: 150px;
}

#review-content {
  position:relative;
  top:40px;
  height: 500px;
  margin-left:150px;
}
hr {
  border: 1.5px solid gray;
}

#answer-title {
  margin-left: 150px;
  font-weight: 600;
  font-size: 30px;
}
p {
  margin-left: 150px;
  font-size: 19px;
}
#inform{
 width:500px;
}

#outform  {
  position: relative;
  top: 100px;
  margin-top: 50px;
  margin-left: 280px;
}
#outform textarea {
  background-color: rgba(175, 172, 172, 0.712);
  color: black;
}
#answer-content-acept {
  position: relative;
  bottom: 45px;
  left: 50px;
  width: 100px;
  height: 40px;
  font-weight: 600;
  background-color: gray;
  color: white;
  border: 1px solid darkgrey;
}
#answer-content-acept:hover {
  color: greenyellow;
}
#button-bind1 {
  position: absolute;
  left: 830px;
  bottom: 880px;
}
form input {
  margin-left: 15px;
}
#go-button {
  position: relative;
  width: 80px;
  left: 800px;
  top: 200px;
}

#go-button a {
   text-decoration: none;
  font-size: 18px;
  font-weight: 800;
  color: black;
}

#CommentTable input:hover,
#delete-button:hover,
#modify-button:hover,
#go-button a:hover {
  color: yellowgreen;
  text-decoration: none;
}

#answer-box{
 position:relative;
 margin-top:100px;
  margin-left:150px;
}
#CommentTable{
  margin-left: 150px;
}

#CommentTable  tbody tr{
 margin-bottom:30px;
}
#CommentTable input{
 border:none;
 background-color: white;
}
#next-or-back {
  position: relative;
  margin-left:280px;
  top: 150px;
   border-collapse: collapse ;
}

#next-or-back th{
 border:2px solid darkgray;
 text-align: center;
}
.table-a:hover{
  color: rgb(4, 88, 4);
  cursor:pointer;
}
.table-a{
 display:inline-block;
 margin-top:7px;
 color:black;
}
#delete-button{
width:65px;
position:absolute;
top:1350px;
left:1280px;
font-weight:600;
}

#modify-button{
width:65px;
position:absolute;
top:1350px;
left:1170px;
font-weight:600;
}
#cke_notcie-content-text{
 width:1000px;
 height:500px;
}

 </style>   
    
</head>
<body>
   
    <%@ include file = "../common/header.jsp" %>     
    <section>
        <div id="review">
                <div class="review-title" style="font-size: 30px;">상품후기</div>
                
                <div id="route">
                    <span><a href='<%=request.getContextPath() %>/'>홈</a></span>
                    <span>-></span>
                    <span><a href='<%=request.getContextPath() %>/community.me'>커뮤니티</a></span>
                    <span>-></span>
                    <span><a href='<%=request.getContextPath() %>/reviewList.bo'>상품후기</a></span>
                </div>
        </div>
     <form action="<%= request.getContextPath() %>/reviewUpdateForm.bo" method="post" id="inform"> 
        <div id="review-list" >
            <table id="review-table" >
                <tr>
                   <th colspan="2" rowspan="2"> <a href="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=f.get(0).getImgChangeName() %>" >
		              	<img id=detailImg width="180" height="199" class="detailImg"src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=f.get(0).getImgChangeName() %>">
		              	<input type="hidden" name="file"value="<%=f.get(0).getImgChangeName() %>">
	                   </a></th>
                    <th  width="130px" height="50px">제목</th>
                    <th width="380px" height="50px"><input type="hidden" name="title" value="<%=r.getReviewTitle() %>"><%=r.getReviewTitle() %></th>    
                </tr>
                <tr>
                    <th width="130px" height="50px"> 작성자</th>
                    <th><input type="hidden" name="wirter" value="<%=r.getUserName()%>"><%=r.getUserName()%></th>
                </tr>
            </table>
            <div id="review-date"><span>작성일: <%=r.getEnrollDate()%></span></div> 
             <input type="hidden" name="date" value="<%=r.getEnrollDate() %>">
            <input type="hidden" id="reviewNo" name="reviewNo" value="<%=r.getReviewNo() %>">
            </div>
            
         <div id="review-content"> 
                <textarea id="notcie-content-text" cols="150" rows="20" readonly="readonly"name="content"><%=r.getReviewCon()%></textarea> 
        </div>
         <%if (loginUser!=null&&loginUser.getUserName().equals(userName)||loginUser.getUserName().equals("운영자")){ %>
         <button type="submit" id="modify-button" class="system">수정</button>
         <button type="button" id="delete-button" class="system" onclick="deleteReview();" >삭제</button>
         <%} %>
   
     <script>
     
     CKEDITOR.replace('content'
               , {height: 500 ,
               	
                }); 
     function deleteReview(){
     	var bool= confirm("정말삭제하시겠습니까?");
 		if(bool){
 		 $('#inform').attr('action','reviewDelete.bo');
 		 $('#inform').submit();
 		}    	
     }
     
     
     
     </script>
     </form>   
        <br><br><br><br><br><br>
        <hr>

       <div id="answer-box">
        <span id="answer-title">댓글</span><br><br>
          <table id="CommentTable">
         <%if(cList.isEmpty()){ %>
            <tr><td colspan="3">댓글이 없습니다.</td></tr>
             <%}else {%>
		  	       <% for(int i=0; i<cList.size(); i++){ %>
         			<tr>
		  	         		<td width="200px"><%=cList.get(i).getUserName() %><input id="commentNo" type="hidden" value="<%=cList.get(i).getCommentNo()%>"></td>
		  	         		<td width="300px"><%=cList.get(i).getCommentCont() %><input id="content" type="hidden" value="<%=cList.get(i).getCommentCont() %>"></td>
		  	         		<td width="200px"><%=cList.get(i).getModifyDate() %></td>
		  	         		<td><input type="hidden" id="comtUserId"value="<%=cList.get(i).getUserId() %>" ></td>
		  	         		<td><input type="hidden" id="comtUserName"value="<%=cList.get(i).getUserName() %>" ></td>
		  	         		<%if(loginUser.getManager().equals("Y")|| loginUser.getUserName().equals(cList.get(i).getUserName())){ %>
		  	         		<td width="70px"><input type="button" value="수정" onclick="updateComment(<%=cList.get(i).getCommentNo()%>);"></td>
		  	         		<td width="70px"><input type="button" value="삭제" onclick="deleteComment(<%=cList.get(i).getCommentNo()%>);"></td>
		  	         		
		  	         	<%} %>	
		  	         </tr>
		  	         <%} %>
		  	      <%} %> 
        </table>
      
     </div>   
        
    <form action="#" method="#" id="outform">
    

    <textarea name="#" id="answer-content" cols="100" rows="5" placeholder="댓글내용 입력"></textarea>
    <input type="button" value="확인" id="answer-content-acept">  
    </form>
      <script>
      function updateComment(no){
	    	  var bool=confirm("댓글을 수정 하시겠습니까?");
	    	  if(bool){
	    		  var bId=<%=r.getReviewNo()%>;
	    		  var content=$("#content").val();
	    		  
	    		  $.ajax({
	    			 url:"deleteComment.bo",
	    			 data:{bId:bId,commentNo:no},
	    			 success:function(data){
	    				 console.log(data);
	    				 $('#answer-content').val(content);
	    				 $('#commentNo').parent().parent().remove(); 
	    			 },
	    			 error:function(data){
	    				 console.log(data);
	    			 }
	    		  }); 
	    	  }
      }
      
      function deleteComment(no){
    	  var bool=confirm("댓글을 삭제하시겠습니까?");
    		  if(bool){
    			  var bId=<%=r.getReviewNo()%>
    	    	  
    	    	  $.ajax({
    	    		  url:"deleteComment.bo",
    	    		  data:{bId:bId,commentNo:no},
    	    		  
    	    		  success:function(data){
    	    			  console.log(data);
    	    			  alert("댓글이 삭제 되었습니다.");
    	    			  window.location.reload();
    	    		  },
    	    		  error:function(data){
    	    			  console.log(data);
    	    		  }
    	    	  });
    	      }
    	}
    	  
    	
     $('#answer-content-acept').on('click',function(){
    	 var content=$('#answer-content').val();
    	   if($.trim(content)==""){
    		   alert("댓글 내용을 입력해주세요.");
    	   }else{
    		   var writer='<%=loginUser.getUserId()%>';
    	    	 var bId=<%=r.getReviewNo()%>;
    	    	 
    		   $.ajax({
    	    		url:'insertComment.bo',
    	    		data:{writer:writer,content:content,bId:bId},
    	    		success:function(data){
    	    			console.log(data);
    	    			$CommentTable=$('#CommentTable');
    	    			$CommentTable.html('');
    	    			
    	    			
    	    			for(var i in data){
    	    				var $tr=$('<tr>');
    	    				var $writerTd=$('<td>').text(data[i].userName).css('width','200px');
    	    				
    	    				
    	    				var $contentTd=$('<td>').text(data[i].commentCont).css('width','300px');
    	    				var $dateTd=$('<td>').text(data[i].modifyDate).css('width','200px');
    	    				var comtUserName=$('#comtUserName').val();
    	    				
    	    				
	    	    				/* var $updateBtn=$('<td>').html($('<input>').attr({
	    	    					type:'button',
	    	    					value:'수정',
	    	    					onclick:'updateComment('+data[i].commentNo+');'
	    	    				})).css('width','70px');
	    	    				
	    	    				var $deleteBtn=$('<td>').html($('<input>').attr({
	    	    					type:'button',
	    	    					value:'삭제',
	    	    			        onclick:'deleteComment('+data[i].commentNo+');'
	    	    				})).css('width','70px'); */
	    	    			   $tr.append($writerTd);
	    	    			   $tr.append($contentTd);
	    	    			   $tr.append($dateTd);
	    	    			  /*  $tr.append($updateBtn); */
	    	    			   /* $tr.append($deleteBtn); */
	    	    			   $CommentTable.append($tr);
	    	    			  
    	    				
    	    			}
    	    			$('#answer-content').val('');
    	    			alert('댓글이 입력되었습니다.');
    	    			window.location.reload();
    	    			
    	    		},
    	    		error:function(data){
    	    			console.log(data);
    	    		}
    	    	 });
    	   }
    	 
      });
      </script>
       <div id="next-or-back">
       
          <!--   <table id="NBtable">
               <tr>
                <th width="200px" height="40px">이전 글</th>
                <th width="500px;" ><a href="#"></a></th>
            </tr>

            <tr>
                <th height="40px">다음 글</th>
                <th><a href="#"></a></th>
            </tr>
           </table>  -->
       </div>
       
        <script>
       $(document).ready(function(){
    	   var reviewNo=$('#reviewNo').val();
    	   //이전글
    	 $.ajax({
	    		 url:"selectReviewBack.bo",
		         data:{reviewNo:reviewNo},
		         success:function(data){
			       	 console.log(data);
				       	  if(data!=null){
					       	  console.log(data.revieweNo);
					       	  $nextOrBack=$('#next-or-back');
					       	  $table=$('#NBtable');
					       	  $tr=$('<tr>');
					       	  
					       	  $th=$('<th>').css({
					       		  'width':'200px',
					       		  'height':'40px'
					       	  }).text("이전 글");
					       	  
					       	  $backTh=$('<th>').css('width','500px');
					       	  $a=$('<a>').attr('onclick','clickReview('+data.reviewNo+')').text(data.reviewTitle).attr('class','table-a').css({
					       		'text-decoration':'none'
					       
					       	  });
					       	  
					       	  $backTh.append($a);
					       	  
					       	  
					       	  $tr.append($th);
					       	  $tr.append($backTh);
					       	  
					       	  $nextOrBack.append($tr);
		       		  }
		       	  
		         },
		         error:function(data){
		       	  console.log(data);
		         }
    	 }); 
    	 //다음 글
    	 $.ajax({
    		 url:"selectReviewNext.bo",
	         data:{reviewNo:reviewNo},
	         success:function(data){
	       	  console.log(data);
		       	  if(data!=null){
		       	 	 console.log(data.reviewNo);
		       	  
			       	  $nextOrBack=$('#next-or-back');
			       	  $table=$('#NBtable');
			       	  $tr=$('<tr>');
			       	  
			       	  $th=$('<th>').css({
			       		  'width':'200px',
			       		  'height':'40px'
			       	  }).text("다음 글");
			       	  
			       	  $backTh=$('<th>').css('width','500px');
			       	  $a=$('<a>').attr('onclick','clickReview('+data.reviewNo+')').text(data.reviewTitle).attr('class','table-a').css({
				       		'text-decoration':'none'
				       		
				       	  });;
			       	  
			       	  $backTh.append($a);
			       	  
			       	  
			       	  $tr.append($th);
			       	  $tr.append($backTh);
			       	  
			       	  $nextOrBack.append($tr);
		       	  	}
		         },
	         error:function(data){
	       	  console.log(data);
	         }
	 	}); 
    });
       
       function clickReview(no){
    	   var reviewNo=no;
    	   location.href='<%=request.getContextPath()%>/reviewDetail.bo?bId='+reviewNo;
       }
       </script>
      
      
      
       <button type="button" id="go-button"><a href="<%=request.getContextPath()%>/reviewList.bo" >목록</a></button>
       
  </section>
    
</body>
</html>