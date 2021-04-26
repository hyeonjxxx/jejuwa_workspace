<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.product.model.vo.*,
 com.kh.member.model.vo.*, com.kh.like.model.vo.*" %>
<%
	//String contextPath = request.getContextPath();  //h_jejuwa
	Product p = (Product)request.getAttribute("p");
	//ArrayList<File> list = (ArrayList<File>)request.getAttribute("list");
	Member loginUser = (Member)session.getAttribute("loginUser");
	Like l = (Like)request.getAttribute("l");
	String travleDate = (String)request.getAttribute("travleDate");
	int count = (int)request.getAttribute("count");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주와_상품상세페이지</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productInfoDetail.css">

</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>

    <div class="content_wrap">

        <p class="groupBar">
           <a href=""> 대분류</a>&nbsp;&nbsp;>
           <a href=""> 중분류</a>&nbsp;&nbsp;
        </p>

        <div class="pdtWrap">
            <!-- 상품기본이미지 -->
            <div class="pdtPhoto">
                    <div class="mainImg">
                        <img src="<%=contextPath %>/<%= p.getBasicPath()%>" width="350" height="350" alt="">
                    </div>
                    <ul class="subImg">
                    	<%--
                    	<%for(int i=1; i<list.size(); i++) {%>
                        	<li><img src="" width="40"></li>
                    	<%} %>
                    	--%>
                    </ul>

            </div>

            <!-- 상품명 -->
            <div class="pdtDetail">
                <div class="pdtInfo">
                    <div class="pdtSaleInfo">
                        <div class="pdtName"><%=p.getpName() %></div>
                        <div class="pdtPrice"><%=p.getPrice() %>원</div>
                    </div>

                    <div class="gradeArea">
                        <div class="scoreArea">
                            <span class="score">평점 0/5</span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                        </div>
						
						
                        <div class="icon" align="right">
                            <button type="button" onclick="testLike();"><img src="<%=contextPath %>/resources/images/shareBtn.png" alt="sns" width="30"></button>
                            
                           
                            <% if(count == 0){ %>
                            	<img id="heart" onclick="likeProduct();" src="<%=contextPath %>/resources/images/emptyHeart.png" alt="like" width="33">
                            <% }else{ %>
                            	<img id="heart" onclick="deleteProduct();" src="<%=contextPath %>/resources/images/fullHeart.png" alt="like" width="33">
                            <% } %>
                            
                        </div>
						
						
                        <!-- 좋아요 버튼 누르는 순간 하트가 바뀌면서 담김 -->
                        <script>
                        	function likeProduct(){
                        		//console.log("되어라,,,");
                        		$.ajax({
                        			//url 다시 써야됨
                        			url : "<%=contextPath%>/linsert.li",
                        			type : "post",
                        			data : {
                        				pno:'<%=p.getpCode()%>'
                        			},
                        			success : function(result){

                        				if(result>0){ // 좋아요 성공

                        					$("#heart").attr("src", '<%=contextPath%>/resources/images/fullHeart.png');
                        					$("#heart").click(deleteProduct);
                        				}		

                        			}, error:function(){
                        				console.log("통신실패그림");
                        			}

                        		})
                        	}
                        	
                        	function deleteProduct(){
                        		
                        		$.ajax({
            						url : "<%=contextPath%>/delete.li",
            						type : "post",
            						data : {
            							pno : '<%=p.getpCode()%>'
            						},
            						success : function(result){
            							$("#heart").attr("src", '<%=contextPath%>/resources/images/emptyHeart.png');
            							$("#heart").click(likeProduct);
            						}
            					})
                        	}
                        </script>



						 
                        
						
						
                    </div>
						
					<form action="<%=contextPath %>/do.pa">
							<input type="hidden" name="pcode" value="<%=p.getpCode() %>">
	                    <!-- 옵션정보 -->
	                    <div class="optionSelect">
	                        <div class="dateSelect">
	                            <a>
	                            	<!-- 
	                                <img id="test" src="<%=contextPath %>/resources/images/calendar.png" alt="" width="20" align="center" >
	                              		날짜를 선택해주세요
	                              		<br> -->
	                                <input type="date" name="travleDate" value="yyyy-mm-dd">
	                                
	                                
	                            </a>
	                        </div>
	                   </div>
	
	
		                <div class="purchasingInfo">
		                    <div class="btnArea">
		                        <button type="submit" class = "btn btn-warning">바로구매</button>
		                    </div>
		
		                </div>
				</form>
            </div>

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
               <img src="<%=contextPath %>/<%= p.getDetailPath()%>">            
            </div>
        
            
        </div>
        
        

    </div>


</body>
</html>
