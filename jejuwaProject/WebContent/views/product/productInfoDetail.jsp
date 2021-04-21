<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.product.model.vo.*,  com.kh.common.model.vo.File" %>    
<%
	//String contextPath = request.getContextPath();  //h_jejuwa
	Product p = (Product)request.getAttribute("p");
	ArrayList<File> list = (ArrayList<File>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주와_상품상세페이지</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productInfoDetail.css">

</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>

    <div class="content_wrap">
        
        <p class="groupBar">
           <a href=""> 대분류</a>&nbsp;&nbsp;>
           <a href=""> 중분류</a>&nbsp;&nbsp;
        </p>

        <div class="pdtWrap">
            <!-- 상품기본이미지 -->
            <div class="pdtPhoto">
                    <div class="mainImg">
                        <img src="" width="350" height="350" alt="">
                    </div>
                    <ul class="subImg">
                    	<%--
                    	<%for(int i=1; i<list.size(); i++) {%>
                        	<li><img src="" width="40"></li>
                    	<%} %>
                    	--%>
                    </ul>
                
            </div>
    
            <!-- 상품명 -->
            <div class="pdtDetail">
                <div class="pdtInfo">
                    <div class="pdtSaleInfo">
                        <div class="pdtName"><%=p.getpName() %></div>
                        <div class="pdtPrice"><%=p.getPrice() %>원</div>
                    </div>                    

                    <div class="gradeArea">
                        <div class="scoreArea">
                            <span class="score">평점 0/5</span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                            <span class="scoreIcon"><img src="<%=contextPath %>/resources/images/star.png" alt="" width="15"></span>
                        </div>

                        <div class="icon" align="right">
                            <button type="button" onclick=""><img src="<%=contextPath %>/resources/images/shareBtn.png" alt="sns" width="30"></button>
                            <button type="button" onclick=""><img src="<%=contextPath %>/resources/images/like_c.png" alt="like" width="33"></button>
                        </div>
                    </div>

                    <!-- 옵션정보 -->
                    <div class="optionSelect">
                        <div class="dateSelect">
                            <a>
                                <img src="<%=contextPath %>/resources/images/calendar.png" alt="" width="20" align="center" >
                                		날짜를 선택해주세요
                                <input type="date" class=""></input>
                            </a> 
                        </div>
                   </div>     

                </div>
        
                <div class="purchasingInfo">
                    <div class="btnArea">
                        <button type="button" onclick="" class="cart">장바구니</button>
                        <button type="button" onclick="" class="pay">바로구매</button>   
                    </div>
                </div>


            </div>

        </div>

        <!-- 상품설명/리뷰 등.. -->
        <div class="pdtTab">
            <ul >
                <li onclick="" id="tap01" class="current"><p>상품설명</p></li>
                <li onclick="" id="tap02"><p>사용정보</p></li>
                <li onclick="" id="tap03"><p>최소/환불</p></li>
                <li onclick="" id="tap04"><p>리뷰(<!--리뷰건수 카운트-->)건</p></li>
                <li onclick="" id="tap05"><p>상품문의</p></li>
            </ul>
        </div>

    </div>        
    

</body>
</html>