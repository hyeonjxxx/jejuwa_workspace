<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productFilterSearchView.css">
    <!-- map -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/map_s.css">


</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %> 


    <div class="content_wrap">

        <div class="content">

            <div class="side">
                <aside class="detailSearch">
                    <p>지도로 보기 <img src="<%=request.getContextPath() %>/resources/images/map.png" alt="" width="15"></p>
                    <div class="map">
                        <img src="../../resources/images/jejuMap.png" alt="제주지도" width="180px">
                        <button class="ss">성산/우도</button>
                        <button class="hd">함덕/구좌</button>
                        <button class="jj">제주시</button>
                        <button class="aw">애월</button>
                        <button class="hl">한림/협재</button>
                        <button class="jm">중문</button>
                        <button class="sg">서귀포</button>
                        <button class="ps">표선</button>  
                    </div>
        
                    <div class="filter">
                        <p>필터</p>
                        <div class="rating">
                            평점<br>
                            <input type="radio" name="total" id="total" checked> 전체 <br>
                            <input type="radio" name="4point" id="4poin"> 4점 이상 <br>
                            <input type="radio" name="5point" id="5point"> 5점 이상 <br>
                        </div>
                        
                        <div class="divisionLine"></div>

                        <div class="priceSearch">
                            <ul>가격대 별 <br>
                                <button><li>5만원 이하 </li></button>
                                <button><li>5만원~10만원 </li></button>
                                <button><li>10만원~15만원</li></button>
                            </ul>    
        
                            <div class="range">
                                <div class="lowest"><input type="text" value=""></div>
                                <div align="left"> ~ </div> 
                                <div class="highes"><input type="text" value=""></div>
                        </div>
                            
                        </div>
        
                        <div class="btnArea" align="center">
                          <a type="submit" class="enter">검색</a>
                            <a type="reset" class="rset"> 초기화</a>  
                        </div>
                        
                        
                    </div>
                </aside>
    
            </div>
    
            <div class="main">
                <div class="sortBar" align="right">
                    <a href="">제주와 추천순<img src="<%=request.getContextPath() %>/resources/images/check_c.png" alt="" width="15"></a> &nbsp;&nbsp;
                    <a href="">판매순<img src="<%=request.getContextPath() %>/resources/images/check_c.png" alt="" width="15"></a>
                </div>
        
                <div class="category">
                    <ul>
                        <li class="current"><a href="">전체보기</a></li>
                        <li><a href="">투어</a></li>
                        <li><a href="">티켓</a></li>
                        <li><a href="">액티비티</a></li>

                    </ul>
                </div>
                
                <div class="pdt_wrap">
                    <ul class="pdtList">
                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div class="pdtBox">
                                <a href="" onclick="">
                                    <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 230px;"></div>
                                    <div class="pdtInfo">
                                        <p class="pdtName">제주시티투어</p>
                                        <p class="pdtPrice">123,000원</p>
                                    </div>
                                </a>
                            </div>
                        </li>

                    </ul>

                </div>
    
            </div>

        </div>


</body>
</html>