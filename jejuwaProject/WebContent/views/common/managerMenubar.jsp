<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- header css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/header.css">

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/content.css">    

    <!-- footer css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/footer.css">

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
    <div class="wrap">
        <div id="header">
            <div id="header_1">
                <a href="">
                <img id="logo_img" src="../resources/images/제주와 로고.png" alt="">
                </a>
            </div>

            <div id="header_2">
                <form action="" id="search_form">
                    
                    <div id="search_btn" style="width: 10%;">
                        <!--<input type="submit" value="검색">-->
                        <button><img style="width: 100%; height: 100%;" src="../resources/images/돋보기.png"></button>
                    </div>
                    
                    <div id="search_text">
                        <input type="search" name="keyword">
                    </div>
                    
                </form>
            </div>

            <div id="header_3">
                <div>
                    <ul id="info_1">
                        <li><a href="">xxx님 환영합니다</a></li> 
                        <li><a href="">로그아웃</a></li> 
                        <li><a href="">관리자</a></li> 
                    </ul>
                </div>    
                
                <div>
                    <ul id="info_2">
                        
                    </ul>

                </div>
            </div>
        </div>
    
        <br clear=" both"> <br>

    <div class="navWrap" align="center">
        <div class="menu"><a href="">투어</a></div>
        <div class="menu"><a href="">티켓</a></div>
        <div class="menu"><a href="">맛집</a></div>
        <div class="menu"><a href="">할인기획전</div>
    
    </div>

   

  

        

</body>
</html>




