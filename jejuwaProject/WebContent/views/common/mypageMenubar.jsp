<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메뉴바</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" typd="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <scrip src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <!-- 마이페이지메뉴바 css -->
    <link rel="stylesheet" typd="text/css" href="../../resources/css/mypageMenubar.css">


</head>
<body>
	 <div class="wrap">       
        <div class="content" >
            <div class="content_1">
                <div class="myPageAll">
                    <h3 align="center" style="margin-top: 30px;">
                        <a href="" style="color: black; font-weight: bold;" id="myPageHead">마이페이지</a>
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
                        <img src="../../resources/images/user.png" alt="user" id="userIcon">
                    </div>
                    <p class="welcome" style="position: absolute; top: 12px;">
                        (사용자이름)님 반갑습니다.
                    </p>   
                </div>
            </div>
		</div>
    </div>
</body>
</html>