<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.product.model.vo.*,com.kh.common.model.vo.*,
 com.kh.member.model.vo.*, com.kh.like.model.vo.*" %>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	Member loginUser = (Member)session.getAttribute("loginUser");
	Like l = (Like)request.getAttribute("l");
	String travleDate = (String)request.getAttribute("travleDate");
	int count = (int)request.getAttribute("count");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주와_상품상세페이지리뷰</title>
	
	<!-- 링크API -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productInfoDetail.css">
    
	    <style>
	    table tr * {
	        margin: 20px;
	    }
	    .review-table {
	        height: 1000px;
	        width: 900px;
	        margin: auto;
	    }
		</style>

</head>

<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>

    <div class="content_wrap">

       
    </div>

        <!-- 상품설명/리뷰 등.. -->
        <div class="pdtTab">
            <ul >
                <li onclick="" class="current"><p>상품설명</p>
                </li>
                <li onclick="" ><p>사용정보</p></li>
                <li onclick=""><p>최소/환불</p></li>
                <li onclick="" ><p>리뷰(<!--리뷰건수 카운트-->)건</p></li>
                <li onclick="" ><p>상품문의</p></li>
            </ul>
            <div id="tap01" class="taps">
               <img src="<%=contextPath %>/<%= p.getDetailPath()%>" style="width:680px">            
            </div>
        
            
        </div>
        
        <div  class="review-table" align="center">
        <table class="table table-hover">

        <thead>
           
        </thead>

        <tbody>
             
            </tr>
            
            <!--  -->
            <script>
            
            	$(function(){
            		
            		selectPrReviewList();
            	}) 
            	
            	
            	// 해당 게시글에 딸린 리뷰 리스트 조회 ajax
            	
            	function() {
            		$.ajax({
            			url:"<%=contextPath%>/rvlist.bo",
            			data:{pco:"<%=p.getpCode()%>"},
            			success:function(listr) {
            				// console.log(listr);
            				var result ="";
            				for(var i in listr){
            					result += "<tr>"
            	                	+	"<td width="130px"align="center"><br>" + listr[i].mem_Id + "</td>" 
            	                	+	"<td width="300px">" + listr[i].rv_Content + "</td>"
            	                	+	"<td width="420px">" + listr[i].rv_Date + "</td>"
            	                	+	"<td width="120px"><button class="btn btn-light btn-sm">" + "신고" + "</button></td>"
            	            		+ 	"</tr>}"
            				}
            			
            			$(".review-table tbody").html(result);
            				
            			},error:function() {
            				cosole.log("리뷰리스트 조회용 ajax 통신실패");
            			}
            		});
            	
            </script>
            
            
            <tr>
                <td width="200px" align="center">
                    <br><br><br>리뷰작성
                </td>
            
                

                <!--로그인전-->
                <!--
                <td><textarea cols="50" rows="3" style="resize:none" readonly>로그인후 이용가능하는 서비스입니다.</textarea></td>
                <td><button disabled>댓글등록</button></td>
                -->

                <!--로그인후-->
                <td><textarea cols="43" rows="6" style="resize:none"></textarea></td>
                <td><br><br><button class="btn btn-warning">댓글등록</button></td>
                
            </tr>
        </tbody>

   
</table>

</div>
        
        
        
        
        

    </div>


</body>
</html>
