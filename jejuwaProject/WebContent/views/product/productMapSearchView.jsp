<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product/productMapSearchView.css">   

    <!-- map css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/map_L.css">



</head>
<body>

	<%@ include file="../common/managerMenubar.jsp" %> 

    <div class="content_wrap">

        <div class="mappArea">
            <div id="mapBtn">
                <p>지도로 찾기
                    <img src="../../resources/images/location_pin_c.png" width="40">
                </p>   
            </div>
            <div id="panel">
                <img src="../../resources/images/jejuMap.png" alt="jejuMap" width="350" >
           
                <button class="ss">성산/우도</button>
                <button class="hd">함덕/구좌</button>
                <button class="jj">제주시</button>
                <button class="aw">애월</button>
                <button class="hl">한림/협재</button>
                <button class="jm">중문</button>
                <button class="sg">서귀포</button>
                <button class="ps">표선</button>                
            </div>

            <div class="divisionLine"></div>
        </div>   

        <!-- map open -->
        <script> 
        $(document).ready(function(){
        	$("#mapBtn").click(function(){
           	 $("#panel").slideToggle("fast");
       	 });
        });
        </script>


        <div class="category">
            <ul class="sub">
                <li class="current"><a href="">전체보기</a></li>
                <li><a href="">투어</a></li>
                <li><a href="">티켓</a></li>
                <li><a href="">액티비티</a></li>
            </ul>
        </div>

        <div class="sortBar" align="right">
            <a href="">제주와 추천순<img src="../../resources/images/check_c.png" alt="" width="15"></a> &nbsp;&nbsp;
            <a href="">판매순<img src="../../resources/images/check_c.png" alt="" width="15"></a>
        </div>
                
                        
        <div class="pdt_wrap"> 
            <ul class="pdtList">
                <li>
                    <div class="pdtBox">
                        <a href="" onclick="">
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
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
                            <div class="pdtPhoto"><img src="../../resources/images/reco_1.png" style="width: 220px;"></div>
                             <div class="pdtInfo">
                                    <p class="pdtName">제주시티투어</p>
                                    <p class="pdtPrice">123,000원</p>
                            </div>
                        </a>
                    </div>
                </li>
                        
            </ul>
        
        </div>
           
        
        <div align="center" class="pageingArea">
            <button>이전</button>
            <button>x</button>
            <button>x</button>
            <button>다음</button>
        </div>
        

    </div>	


</body>
</html>