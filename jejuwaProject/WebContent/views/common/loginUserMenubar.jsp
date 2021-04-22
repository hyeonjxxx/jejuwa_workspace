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
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<style>

	div, form, input{border: 1 solid gray; box-sizing: border-box;}

	button{background-color:orange; border: 1px solid orange;}
	
	.wrap{width: 1000px; height:800px;  margin: auto;}
	
	.wrap>div{width: 100%;}
	
	#header{height: 20%; color: black;}
	
	#header>div, #content>div{height: 100%; float: left;}
	#header_1{width: 20%;}
	#header_2{width: 55%;}
	#header_3{width: 25%;}
	
	a { text-decoration: none; } 
	
	/* 세부_검색창폼만들기 */
	#header_2{position: relative;}
	#search_form{
	    width: 70%; 
	    height: 20%; 
	    margin: auto; /*꼭 있어야 0px 조정이 가능함*/
	    position: absolute;
	    top: 0px;
	    bottom: 0px;
	    left: 0;
	    right: 0px;
	    }
	#search_form>*{float: left; height: 100%;}
	#search_text{width: 90%;}
	#search_btn{width: 20%;}
	#search_form input{width: 100%; height: 100%;} /*후손은 부등호 없음*/
	
	
	#header_1{position:relative;}
	#logo_img{
	    margin: auto;
	    margin-top: 28px;
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    left: 0;
	    right: 0;
	    width: 80%;
	    height: 80%;
	}
	
	#header_3{position:relative;}    
	
	#info_1 *{
	    text-decoration: none;
	    float: left;
	    font-size: 10px;
	    list-style-type: none; 
	    margin-left: 2px;
	
	    }


    #search_text{
        float: left;
        
    }
    /* 아이콘영역 시작 */

    #icon0{
        float: right;
        margin: auto;
        padding: 10px;
        text-align:center;
        margin-right: 43px;
        margin-top: 10px;
    }
    

    
    #icon0>div{
        margin: 7px;
        
    }
    #icon0 p {
        font-size: x-small;
        margin: auto;
        margin-top: 4px;

    }

    .coupon{
        float: left;
    }
    
    /* clean으로 비워주기 */
    .clear {clear:both; height:0; overflow:hidden;}
    
    .menu{
	display:table-cell;
	height:20px;
	width:174px;
	}

	.menu a{
	text-decoration:none;
	color:rgb(0, 0, 0);
	font-size:15px;
	line-height:45px;
	font-weight:bold;
	display:block;
	width:100%;
	height:100%;
	}

	.menu a:hover{background:rgb(243, 224, 170);
              color: coral;}
	</style>

	
	
</head>



<body>

 <div class="wrap">
        <div id="header">
            <div id="header_1">
                <a href="">
                <img id="logo_img" src="<%= contextPath %>/resources/images/제주와 로고.png" alt="">
                </a>
            </div>

            <div id="header_2">
            
                <form action="" id="search_form">
                    
                    <div id="search_btn" style="width: 10%;">
                        <!--<input type="submit" value="검색">-->
                        <button><img style="width: 100%; height: 100%;" src="<%= contextPath %>/resources/images/돋보기.png"></button>
                    </div>
                    
                    <div id="search_text">
                        <input type="search" name="keyword">
                        <div class="clear"></div>
                    </div>

                </form>
            </div>

            <div id="header_3">
                <div>
                    <ul id="info_1">
                        <li><a href="">xxx님 환영합니다</a></li> 
                        <li><a href="">로그아웃</a></li> 
                        
                    </ul>
                </div>    
               <!-- 아이콘영역 -->
                <div id="icon0">
                    <div class="coupon">
                            <a href="<%= contextPath %>/list.mp">
                                <img src="<%= contextPath %>/resources/images/마이페이지.png" width="40px" alt="">
                            <p><a href = "<%= contextPath %>/list.mp">마이페이지</a></p>
                            </a>
                    </div>
                    <div class="coupon">
                            <a href="">
                                <img src="<%= contextPath %>/resources/images/좋아요.png" width="40px" alt="">
                                <p>좋아요</p>
                            </a>
                    </div>
                    <div class="coupon">
                            <a href="">
                            <img src="<%= contextPath %>/resources/images/쿠폰.png" width="40px" alt="">
                                <p>쿠폰</p>
                            </a>
                    </div>
                    <div class="clear"></div>

                </div>
            </div>
        </div>
    
        <br clear=" both"> <br>

    <div class="navWrap" align="center">
        <div class="menu"><a href="">투어</a></div>
        <div class="menu"><a href="">티켓</a></div>
        <div class="menu"><a href="">맛집</a></div>
        <div class="menu"><a href="">고객센터</div>
    
    </div>


</body>
</html>