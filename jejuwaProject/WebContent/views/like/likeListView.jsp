<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 좋아요</title>
<style>

    .unit{font-size: 20px;font-style: normal;}
    .outer{margin: auto;}
    th{padding: 10px;}
    #recentP{font-size: 20px;}
    .outer>h3{margin-top: 60px; font-size: 20px; font-weight: bold;}
    body{padding: 50px;}
    .gallery{width: 979px; margin: auto;}
    .gallery > li{float: left; padding: 10px 70px 30px 30px; width:350px; list-style: none;}
    /*.gallery > li:nth-child(2n) {padding-right: 0;}*/
    .gallery li a{display : block; position: relative; text-decoration: none; }
    .gallery li ul{padding : 30px 50px 30px; border: 1px solid gray;}
    .gallery li ul li{font-size: 15px; padding: 0 0 12px 15px; list-style: none; color: black; } 
    
</style>
</head>
<body>
	<!-- myPageMenubar include -->



    <div class="wrap">       
        
        <div class="content" >
            <div class="content_1">
                <div class="myPageAll">
                    <h3 align="center" style="margin-top: 30px;">
                        <a href="" style="color: black; font-weight: bold;" id="myPageHead"" id="myPageHead">마이페이지</a>
                    </h3>
                    <br><br><br>
                    <ul class="myPageBar">
                        <li>
                            <h2 id="Menu"><a>예약정보</a></h2>
                            <ul>
                                <li class="subMenu">
                                    <a href="">예약조회</a>
                                </li>
                                <li class="subMenu">
                                    <a href="">취소내역</a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <h2 id="Menu"><a>구매혜택</a></h2>
                            <ul>
                                <li class="subMenu">
                                    <a href="">쿠폰조회</a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <h2 id="Menu"><a>좋아요</a></h2>
                        </li>

                        <li>
                            <h2 id="Menu"><a>활동내역</a></h2>
                            <ul>
                                <li class="subMenu">
                                    <a href="">최근 본 상품</a>
                                </li>
                                <li class="subMenu">
                                    <a href="">나의 리뷰 내역</a>
                                </li>
                                <li class="subMenu">
                                    <a href="">1:1 문의내역</a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <h2 id="Menu"><a>회원정보</a></h2>
                            <ul>
                                <li class="subMenu">
                                    <a href="">개인정보수정</a>
                                </li>
                                <li class="subMenu">
                                    <a href="">회원탈퇴</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                        
                </div>
            </div>

            <!-- 강동원님 반갑습니다 영역 -->
            <div class="content_2">
                <div class="userBox">
                    <div class="userimg">
                        <span></span>
                        <img src="../resources/images/user.png" alt="user" id="userIcon">
                    </div>
                    <p class="welcome" style="position: absolute; top: 12px;">
                        (사용자이름)님 반갑습니다.
                    </p>   
                </div>





                <!-- 여기서부터 예약조회!!!! 위에는 다 include 처리하기 -->
                <div class="outer">
                    <h3>좋아요</h3>
                    <hr>
                    <ul class="gallery">
                        <li>
                            <a href="">
                                <h2><img src="../resources/images/event.png" alt="이벤트1"></h2>
                                <ul>
                                    <li>상품명</li>
                                    
                                </ul>
                            </a>
                        </li>
                
                        <li>
                            <a href="">
                                <h2><img src="../resources/images/event.png" alt="이벤트2"></h2>
                                <ul>
                                    <li>상품명</li>
                                    
                                </ul>
                            </a>
                        </li>
                
                    </ul>
                    
                </div>

            </div>
        </div>
    </div>





</body>
</html>