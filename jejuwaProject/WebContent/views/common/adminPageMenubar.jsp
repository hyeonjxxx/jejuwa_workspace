<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); 
	//Member loginUser = (Member)request.getAttribute("loginUser");
	Member loginUser = (Member)session.getAttribute("loginUser");
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
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
                <a href="<%=contextPath%>/admin.go"><img src="<%= contextPath %>/resources/images/톱니바퀴.png" style="padding: 15px;"></a>
            </div>

            <!-- 로그인 전 div -->
            <% if(loginUser == null) { %>
            <div id="header2">
                <span class="topbtn">관리자off</span>
                <a href="#" class="topbtn" data-toggle="modal" data-target="#loginModal">로그인</a>
                <a href="<%=contextPath %>" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div>
			<% } else {%>
            <!-- 로그인 후 div -->
            <div id="header2">
                <span class="topbtn">관리자on</span>
                <a href="<%= contextPath %>/logout.ad" class="topbtn">로그아웃</a>
                <a href="<%=contextPath %>/jejuwa.go" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div>
            <% } %>
            
        </div>

        <!-- 컨테이너 => iodex, content -->
        <div id="container">
            <!-- 인덱스 -->
            <div class="menu">
                <div class="submenu">회원 관리</div>
                    <p>
                        <a href="<%=contextPath%>/list.me?currentPage=1">회원 현황</a> <br>
                        <a href="<%=contextPath%>/list.bl?currentPage=1">블랙리스트 관리</a> <br>
                    </p>
                
                    <div class="submenu">상품 관리</div>
                    <p>
                        <a href="<%=contextPath %>/list.pdt?currentPage=1">상품 조회</a> <br>
                        <a href="<%=contextPath%>/enroll.pdt">상품 등록</a> <br>
                        <a href="<%=contextPath%>/list.or?currentPage=1">주문내역 관리</a> <br>
                    </p>
        
                    <div class="submenu">게시글 관리</div>
                    <p>
                        <a href="<%=contextPath%>/list.no?currentPage=1">공지사항 관리</a><br>
                        <a href="<%=contextPath%>/list.fa?currentPage=1">FAQ 관리</a> <br>
                        <a href="<%=contextPath%>/list.amyq?currentPage=1">1:1문의 관리</a><br>
                        <a href="">리뷰관리</a><br>
                    </p>
                    
                    <div class="stop"> <a href="<%=contextPath%>/admincoupon.do?currentPage=1">쿠폰 관리</a></div>
            </div> 
                
            <!-- 내용  -->
            <div class="content">
                


    <script>
     
     	// 관리자 기능 구현 마지막에 로그인 접속 제한 걸 것
        $(function(){
			
        	$(".submenu").click(function(){
            //$(".submenu, .stop").click(function(){
            	
            	//if(로그인유저가 널인경우){
            		//alert("관리자 로그인이 필요한 서비스입니다.");
            	//}else{
            		
                var $p = $(this).next();    

                if($p.css("display")=="none"){
                    $(this).siblings("p").slideUp();
                    $p.slideDown(); 
                }else{    
                    $p.slideUp();  
                }
            		
            	//}
            		

            })
        })
 	
    </script>
    
    <!-- 로그인 모달 -->
        <!-- The Modal -->
        <div class="modal fade" id="loginModal" align="center" >
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content" >
              
                <!-- Modal body -->
                <br>
                <div class="modal-body">
                    <span><i class="bi bi-person-circle"></i></span> 관리자 로그인
                </div>
                
                <form action="<%=contextPath%>/login.ad" method="post">
                    <div class="input-group mb-3" id="modalContent1">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                      </div>
                      <input name="memId" id="memId" size="25" type="text" placeholder="아이디" required>
                    </div>
                    <div class="input-group mb-3" id="modalContent2">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="bi bi-key"></i></span>
                        </div>
                        <input name="memPwd" id="memPwd" size="25" type="password" placeholder=" 비밀번호" required>
                    </div>
                    
                    <!-- Modal footer -->
                    <div id="modalFooter">
                      <button type="submit" id="okBtn" class="btn btn-warning">로그인</button>
                      <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취 소</button>
                    </div>
                </form>
                               
              </div>
            </div>
          </div>
    
</body>
</html>