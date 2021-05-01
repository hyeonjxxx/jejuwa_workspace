<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주와_상품검색</title>

    <!-- css -->
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/product/productSearchView.css">   


</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %> 

    <div class="content_wrap">

	
        <div class="searchBar">     
            
                <div id="searchBox">
                    <input type="search" id="keyword_pdt" placeholder="[추천상품]제주시티투어"">
                    <button type="button"><img  onclick="searchGo();" src="<%=contextPath%>/resources/images/loupe_c.png" width="30"></button>
                </div>
                    
                <div id="searchBtn">
                </div>              
            
            <div class="divisionLine"></div>
        </div>
        
		<!--리스트에 담겨있는하는데 불러서 오질 못하네... 그리고 console엔 있다가 없어짐 왜????? -->
		<script>
            function searchGo(){
            	//if(window.event.keyCode == 13){
	            	var keyword = $("#keyword_pdt").val();
	           		
	            	console.log(keyword);
	           		
           			$.ajax({
           				url:"highList_TT.pdt",
           				type:"get",
           				success:function(list){
           					console.log(list);
           					
           					var result = "";
           					if(list.length == 0){
           						result = "<li class=pdtArea>검색결과가 존재하지 않습니다</li>"
           					}
           					for(var i in list){            						
            					result += "<li class=pdtArea>"
            							+ "<input type='hidden' value=" + list[i].pCode +">"
        					      	    + "<div class='pdtPhoto'>" + "<img src='" + list[i].basicPath  + "' style='width: 220px; height: 147px'>" + "</div>"
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
            	        	})
           					
           					
           				}, error:function(){
           					console.log("ajax통신 실패!!");
           				}
           			});
           		//} 
            }
        </script>
            
        

        <div class="sortBar" align="right">
            <a href="">제주와 추천순<img src="<%=contextPath%>/resources/images/check_c.png" alt="" width="15"></a> &nbsp;&nbsp;
            <a href="">판매순<img src="<%=contextPath%>/resources/images/check_c.png" alt="" width="15"></a>
        </div>

		<div class="category">
			<ul class="sub">
				<li class="current" onclick="top.location.href='<%=contextPath%>/mapSearch.pdt';"><a >전체보기</a></li>
				<li onclick="top.location.href='<%=contextPath%>/search_TR.pdt';"><a>투어</a></li>
				<li><a href="">티켓</a></li>
				<li><a href="">액티비티</a></li>
			</ul>
		</div>

		<div class="pdt_wrap">
             <ul class="pdtList">
        	<%
        		for (Product p : list) {
        	%> 
                        <li class=pdtArea>
                        <input type="hidden" value="<%=p.getpCode()%>">
                            <div class="pdtBox">
                                <a >
                                    <div class="pdtPhoto"><img src="<%=contextPath%>/<%= p.getBasicPath()%>" style="width: 220px; height: 147px"></div>
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
			/* 상품상세보기  */
			$(function() {
				$(".pdtArea").click(function() {
					location.href = '<%=contextPath%>/infoDetail.pdt?pcode='+ $(this).children().eq(0).val();
        		});	
        	})
        	
        </script>


<!-- 		<div align="center" class="pageingArea">
            <button>이전</button>
            <button>x</button>
            <button>x</button>
            <button>다음</button>

        </div> -->



    </div>


</body>
</html>