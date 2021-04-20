<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../common/mypageMenubar.jsp" %>
	
	
    
	<style>
	
		.write-btn{width: 700px; margin: 0px auto; padding: 10px;}
		
		/* 리뷰 타이틀 */
		.myreview-title{
		    margin: 10px;
		    margin-top: 50px;
		    font-size: larger;
		    font-weight: 800;
		}
		
		/* 리뷰건수 타이틀 */
		
		.review-sum{margin: 5px;}
		.review-sum > span {
		    font-size: larger;
		    font-weight: 700;
		}
		
		.table-review img{
		    width: 100px; 
		    padding: 5px;
		    
		
		}
		
		.table-review * {padding: 5px;   cursor:pointer; margin-top: 21px;}
		
		.write-btn{width: 700px; margin: 0px auto; padding: 10px;}
		
		.write-btn li {
		    width: 300px;
		}
		tbody p {
		    padding: 10px;
		}
		.product_title{ margin-top: -10px;}
			
	</style>
	</head>
	
	<body>
	<div class="content_2">
	           
		<div class="myreview-title">
		   <span>나의 리뷰내역</span>
		</div>
		                    
		                   
		</div>
		   <div class="write-btn">
		   <ul>
		  <li class="btn btn-warning">리뷰작성</li>
		  <li class="btn btn-outline-warning">나의리뷰</li>
		 </ul>
		</div>
		
	<br><br>
		
	
	                
	 <!-- 조회된 결과가 있을 경우 -->
	
	    <div class="review-sum">
	        <span>작성한 리뷰</span>
	    </div>
	    
	    <div class="review-content">
	                   
	    <table class="table-review">
	        <thead>
	            <tr>
	                <tr align="center">
	                    <th width="220">상품명</th>
	                    <th width="300">리뷰내용</th>
	                    <th width="200">평점</th>
	                    <th width="200">작성일</th>
	                    
	                </tr>
	            </tr>
	        </thead>
	
	        <tbody align="center">
	            <tr>
	                <td>
	                    <div class="product-r-name">
	                        <img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	
	            <tr>
	                <td>
	                	<div class="product-r-name">
	                	<img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	            <hr>
	            <tr>
	                <td>
	                    <div class="product-r-name"><img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	        </tbody>
	    </table>
	    <hr>
	    <br><br>
	</div>

</body>
</html>