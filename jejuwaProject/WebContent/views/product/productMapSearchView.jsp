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
                <li class="current" onclick="top.location.href='<%=contextPath%>/mapSearch.pdt';"><a>전체보기</a></li>
                <li onclick="top.location.href='<%=contextPath%>/search_TR.pdt';"><a>투어</a></li>
                <li><a href="<%=contextPath%>/ttMapSearch.pdt">티켓</a></li>
                <li><a href="<%=contextPath%>/ayMapSearch.pdt">액티비티</a></li>
            </ul>
        </div>
        <script>
      
        </script>
        

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
                                    <div class="pdtPhoto"><img src="<%=contextPath%>/<%= p.getBasicPath()%>" style="width: 220px;"></div>
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
        /* 지도로 검색(지역필터링) */
        $(function(){
        	
        	$ajax({
        		url:"<%=contextPath%>/local_ss.pdt",
        		data:<%--  요청시 전달값  {local:<%= p.getLocalCode()%>} --%>,
        		success:function(list){
        			
        			var result = "";
        			for(var i in list){
        				result += "<li class='pdtArea'>"
        						+ "<input type='hidden' name='pcode' value='<%=p.getpCode()%>'>"
        						+ " <div class="pdtBox">"
        						+ "<a >"
        						+ "<div class="pdtPhoto"><img src="<%=contextPath%>/<%= p.getBasicPath()%>" style="width: 220px;">"
        						+ "</div>"
        						+ "<div class="pdtInfo">"
        						+ "<p class='pdtName'>" + <%=list[i].getpName() %> +"</p>"
        						+ "<p class="pdtPrice"><%=p.getPrice() %>원</p>"
        						+ "</div>"
        						+ "</a>"
        						+ "</div>"
        						+ "</li>"
        			}
        		
        			$(".pdtList").html(result); 
        		},error:function(){
        			console.log("지도로 검색 실패")
        		}
        		
        	});
        	
        	
        })
        
        
        
        /* 상품클릭시 */
        	$(function(){
        		$(".pdtArea").click(function(){
        			location.href = '<%=contextPath%>/infoDetail.pdt?pcode='+ $(this).children().eq(0).val();
        		})	
        	})
        	
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