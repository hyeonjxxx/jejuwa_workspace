<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ게시판</title>
<!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        <!-- boardMenu css -->
        <link rel="stylesheet" type="text/css" href="boardMenu.css">
    
        <!-- boardMenu fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">
    
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    
        <!-- FAQ CSS -->
        <link rel="stylesheet" type="text/css"  href="borderFAQ.css">
    
        <!-- FAQ SERVICE CSS -->
        <link rel="stylesheet" href="borderFAQ.css">
</head>
<body>
	<%@ include file = "" %>
		<div class="board_menu"> 
	        <div class="board_content">
            <!-- 여기다가 내용 작성하시면 됩니다. -->
            <br><br>

            <div class="FAQ">
                <p style="font-size: 20px; font-weight: bold;">자주하는 문의(FAQ)</p>
                <hr>
                <ul>
                    <li><a class = "btn btn-danger" href="">관광지/레저</a></li>
                    <li><a class = "btn btn-danger" href="">맛집</a></li>
                    <li><a class = "btn btn-danger" href="">쿠폰</a></li>
                    <li><a class = "btn btn-danger" href="">취소/결제</a></li>
                </ul>
                <br><br><br>
                
            </div>
   
        </div>
      </div>  
	
</body>
</html>