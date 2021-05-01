<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.review.model.vo.Review, com.kh.common.model.vo.PageInfo" %>
 <%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
 
	ArrayList<Review> ctlist = (ArrayList<Review>)request.getAttribute("ctlist");
 	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> noticeReviewPage </title>

   <!-- boardMenu css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/customerBoardMenu.css">

    <!-- boardMenu fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<style>
	div {border: 1px; }

	/* 전체 랩 */
	.reviewList-wrap{width: 700px; margin: auto; height:500px; }
	
	/*  테이블 랩 */
	.reviewList-wrap table { 
	    text-align: center;
	    margin: auto;
	    width: 680px;

	}
	#title-wrap {
	    padding-top: 20px;
	    margin: 5px;
	    margin-left: 30px;
	
	}
	
	.review-sum {margin-left:45px}
	/* 총 게시글 수 */
	
	.review-sum span{
	
	    font-size: small;
   
	}
	.search-wrap{ 
	    float: right;
	    width: 300px;
	}
		
	.clear {clear:both; height:0; overflow:hidden;}
	
	.review-table{
	    padding: 20px;
	    margin: 10px;
	    margin-top: 10px;
	
}
</style>



	<body>
	<%@ include file = "../common/customerMenubar.jsp" %>
	
	<div class="reviewList-wrap" align="center">
		<div class="board_menu">       
        	
 	<div id="title-wrap" align="left">
    
    	<div class="review-sum" align="left">
    	<br>
    	<br>
    	<br>
    	
    		<h4>리뷰내역</h4>
   			<span>총 19개의 게시글이 있습니다.</span>
    	</div>
    
    
    	<div class="search-wrap">
            	<form class="form-inline" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-outline-info" type="submit">검색</button>
            </form>

           
          
    </div>
    <div class="clear"></div>
    <div class="review-table">
    <table class="table table-hover">
        <thead>
            <tr>
                <th width="30px"> </th>
                <th width="210px">상품명</th>
                <th width="500px">내용</th>
                <th width="100px">작성자</th>
                <th width="200px">작성일</th>
            </tr>
        </thead>
        <tbody>
      	<!-- 조회된 결과 없을경우  -->
      	<% if(ctlist.isEmpty()) { %>
      		<tr>
      			<td colspan="5">조회된 리뷰가 없습니다.</td>
      		</tr>
          <% }else{ %>
          <!-- 조회된 결과가 있을경우 -->
             <% for(Review r : ctlist) { %>
                <tr>
                <td><%= r.getReview_No() %></td>
                     <td><%= r.getP_Code() %></td>
                     <td><%= r.getRv_Content() %></td>
                     <td><%= r.getMem_No() %></td>
                     <td><%= r.getRv_Date() %></td>
                
                
                	 
                </tr>
                    <% } %>
                    
                    
			<% } %>
                    
                
        </tbody>
    </table>
    </div>
     
    
    
            <!-- 페이징  -->
            <div align="center" class="pagingArea">
                    
                    	
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=contextPath%>/list.rvl?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.rvl?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=contextPath%>/list.rvl?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.rvl?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.rvl?currentPage=<%=maxPage%>';">&raquo;</button>
                	
					<% } %>

             </div>
	</div>
            
   </div>
   </div>
   </div>

<!-- 푸터와 내려와야,, -->
<%@ include file = "../common/footer.jsp" %>
</body>
</html>