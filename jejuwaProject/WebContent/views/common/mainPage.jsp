<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 로그인 전</title>
    <!-- header css -->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/headerBofore.css">

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/common/content.css">    

    <!-- footer css -->
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/resources/css/common/footer.css">

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
                    </div>
                    
                </form>
            </div>

            <div id="header_3">
                <div>
                
                <!-- 로그인 전
                	<ul id="info_1">
                        <li><a href="">로그인</a></li> 
                        <li><a href="">회원가입</a></li>  
                    </ul>	
                -->
                
                <!-- 로그인 후 -->

                
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

    <!-- 메인이미지 -->

    <div id="img_jejumain">
            <div style="position: absolute;">
                <a href="#" class="left_click">
                <div style="position: relative; top: 150px; left: 30px;"><img src="<%= contextPath %>/resources/images/left_ch.png"></img></div></a>
            </div>
            <div style="position: absolute;">
                <a href="#" class="left_click">
                <div style="position: relative; top: 150px; left: 850px;"><img src="<%= contextPath %>/resources/images/right_ch.png"></img></a></div>
            </div>
            
            <img src="<%= contextPath %>/resources/images/jeju_main.jpg" id="main_img"></img>
        
    </div>

     <!-- 추천상품 -->

    <div class="medium">
        <label for="" class="medieum-font">제주와 추천상품</label>
    </div>
        <div class="product-list">
            <div class="product-list2" >
                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원 </div></a>

                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원</div></a>

                <a href="#" class="product">
                <img src="/jejuwa/resources/images/reco_1.png" alt="" width="245">
                <div class="product-name">제주시티투어</div>
                <div class="product-price">128,000 <label for="" id="price-won">원</div></a>
        </div>

        </div>

        <!-- 제주와 투어/티켓 인기 -->

        <div class="medium">
            <label for="" class="medieum-font">투어/티켓 인기상품</label>
        </div>
            <div class="product-list">
                <div class="product-list2" >
                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원</label></div></a>
    
                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원 </div></a>
    
                    <a href="#" class="product">
                    <img src="<%= contextPath %>/resources/images/reco_1.png" alt="" width="245">
                    <div class="product-name">제주시티투어</div>
                    <div class="product-price">128,000 <label for="" id="price-won">원</div></a>
            </div>
        </div>
        
        <footer id="footer" style="margin: 0px;">
            <div class="customer_center">
                <div class="customer_center_left" style="margin-top:6px";>
                    <a href="">공지사항</a>
                    <a href="" style="margin-left:20px;">공지사항 업데이트</a>
                    <a href="" style="margin-left:40px;">더보기<img src="/jejuwa/resources/images/right_ch.png" height="20"></a>
                </div>
                <div class="customer_center_right">
                <button type="button" class="btn btn-warning btn-oneOnOne"><a href="">1:1문의하기</a></button>
                &nbsp;
                <button type="button" class="btn btn-outline-warning"><a href="">자주하는 질문</a></button>
                </div>
            </div>
            <div id="footer" class="footer_wrap">
                <div class="footer_service_support">
                    <ul class="footer_service_inf">
                        <li><a href="">회사소개</a></li>
                        <li><a href="">채용</a></li>
                        <li><a href="">공고</a></li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보처리방침</a></li>
                        <li><a href="">취소 및 환불정책</a></li>
                    </ul>
                </div>
                <div class="corp_info_cs">
                    <dd>
                        <p>
                            <span id="cs1"><img src="<%= contextPath %>/resources/images/jejuwa_icon.png" width="70">1522-5223</span>
                            <span style="margin-left: 10px;">월~금 09:00 ~ 18:00</span>
                            <span style="margin-left: 10px;">점심시간 12:00 ~ 13:00</span>
                        </p>
                    </dd>
                </div>
                <div class="corp_info_tx">
                    <dl class="corp_info_tx_wrap">
                        <dt>
                            <p>
                                <span>상호명:(주)제주와(대표:강보람)</span>
                                <span>개인정보보호책임자:강보람</span>
                                <span>사업자등록번호:123-456-789</span>
                                <span>법인등록번호:222021-00000123</span>
                            </p>
                        </dt>
                        <dt>
                            <p>
                                <span>E-mail:jejuwa@naver.com</span>
                                <span>주소: 서울특별시 강남구 테헤란로 14길 남도빌딩 4F,5F</span>
                                <span>마케팅 사용/문의: 02-556-5112</span>
                            </p>
                        </dt>
                    </dl>
                </div>
        
            </div>
        </footer>
    </div>
	
</body>
</html>