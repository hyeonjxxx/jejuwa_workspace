<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="../../resources/css/product/productListView.css">   

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
                <form action="" class="searchForm" method="get">
                    <select name="options" id="options">
                        <option value="">전체</option>
                        <option value="">상품명</option>
                        <option value="">상품코드</option>
                    </select>
                    
                    <input type="search" name="keyword" id="keyword">
                    <button type="submit"><img src="../../resources/images/lookup.png" width="25" align="right"></button>
                </form>    
            </div>
            
            <!-- 삭제/등록버튼 -->
            <div class="btnArea">
                <!-- <div id="deleteBtn"><a href="">삭 제</a></div> -->
                <button type="button" id="deleteBtn" data-toggle="modal" data-target="#myModal">삭 제</button>
                <button id="enrollBtn"><a href="<%= contextPath %>/enrollForm.pdt">등 록</a></button>
            </div>
    
    


        <!-- The Modal -->
        <div class="modal fade" id="myModal"  align="center">
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
            <table class="pdtListView">
                <thead>
                    <tr>
                        <th width="20"><input type="checkbox"></th>  
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
                   			    <td><input type="checkbox"></td>
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
            		location.href = '<%= contextPath%>/detail/pdt?pno=' + $(this).children().eq(0).text();
            	})
            })
            </script>
            
            
            <br><br>
    
        <!-- 페이징 구역 -->
        <div class="bottomArea">
   
            
            <!-- 페이징  -->
            <div align="center" class="pagingArea">
                    
                    <button>&laquo;</button>
                    <button>&lt;</button>			

                        <button disabled>1</button>				
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>			
                
                    <button>&gt;</button>
                    <button>&raquo;</button>

             </div>
			
		</div>

        </div>
    </div>
</body>
</html>