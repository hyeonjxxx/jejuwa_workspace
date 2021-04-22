<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <style>
    	
        div{box-sizing: border-box;}
		ul, li, em{list-style: none;}
		ul{
		    display: block;
		    margin-block-start: 1em;
		    margin-block-end: 1em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    padding-inline-start: 40px;
		    }
		li{display: list-item;}
		*{box-sizing: border-box;}
		
		
		.myPageAll a{text-decoration: none; margin: -30px;}
		.myPageAll ul {margin-top: -5px;}
		.myPageAll ul li{margin-top: 10px;}
		.wrap{width: 1000px; height:800px;  margin: auto; margin-top: 50px;}
		
		.wrap>div{width: 100%;}
		.content{height: 100%;}
		
		
		.content>div{height: 100%; float: left;}
		.content_1{width: 25%;}
		.content_2{width: 75%;}
		
		#Menu a{
		    padding-top: 10px;
		    font-size: 20px;
		    line-height: 24px;
		    letter-spacing: -1px;
		    color: black;
		    margin-left: -2px;
		    font-weight: bold;
		    }
		.content_1 li a{
		    font-size: 13px;
		    color: black;
		    letter-spacing: -0.8px;
		    }
		.content_1 li a:hover, #Menu a:hover{color: orange;}
		
		/*.myPageAll{border: 1px solid red; position: relative; top: 100px;}*/
		#myPageHead{margin: auto; margin-left: -20px; position: relative; top: 10px;}
		.myPageBar{margin: auto; margin-left: 10px; border: 1px solid gray; width: 170px; height: 550px;}
		
		.userBox{
		    font-size: 11px;
		    line-height: 20px;
		    position: relative;
		    height: 51px;
		    padding: 8px 0 0 30px;
		    background-color: orange;
		    margin-top: 20px;
		    }
		
		
		#userIcon{width: 40px;}    
		
		.welcome{
		    font-size: 15px;
		    padding-left: 60px;
		    position: absolute;
		    font-weight: bold;
    
}

		
/* 좌측 메뉴바   */

div{border: 1px  gray; box-sizing: border-box;}
ul, li, em{list-style: none;}
ul{
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    }
li{display: list-item;}
*{box-sizing: border-box;}

a{text-decoration: none; margin: -30px;}
.wrap{width: 1000px; height:800px;  margin: auto;}

.wrap>div{width: 100%;}
.content{height: 100%;}


.content>div{height: 100%; float: left;}
.content_1{width: 25%;}
.content_2{width: 75%;}

#Menu a{
    padding-top: 10px;
    font-size: 20px;
    line-height: 24px;
    letter-spacing: -1px;
    color: black;
    margin-left: -2px;
    }
.content_1 li a{
    font-size: 13px;
    color: black;
    letter-spacing: -0.8px;
    }
.content_1 li a:hover, #Menu a:hover{color: orange;}
.mypageStep {
    overflow: hidden;
    width: 100%;
    margin-top: 10px;
    border-radius: 10px;
    background-color: lightgray;
    }
.mypageStep li {
    float: left;
    position: relative;
    width: 20%;
    height: 117px;
    font-size: 20px;
    line-height: 6;
    }
.mypageStep li:first-child {background: none;}
.mypageStep em{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 25px;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }    
.mypageStep span{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 70px;
    font-size: 16px;
    line-height: 22px;
    }

.user{
    font-size: 14px;
    line-height: 20px;
    position: relative;
    height: 51px;
    padding: 8px 0 0 30px;
    background-color: orange;
    }
.welcome{
    margin: 0;
    padding: 0;
    float: left;
    margin-left: -20px;
    font-size: 18px;
    line-height: 3px;
    font-weight: 700;

    }
.pointbox{
    word-spacing: -1px;
    font-size: 14px;
    line-height: 20px;
    padding: 19px 0;
    border: 1px solid lightgray;
    }

#reservation, #coupon{
    word-spacing: -1px;
    font-size: 20px;
    line-height: 20px;
    float: left;
    width: 50%;
    text-align: center;
    }   


#count{
    word-spacing: -1px;
    text-align: center;
    margin: 0;
    padding: 0;
    text-decoration: none;
    display: inline-block;
    padding-left: 15px;
    font-size: 30px;
    color: orange;
    font-style: normal;
    }

.unit{
    font-size: 20px;
    font-style: normal;

    }


.Information{
    margin: 20px;
    font-size: small;
    color: gray;
}

.write-btn{width: 700px; margin: 0px auto; padding: 10px;}

.write-btn li {
    width: 300px;
}
/* 리뷰 타이틀 */
.myreview-title{
    margin: 10px;
    margin-top: 30px;
    font-size: larger;
    font-weight: 800;
}


.table-review img{
    width: 100px; 
    padding: 20px;

}



.product-r-name img{width:100px}

</style>

</head>
<body>

	<%@ include file = "../common/loginUserMenubar.jsp" %>
	
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
                                    <a href="<%=contextPath%>/views/mypage/myPageReservation.jsp">예약조회</a>
                                </li>
                                <li class="subMenu">
                                    <a href="<%=contextPath%>/views/mypage/myPageCancel.jsp">취소내역</a>
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
                            <h2 id="Menu"><a href="<%=contextPath%>/views/mypage/myPageLike.jsp">좋아요</a></h2>
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
			
			<br><br>
            <!-- 강동원님 반갑습니다 영역 -->
            <div class="content_2">
                <div class="userBox">
                    <div class="userimg">
                        <span></span>
                        <img src="<%=request.getContextPath() %>/resources/images/user.png" alt="user" id="userIcon">
                    </div>
                    <p class="welcome" style="position: absolute; top: 12px;">
                        (사용자이름)님 반갑습니다.
                    </p>   
                    
                    <div class="content_2">
	           
		<div class="myreview-title">
		   <span>나의 리뷰내역</span>
		</div>
		                    
		                   
		</div>
		   <div class="write-btn">
		   <ul>
		  <li class="btn btn-warning">리뷰작성</li>
		  <li class="btn btn-outline-warning">나의리뷰</li>
		 </ul>
		</div>
		
	<br><br>
		
	
	                
	 <!-- 조회된 결과가 있을 경우 -->
	
	    <div class="review-content">
	                   
	    <table class="table-review">
	        <thead>
	            <tr>
	                <tr align="center">
	                    <th width="200">상품명</th>
	                    <th width="500">리뷰내용</th>
	                    <th width="100">평점</th>
	                    <th width="300">작성일</th>
	                    
	                </tr>
	            </tr>
	        </thead>
	
	        <tbody align="center">
	            <tr>
	                <td>
	                    <div class="product-r-name">
	                        <img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	
	            <tr>
	                <td>
	                	<div class="product-r-name">
	                	<img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	            <hr>
	            <tr>
	                <td>
	                    <div class="product-r-name"><img src="<%= contextPath %>/resources/images/filter_image.png" alt="">
	                    <div class="product_title"><p>제주시티투어</p></div>
	                    </div>
	                </td>
	                <td>가성비 제주여행 마지막 코스! <br>
	                너무 좋았어요! 나중에 또가고 싶습니다</td>
	                <td>
	                    <div class="writed-grade">
	                        <span>★★★★★</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writed-date">
	                        <span>2021-2-5</span>
	                    </div>
	                </td>
	        
	            </tr>
	        </tbody>
	    </table>
	    <hr>
	   
     </div>
        