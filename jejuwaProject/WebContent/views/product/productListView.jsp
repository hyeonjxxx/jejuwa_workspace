<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
    
<%@ page import="java.util.ArrayList, com.kh.product.model.vo.Product, com.kh.common.model.vo.PageInfo" %>
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
    
    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productListView.css">   

    <!-- modal icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	
	
	
</head>
<body>
		
	<%@ include file="../common/adminPageMenubar.jsp" %>
	
    <div class="outer">
	        <br>
	        <!-- new!! -->
	        <div class="header"> 
	            <span class="title">상품조회</span>
	            <div class="divisionLine"></div>
	        </div>
	
	        
	        <!-- 상품목록 -->
	        <div class="listArea">
	            
	            <div class="searchArea">
	                <form action="<%=contextPath %>/list.pdt" class="searchForm" method="get">
	                    <select name="options" id="options">
	                        <option value="전체">전체</option>
	                        <option value="상품명">상품명</option>
	                        <option value="지역">지역</option>
	                        <option value="코드">코드</option>
	                    </select>
	                    
	                    <input type="search" name="keyword" id="keyword">
	                    <button type="submit" id="searchBtn"><img src="<%=contextPath %>/resources/images/lookup.png" width="25" align="right"></button>
	                </form>    
	            </div>
	                      
	            
	            <!-- 삭제/등록버튼 -->
	            <div class="btnArea">
	                <!-- <div id="deleteBtn"><a href="">삭 제</a></div> -->
	                <button type="button" id="deleteBtn" data-toggle="modal" data-target="#deleteModal">삭 제</button>
	                <button id="enrollBtn"><a href="<%=contextPath %>/enroll.pdt">등 록</a></button>
	            </div>
	    	</div>
	    
	
	
	        <!-- The Modal -->
	        <div class="modal fade" id="deleteModal"  align="center">
	            <div class="modal-dialog modal-dialog-centered">
	                <div class="modal-content">
	                
	                    <!-- Modal body -->
	                    <div class="modal-body">
	                   	 상품을 삭제하시겠습니까?
	                    </div>
	                    <div id="modalContent" class="input-group mb-3">
	                        <div class="input-group-prepend">
	                        <span class="input-group-text" >
	                            <i class="bi bi-key"></i> <!-- i 태그 -->
	                        </span>
	                        </div>
	                        <input size="25" type="password" placeholder=" 관리자 비밀번호">
	                    </div>        
	                    
	                    <!-- Modal footer -->
	                    <div class="modal-footer" align="center">
	                    <button type="button" id="okBtn" class="btn btn-warning">OK</button>
	                    <button type="button" id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
	
		
	            <br>

				<!-- 체크박스 전체선택/해제 -->
			    <script>
			    
			    	/* 전체선택시  */
			        $(function(){
			
			            $("#checkAll").on("click", function(){
			
			                var checked = $("#checkAll").is(":checked");
			                if(checked){
			                    $(".check_single").prop("checked", true);
			                }else{
			                    $(".check_single").prop("checked",false);
			                }
			            })
			            
			            $(".check_single").on("click", function(){
			                            
			                            /* 체크된 체크박수 수 */
			                            var selected_box = $(".check_single:checkbox:checked").length;
			                            /* 전체 체크박스 수  */
			                            var check_box = $(".check_single:checkbox").length;
			                            
			                            /* 체크된 수 == 전체 수  => checkAll가 true */
			                            if(selected_box == check_box){
			                                $("#checkAll").prop("checked", true);
			                            }else{
			                                $("#checkAll").prop("checked", false);
			                            }
			            })
			        })
			    </script>	            
	            
	            <table class="pdtListView">
	                <thead>
	                    <tr>
	                        <th width="20"><input type="checkbox" id="checkAll"></th>  
	                        <th width="80">상품코드</th>
	                        <th width="150">상품명</th>
	                        <th width="70">판매가</th>
	                        <th width="50">수량</th>
	                        <th width="60">상품노출</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                	<% if(list.isEmpty()) { %>
	                		<tr>
	                			<td colspan="6">등록된 상품이 없습니다.</td>
	                		</tr>
	                	<% }else { %>	
	                		
	                		 <% for(Product p : list){ %>
	                		 	<tr>
	                            <input type="hidden" name="pcode" value="<%=p.getpCode()%>">       		 	
	                   			    <td><input type="checkbox" class="check_single"></td>
									<td><%= p.getpCode()  %></td>
									<td><%= p.getpName() %></td>
									<td><%= p.getPrice() %></td>
									<td><%= p.getpStock() %></td>
									<td><%= p.getpStatus() %></td>
	                		 	</tr>
	                		 <% } %>
	                	<% } %>
	                </tbody>
	            </table>
	            
	            
	            <script>
	            
	            $(function(){
	            	$(".pdtListView>tbody>tr").click(function(){
	            		//쿼리스트림 이용해서 요청할 url작성
	            		location.href = '<%= contextPath%>/updateForm.pdt?pcode='+ $(this).children().eq(0).val();
	            	})
	            })
	            </script>
	            
	            
	            <br><br>
	    
	        <!-- 페이징 구역 -->
	        <div class="bottomArea">
	   
	            
	            <!-- 페이징  -->
	            <div align="center" class="pagingArea">
	                    
                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=contextPath%>/list.pdt?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.pdt?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=contextPath%>/list.pdt?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.pdt?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.pdt?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
             </div>

	
    
    </div>
    
</body>
</html>