<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세-리뷰 </title>


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
    
	 <style>
	div{border: 1px soli rgb(145, 145, 145);}
	
	/* 상세 네비게이션 바 */
	
	#product-navWrap0{ padding: 40px;}
	
	.review-p{
	    display:table-cell;
	    height:20px;
	    width:140px;
	    
	    
	}
	.review-p a:hover{background:rgb(243, 224, 170);
	                color: rgb(219, 217, 216);}
	
	/* 헤더 추가되면 위에 중복이라서 지워도 됨 */
	
	.product-navWrap a:hover{
	 background:rgb(243, 202, 148);
	 color: coral;}
	
	
	.product-navWrap{
	    display:table-cell;
	    height:20px;
	    width:174px;
	    margin: 10px;
	}
	.product-navWrap a{
	    text-decoration:none;
	    color:rgb(0, 0, 0);
	    font-size:15px;
	    line-height:40px;
	    font-weight:bold;
	    display:block;
	    width:160px;
	    height:100%;
	    background-color: rgb(231, 229, 224);
	}
	/* 제목,설명 */
	
	#title{font-size: medium;
	        font-weight: 800;
	        margin-left: 10px;}

	#explan{float: left;}
	
	/* 비워주기 */
	.clear {clear:both; height:0; overflow:hidden;}
	
	/* 상세성명 / 리뷰버튼 */
	
	.expln-button-wrap{
	   width: 700px;
	   padding: auto;
	   margin: 10px;
	}

	#review-btn{
	    float:right;
	    padding: 10px;

	}

	/* review content */
	
	.reviews{
	    margin: auto;
	    padding: 10px;
	    width: 700px;
	}
	
	#review-top{
	    margin: auto;
	    padding: 10px;
	    width: 700px;}

	.review-row{float: left;}
	
	.review-title{font-size: medium; font-weight: 600;
	}
	/*  */
	
	.review-content{
	    
	    float: left;
	    margin-top: 10px;
	    margin-left: 15%;
	}
	.report-button{
	    float: right;
	    display: inline-block;
	    vertical-align: middle;
	    height: 100%;
 
	}

	/* 리뷰이미지 크기  */
	.reviews img{width: 150px; height: 130px ; margin: 10px;}
                   
    </style>
</head>

<body>
		<%@ include file = "../common/loginUserMenubar.jsp" %>
	 <!-- 상세메뉴 리뷰 -->
	    <div class="review-wrap" style="border:  black; width: 1000px;" >
	        
	<div id="product-navWrap0" align="center">
	    <div class="product-navWrap" align="center">
	        <div class="review-p"><a href="">상품설명</a></div>
	        <div class="review-p"><a href="">사용정보</a></div>
	        <div class="review-p"><a href="">취소/환불</a></div>
	        <div class="review-p"><a href="">리뷰</a></div>
	        <div class="review-p"><a href="">상품문의</a></div>
	    </div>
	</div>
	    <div id="review-top">
	    <p id="title">
	        등록된 리뷰 기준<br>
	        사용자 리뷰 총 평점 ★★★★★
	    </p>
	
	    <div class="expln-button-wrap">
	    <span id="explan">상품평은 구매한 고객님만 작성이 가능하십니다. <br>
	        상품 문의는 1:1문의 게시판, 취소 및 환불은 마이페이지를 이용해 주세요.</span><br><br>
	        
	    </div>
	  
	    <!-- 구매자에게만 버튼보이게 -->
	    <a href="<%=request.getContextPath() %>/product.rvs" id="review-btn" class="btn btn-warning">리뷰 작성하기</a>
	    <div class="clear"></div>
	</div>
	    <hr>
	    <div class="reviews">
	
	        <div class="review-row">
	            <div class="review-id">dfdf***</div>
	            <div class="review-grade">★★★★★</div>
	            <div class="review-date">2021-4-22</div>
	        </div>
	
	        <div class="review-content">
	            <div class="review-title">즐겁게 놀다갑니다</div>
	            <div class="review-letter">직원들이 너무 친절하고 재밌었어요!! 또오고 싶습니다.</div>
	        </div>
	        <div class="report-button">
	            <button class="btn btn-light">신고</button></div>
	        <div class="clear"></div>
	    </div>
	    <hr>
	    <div class="reviews">
	
	        <div class="review-row">
	            <div class="review-id">hwew***</div>
	            <div class="review-grade">★★★★★</div>
	            <div class="review-date">2021-4-22</div>
	        </div>
	
	        <div class="review-content">
	            <div class="review-title">가성비 최고 제주여행 마지막 코스</div>
	            <div class="review-letter">또오고 싶습니다.</div>
	        </div>
	        <div class="report-button">
	            <button class="btn btn-light">신고</button></div>
	        <div class="clear"></div>
	    </div>
	<hr>
	    <div class="reviews">
	
	        <div class="review-row">
	            <div class="review-id">hwew***</div>
	            <div class="review-grade">★★★</div>
	            <div class="review-date">2021-4-22</div>
	        </div>
	
	        <div class="review-content">
	            <div class="review-title">나쁘지않았어요</div>
	            <div class="review-letter">나중에 가게되면 거기로 또가려고요</div>
	            <img src="../resources/images/filter_image.png" alt="">
	        </div>
	  
	            <div class="report-button">
	                <button  class="btn btn-light">신고</button>
	            </div>
	            
	    <div class="clear"></div>
	
	    </div>
	    <hr>
	    
	</div>
			
		
		
</body>
</html>