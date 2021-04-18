<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- loginPage css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/loginPage.css">

    <!-- loginPage jQuery -->
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

	<%@ include file="../common/managerMenubar.jsp" %>
</div>
    <div class="login_wrap">

        <!-- 로그인창 -->

        <div class="login_main">
                <form action="<%= request.getContextPath()%>/login.me" id="loginForm" method="post">
                    <!-- 로그인 타이틀 -->
                    <div class="login_title">
                        안녕하세요
                        <br><img src="<%=request.getContextPath()%>/resources/images/jejuwa_icon.png" alt="" style="width:130px; height:70px;">입니다.
                    </div>
                    <!-- 로그인 입력내용 -->
                    <div class="login_content">
                    로그인 후 다양한 서비스를 이용하실 수 있습니다.
                    <br><br>
                    <input type="text" name="memId" id="memId" placeholder="아이디를 입력해주세요.">
                    <input type="password" name="memPwd" id="memPwd" placeholder="비밀번호를 입력해주세요.">
                    <br><br>
                    </div>
                    <div class="btn_login">
                        <button id="btnAgree" type="submit" class="btn btn-warning" style="width: 350px; color:white; font-weight:600;" >로그인하기</button>
                    </div>
                </form>
        
            <!-- 우측 상품 섬네일 -->
            <div class="login_slide">
                <div class="slide_box">
                    <div class="thumb_box" height="50px">
                        <span class="dotPrev"><img src="<%=request.getContextPath()%>/resources/images/carousel_circle_normal.png" alt="1"></span>
                    </div>
                    <div class="slide_img">
                        <a href="">
                            <img id = "thumb_img" src="<%=request.getContextPath()%>/resources/images/jeju_main.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>