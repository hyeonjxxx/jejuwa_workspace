<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product, com.kh.common.model.vo.PageInfo" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/prouductCategoryView.css">
    <!-- map -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/map_s.css">
	<!--  -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	        

</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>
	
    <div class="content_wrap">

        <div class="content">

            <div class="side">
                <aside class="detailSearch">
                    <p onclick="top.location.href='<%=contextPath%>/mapSearch.pdt';">지도로 보기 <img src="<%=request.getContextPath() %>/resources/images/map.png" alt="" width="15"></p>
                    <div class="map">
                        <img src="<%=request.getContextPath() %>/resources/images/jejuMap.png" alt="제주지도" width="180px">
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
                    <a href="#">제주와 추천순<img src="<%=request.getContextPath() %>/resources/images/check_c.png" alt="" width="15"></a> &nbsp;&nbsp;
                    <a href="#">높은가격순<img src="<%=request.getContextPath() %>/resources/images/check_c.png" alt="" width="15"></a>
                </div>       
                
		        <div class="pdt_wrap">
		             <ul class="pdtList">
		        	<%for(Product p : list) {%> 
		             	<li class=pdtArea>
		                  <input type="hidden" name="pcode" value="<%=p.getpCode()%>">
		                   <div class="pdtBox">
			                     <a>
			                      <div class="pdtPhoto"><img src="<%=contextPath%>/<%= p.getBasicPath()%>" style="width: 220px;height: 165px"></div>
			                       <div class="pdtInfo">
			                           <p class="pdtName"><%=p.getpName() %></p>
			                           <p class="pdtPrice"><%=p.getPrice() %>원</p>
			                         </div>
			                       </a>
		                     </div>
		                  </li>
					<% } %>		
					</ul>
			 		<!-- 페이징 구역 -->
				        <div class="bottomArea">
				            <!-- 페이징  -->
				            <div align="center" id="pagingArea"  class="pagination justify-content-center">
				                    
			                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
			                    <% if(currentPage == 1) {%>
			                    	<button disabled>&laquo;</button>
				                    <button disabled>&lt;</button>			
			                    <%} else {%>
				                    <button onclick="location.href='<%=contextPath%>/trView.pdt?currentPage=1';">&laquo;</button>
				                    <button onclick="location.href='<%=contextPath%>/trView.pdt?currentPage=<%=currentPage-1%>';">&lt;</button>			
								<% } %>
								
								<!-- 마지막페이지는   endpage보다 작다 -->
								<% for(int p=startPage; p<=endPage; p++ ) {%>
								
									<% if(currentPage == p) {%>
			                        	<button disabled><%= p %></button>
			                        <% }else{ %>				
				                        <button onclick="location.href='<%=contextPath%>/trView.pdt?currentPage=<%= p %>';"><%= p %></button>
			                        <% } %>		
			                	<% } %>
			                	
			                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
			                	<% if(currentPage == maxPage){ %>
			                		<button disabled>&gt;</button>
				                    <button disabled>&raquo;</button>
			                	<% } else{ %>
			                		<button onclick="location.href='<%=contextPath%>/trView.pdt?currentPage=<%=currentPage+1%>';">&gt;</button>
				                    <button onclick="location.href='<%=contextPath%>/trView.pdt?currentPage=<%=maxPage%>';">&raquo;</button>
			                	<% } %>
			             	</div>
			    		</div>					
					
		        </div>
	   		 </div>
		        
		        <script>
		        	$(function(){
		        		$(".pdtArea").click(function(){
		        			location.href = '<%=contextPath%>/infoDetail.pdt?pcode='+ $(this).children().eq(0).val();
		        		})	
		        	})
		        	
		        </script>


	       
    		
    		
    		

		</div>
    </div>	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>