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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- css -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/adminPageMenubar.css">

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="">
    
</head>
<body>
	<script>
		var msg = "<%= session.getAttribute("alertMsg") %>"; // 알람창으로 출력할 메세지
		// var msg = "메세지" / "null";
		
		if(msg != "null"){
			alert(msg);
			// 알람창 띄워준 후에 session에 담긴 메세지 지워야됨!!(안그러면 메뉴바 포함된 매 페이지 열때마다 alert계속뜰꺼임)
			<% session.removeAttribute("alertMsg"); %>
	}
	</script>

	<div class="wrap">
        <!-- 헤더 -->
        <div id="header" >
            <div id="header1">
                <a href="관리자 홈페이지"><img src="<%= contextPath %>/resources/image/톱니바퀴.png" style="padding: 15px;"></a>
            </div>

            <!-- 로그인 전 div -->
            <!-- <div id="header2">
                <span class="topbtn">관리자off</span>
                <a href="#" class=topbtn>로그인</a>
                <a href="#" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div> -->

            <!-- 로그인 후 div -->
            <div id="header2">
                <span class="topbtn">관리자on</span>
                <a href="#" class=topbtn>로그아웃</a>
                <a href="<%=contextPath %>" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div>
            
        </div>

        <!-- 컨테이너 => iodex, content -->
        <div id="container">
            <!-- 인덱스 -->
            <div class="menu">
                <div class="submenu">회원 관리</div>
                    <p>
                        <a href="">회원 현황</a> <br>
                        <a href="">블랙리스트 관리</a> <br>
                    </p>
                
                    <div class="submenu">상품 관리</div>
                    <p>
                        <a href="">상품 조회</a> <br>
                        <a href="">상품 등록</a> <br>
                        <a href="">주문내역 관리</a> <br>
                    </p>
        
                    <div class="submenu">게시글 관리</div>
                    <p>
                        <a href="">공지사항 관리</a><br>
                        <a href="">FAQ 관리</a> <br>
                        <a href="">1:1문의 관리</a> <br>
                        <a href="">리뷰관리</a> <br>
                    </p>
                    
                    <div class="stop"> <a href="">쿠폰 관리</a></div>
            </div> 
                
            <!-- 내용  -->
            <div class="content">
                
\

    <script>
        $(function(){

            $(".submenu").click(function(){
                var $p = $(this).next();    

                if($p.css("display")=="none"){
                    $(this).siblings("p").slideUp();
                    $p.slideDown(); 
                }else{    
                    $p.slideUp();  
                }

            })
        })

    </script>
</body>
</html>