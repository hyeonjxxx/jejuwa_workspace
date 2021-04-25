<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginError = (String)request.getAttribute("loginError");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- loginPage css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/loginPage.css">

    <!-- loginPage js -->
		<script>
		var msg = "<%= session.getAttribute("alertMsg") %>"; // 알람창으로 출력할 메세지
		// var msg = "메세지"   / "null";
		
		if(msg != "null"){
			alert(msg);
			// session에 한 번 담아둔 건 내가 지우기 전 까지 계속 남아있다 (메뉴바 포함된 매 페이지가 열릴때마다 alert 계속 뜰 것)
			// 알람창 띄워준 후에 session에 담긴 메세지 지워야함!!
			<% session.removeAttribute("alertMsg");%>
		}
	</script>
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

	<%@ include file="../common/loginUserMenubar.jsp" %>
        <br><br>
        <!-- 로그인창 -->
        <div class="login_main">
                <div class="loginForm">
                    <form action="<%= request.getContextPath()%>/login.me" method="post">
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
                        </div>
                        <div style="padding-top: 15px; padding-bottom: 15px; color:red;">
                        <% if(loginError != null){ %>
                            <p style="margin-bottom:0px;"> <%= loginError %> </p>
                        <% } else{ %>
                        	<p style="margin-bottom:0px;"> </p>
                        <% } %>
                        </div>
                        <div class="btn_login">
                            <button id="btnAgree" type="submit" class="btn btn-warning" style="width: 350px; color:white; font-weight:600;" >로그인하기</button>
                        </div>
                        <br>
                        <div>
                            <a href="<%= request.getContextPath() %>/IdPwFind.me">아이디 비밀번호 찾기</a> | 
                            <a href="<%= request.getContextPath() %>/enroll.me">회원가입</a>
                        </div>
                    </form>
                </div>
                <br><br>
        
        
            <!-- 우측 상품 섬네일 -->
            
            <div class="login_slide">
                <div class="slide_box">
                    <div class="thumb_box" height="100px">
                        <span class="dotPrev"><img src="<%=request.getContextPath()%>/resources/images/carousel_circle_normal.png" alt="1"></span>
                    </div>
                    <div class="slide_img">
                        <a href="">
                            <img id = "thumb_img" style="height: 350px;" src="<%=request.getContextPath()%>/resources/images/jeju_main.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </div >
    </div >
    <br><br>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>