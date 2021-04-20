<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productDetailView.css">
   										

</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %> 

	 <div class="content_wrap">
	        
	        <p class="groupBar">
	           <a href="">대분류</a>&nbsp;&nbsp;>
	           <a href=""> 중분류</a>&nbsp;&nbsp;
	        </p>
	
	        <div class="pdtWrap">
	            <!-- 상품기본이미지 -->
	            <div class="pdtPhoto">
	                    <div class="mainImg">
	                        <img src="../../resources/images/reco_1.png" width="350" height="350" alt="">
	                    </div>
	                    <ul class="subImg">
	                        <li><img src="../../resources/images/reco_1.png" width="40"></li>
	                        <li><img src="../../resources/images/reco_1.png" width="40">></li>
	                        <li><img src="../../resources/images/reco_1.png" width="40">></li>
	                    </ul>
	                
	            </div>
	    
	            <!-- 상품명 -->
	            <div class="pdtDetail">
	                <div class="pdtInfo">
	                    <div class="pdtSaleInfo">
	                        <div class="pdtName">제주시티투어(1회 1일 이용권)</div>
	                        <div class="pdtPrice"> 123,000 원</div>
	                    </div>                    
	
	                    <div class="gradeArea">
	                        <div class="scoreArea">
	                            <span class="score">평점 0/5</span>
	                            <span class="scoreIcon"><img src="../../resources/images/star.png" alt="" width="15"></span>
	                            <span class="scoreIcon"><img src="../../resources/images/star.png" alt="" width="15"></span>
	                            <span class="scoreIcon"><img src="../../resources/images/star.png" alt="" width="15"></span>
	                            <span class="scoreIcon"><img src="../../resources/images/star.png" alt="" width="15"></span>
	                            <span class="scoreIcon"><img src="../../resources/images/star.png" alt="" width="15"></span>
	                        </div>
	
	                        <div class="icon" align="right">
	                            <button type="button" onclick=""><img src="../../resources/images/shareBtn.png" alt="sns" width="30"></button>
	                            <button type="button" onclick=""><img src="../../resources/images/like_c.png" alt="like" width="33"></button>
	                        </div>
	                    </div>
	
	                    <!-- 옵션정보 -->
	                    <div class="optionSelect">
	                        <div class="dateSelect">
	                            <a>
	                                <img src="../../resources/images/calendar.png" alt="" width="20" align="center" >
	                                날짜를 선택해주세요
	                                <input type="date" class=""></input>
	                            </a> 
	                        </div>
	                 
	
	                </div>
	        
	                <div class="purchasingInfo">
	                    <div class="btnArea">
	                        <button type="button" onclick="" class="cart">장바구니</button>
	                        <button type="button" onclick="" class="pay">바로구매</button>   
	                    </div>
	                </div>
	
	
	            </div>
	
	        </div>
	
	        <!-- 상품설명/리뷰 등.. -->
	        <div class="pdtTab">
	            <ul >
	                <li onclick="" id="tap01" class="current"><p>상품설명</p></li>
	                <li onclick="" id="tap02"><p>사용정보</p></li>
	                <li onclick="" id="tap03"><p>최소/환불</p></li>
	                <li onclick="" id="tap04"><p>리뷰(<!--리뷰건수 카운트-->)건</p></li>
	                <li onclick="" id="tap05"><p>상품문의</p></li>
	            </ul>
	        </div>
	
	
	    </div>


</body>
</html>