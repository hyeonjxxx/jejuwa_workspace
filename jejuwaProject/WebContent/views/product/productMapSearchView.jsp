<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product"%>
<%
	//Product p = (Product)request.getAttribute("p");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product/mapDetailSearchView.css">   

    <!-- map css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/map_L.css">


</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>
	
    <div class="content_wrap">

        <div class="mappArea">
            <div id="mapBtn">
                <p>지도로 찾기
                    <img src="<%=contextPath%>/resources/images/location_pin_c.png" width="40">
                </p>   
            </div>
            <div id="panel">
                <img src="<%=contextPath%>/resources/images/jejuMap.png" alt="jejuMap" width="350" >
           
                <button class="ss" name="SS">성산/우도</button>
                <button class="hd" name="HD">함덕/구좌</button>
                <button class="jj" name="JJ">제주시</button>
                <button class="aw" name="AW">애월</button>
                <button class="hl" name="HL">한림/협재</button>
                <button class="jm" name="JM">중문</button>
                <button class="sg" name="SG">서귀포</button>
                <button class="ps" name="PS">표선</button>                
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
        
        <!-- 지역코드 넘겨서 넘긴 값으로 조회되롞!! SQL문 1개로   -->
        <script type="text/javascript">
        $("#panel>button").click(function(){
        	$.ajax({
        		url:'search_SS.pdt',
        		method: 'post',
        		data:{ 
        		},success:function(list){
   					console.log(list);
    				
   					var result ="";
   					for(var i in list){            						
    					result += "<li class=pdtArea>"
    							+ "<input type='hidden' value=" + list[i].pCode +">"
					      	    + "<div class='pdtPhoto'>" + "<img src='" + list[i].basicPath  + "'>" + "</div>"
					            + "<div class='pdtInfo'>" 
					            + "<p class='pdtName'>" + list[i].pName + "</p>"
					            + "<p class='pdtPrice'>" + list[i].price + "원</p>"
						            + "</div>" 
						            + "</li>"
   						}
    					
   					// 아이디가 memberList인 테이블의 tbody영역안에 result 뿌리기
    				$(".pdtList").html(result);
   				
    				$(function() {
    					$(".pdtArea").click(function() {
    						location.href = '<%=contextPath%>/infoDetail.pdt?pcode='+ $(this).children().eq(0).val();
    	        		});	
    	        	});
   					
   					
   				}, error:function(){
   					console.log("ajax통신 실패!!");
        		}
        	});
        	
        	
        });
                
        </script>


<%--         <div class="category">
            <ul class="sub">
                <li class="current" onclick="top.location.href='<%=contextPath%>/mapSearch.pdt';"><a>전체보기</a></li>
                <li onclick="top.location.href='<%=contextPath%>/search_TR.pdt';"><a>투어</a></li>
                <li><a href="<%=contextPath%>/ttMapSearch.pdt">티켓</a></li>
                <li><a href="<%=contextPath%>/ayMapSearch.pdt">액티비티</a></li>
            </ul>
        </div>
         --%>

        <div class="sortBar" align="right">
            <a href="">제주와 추천순<img src="<%=contextPath%>/resources/images/check_c.png" alt="" width="15"></a> &nbsp;&nbsp;
            <a href="">판매순<img src="<%=contextPath%>./resources/images/check_c.png" alt="" width="15"></a>
        </div>
                
                        
        <div class="pdt_wrap">
             <ul class="pdtList">
        		<%for(Product p : list) {%> 
                    <li class="pdtArea">
                    <input type="hidden" name="pcode" value="<%=p.getpCode()%>">
                        <div class="pdtBox">
                            <a >
                                <div class="pdtPhoto"><img src="<%=contextPath%>/<%= p.getBasicPath()%>" style="width: 220px;height: 147px"></div>
                                <div class="pdtInfo">
                                    <p class="pdtName"><%=p.getpName() %></p>
                                    <p class="pdtPrice"><%=p.getPrice() %>원</p>
                                </div>
                            </a>
                        </div>
                    </li>
				<% } %>		
			</ul>

        </div>
        
        <script>      
        /* 상품클릭시 */
        	$(function(){
        		$(".pdtArea").click(function(){
        			location.href = '<%=contextPath%>/infoDetail.pdt?pcode='+ $(this).children().eq(0).val();
        		});	
        	});
        	
        </script>
           
        
        <div align="center" class="pageingArea">
            <button>이전</button>
            <button>x</button>
            <button>x</button>
            <button>다음</button>
        </div>
        

    </div>	


</body>
</html>