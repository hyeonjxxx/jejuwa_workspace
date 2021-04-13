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

	<%@ include file = "../common/mypageMenubar.jsp" %>
	
    <div class="wrap">       
        
        <div class="content" >
            <div class="content_2">
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