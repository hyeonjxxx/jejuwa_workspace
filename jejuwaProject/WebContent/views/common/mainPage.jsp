<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전  managerMenubar.jsp  로딩시 : null
	// 로그인 성공후 managerMenbubar.jsp 로딩시 : 로그인한 회원의 정보들이 담겨있는 객체
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 로그인 전</title>
    <!-- header css -->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/common/loginHeader.css">

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/common/content.css">

    <!-- footer css -->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/common/footer.css">

    <!-- footer fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <!-- footer jQuery -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
	<%@ include file="../common/loginUserMenubar.jsp" %>
    <!-- 메인이미지 -->

    <div id="img_jejumain">
            <div style="position: absolute;">
                <a href="#" class="left_click">
                <div style="position: relative; top: 150px; left: 30px;"><img src="<%= contextPath %>/resources/images/left_ch.png"></img></div></a>
            </div>
            <div style="position: absolute;">
                <a href="#" class="left_click">
                <div style="position: relative; top: 150px; left: 850px;"><img src="<%= contextPath %>/resources/images/right_ch.png"></img></a></div>
            </div>

            <img src="<%= contextPath %>/resources/images/jeju_main.jpg" id="main_img"></img>

    </div>

     <!-- 추천상품 -->

    <div class="medium">
        <label for="" class="medieum-font">제주와 추천상품</label>
    </div>
        <div class="product-list">
            <div class="product-list2" >
                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원 </div></a>

                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원</div></a>

                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원</div></a>
            </div>

        </div>

        <!-- 제주와 투어/티켓 인기 -->

        <div class="medium">
            <label for="" class="medieum-font">투어/티켓 인기상품</label>
        </div>
            <div class="product-list">
                <div class="product-list2" >
                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원</label></div></a>

                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원 </div></a>

                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원</div></a>
                </div>
            </div>

        <%@ include file="../common/footer.jsp" %>

</body>
</html>
