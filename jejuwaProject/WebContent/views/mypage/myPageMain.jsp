<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지메인</title>
	
	
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
	<link rel="stylesheet" type = "text/css" href="<%=request.getContextPath() %>/resources/css/mypage/myPageMain.css">
	
</head>
<body>
	<%@ include file = "../common/mypageMenubar.jsp" %>
	
	<div class="mypageContents">
		
        <h3 class="head">예약조회
            <em style="font-style: normal; font-size: 15px;">(최근1개월)</em>
        </h3>
    </div>
    <hr>
    <ul class="mypageStep">
        <li>
            <em>0</em>
            <span>주문접수</span>
            <img src="<%=request.getContextPath() %>//resources/images/화살표.png" id="img1">
        </li>

        <li>
            <em>0</em>
            <span>결제완료</span>
            <img src="<%=request.getContextPath() %>/resources/images/화살표.png" id="img2">
        </li>

        <li>
            <em>0</em>
            <span>예약확정</span>
            <img src="<%=request.getContextPath() %>/resources/images/화살표.png" id="img3">
        </li>

        <li>
            <em>0</em>
            <span>여행완료</span>
        </li>
    </ul>
                
    <div class="mypageContentsLike">
        <h3 class="head">좋아요</h3>
    </div>
    <hr>
    <div class="list-four">

        <!-- 좋아요 상품이 있을때 -->
        <ul id="okLike">
            <li >
                <img src="<%=request.getContextPath() %>/resources/images/event.png" alt="느낌표"><br>
            </li>
            <li>
                <img src="<%=request.getContextPath() %>/resources/images/event.png" alt="느낌표"><br>
            </li>
        </ul>




        <!-- 좋아요 상품이 없을때 -->
        <!--
        <ul class="list">
            <li class="container p-3 my-3 border" id="nolike">
                <img src="<%=request.getContextPath() %>/resources/images/느낌표.png" alt="느낌표"><br>
                좋아요 상품이 없습니다.
            </li>
        </ul>
        -->


    </div>



    <div class="footerArea" id="qeustion">
        <div class="left">
            <div class="titleArea">
                <h3 class="leftHead">1:1문의내역</h3>
            </div>
            <!-- 1:1 문의내역 있을 때 -->
            <ul>
                <li>환불되나요?</li>
                <li>환불되나요?</li>
            </ul>

            <!-- 1:1문의 내역 없을 때 -->
            <!--<p>최근 1개월간 문의하신 내용이 없습니다.</p> -->
        </div>

        <div class="right" id="faq">
            <div class="titleArea">
                <h3 class="rightHead">상품Q&A내역</h3>    
            </div>

            <!-- 1:1문의 내역 있을 때 -->
            <ul>
                <li>환불되나요?</li>
                <li>환불되나요?</li>
            </ul>



          <!-- Q&A 없을때 -->
          <!-- <p> 최근 1개월간 문의하신 내용이 없습니다.</p>  -->
                        
                        
        </div>
              
    </div>
</body>
</html>