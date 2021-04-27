<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.order.model.vo.Order, 
    com.kh.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/order/orderListView.css">   

	<script>
		var param = ${paramJson};
	</script>

</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>주문내역관리</h2>
        <div class="divisionLine"></div>
       

        
        <!-- 주문검색 -->
        <div class="listArea">
        	
      	 	<input type = "hidden" name = "page" value = "1">
      	 	<div class="search_option">
                <select name="key" class = "searchForm" id="option">
                    <option value="orderNo">주문번호</option>
                </select>
                   <input type="search" name="search" value = "" id = "keyword">
            </div>
         	
         	<script>
         		$(document).ready(function(){
         			$("#keyword").keyup(function(){
         				var k = $(this).val();
         				$("#productListView>tbody>tr").hide();
         				var temp = $("#productListView>tbody>tr>td:nth-child(10n+1):contains('" + k + "')");
         				$(temp).parent().show();
         			})
         		})
         	</script>
            <!-- 삭제/등록버튼 -->
            <!-- 
            <div class="btn">
                <a href="#" class="btn btn-secondary btn-sm">삭 제</a>
                <a href="#" class="btn btn-secondary btn-sm">등 록</a>
            </div>
    		-->
            <br>
            <table  id="productListView" border="1">
                <thead>
                    <tr>
                        
                        <th width="40px">No</th>
                        <th>Order Date</th>
                        <th>Amount</th>
                        <th>Travel Date</th>
                        <th>Traveler</th>
                        <th>E-mail</th>
                        <th width="70px">Status</th>
                        <th>Cancel Reason</th>
                        <th>MemNo</th>
                        <th>change</th>


                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()) { %>
            		<tr>
            			<td colspan="5">존재하는 주문내역이 없습니다.</td>
            		</tr>
            	<% }else{ %>
                	<%for(int i=0; i<list.size(); i++){ Order o = list.get(i); %>
                        <tr>
	                        <td><%= o.getOrderNo()%></td>
	                        <td><%= o.getOrderDate() %></td>
	                        <td><%= o.getAmount() %></td>
	                        <td><%= o.getTravelDate() %></td>
	                        <td><%= o.getTravelUser() %></td>
	                        <td><%= o.getTravelEmail() %></td>
	                        <td><%= o.getStatus() %></td>
	                        <td><%= o.getcReason() %></td>
	                        <td><%= o.getMemNo() %></td>
	                        
  	                        <!-- 변경 모달창 -->
	                       	 <td>
                            <div class="container">
                                <!-- Button to Open the Modal -->
								<button id = "change" type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#orderModal<%=i%>" style="width: 50px; height: 30px;">
									
                                 	변경
                                </button>
                                <!-- The Modal -->
                                <div class="modal fade" id="orderModal<%=i%>">
                                  <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
		                              <form action = "<%=contextPath%>/update.cor" id = "changeOrderForm" method = "post">
		                              	 <input type="hidden" name="ono" value="<%=o.getOrderNo()%>">
			                                      
	                                      <!-- Modal Header -->
	                                      <div class="modal-header">
	                                        <h4 class="modal-title" >주문내역</h4>
	                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                      </div>
		                                      
	                                      <!-- Modal body -->
	                                      <div class="modal-body">
	                                        <table class="table table-bordered" id = "modalTable" style="text-align: center;">
	                                            <tr>
	                                                <th>예약번호</th>
	                                                <td><%= o.getOrderNo()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th>예약자</th>
	                                                <td><%= o.getTravelUser() %></td>
	                                            </tr>
	                                            <tr>
	                                                <th>예약일자</th>
	                                                <td><%= o.getOrderDate() %></td>
	                                            </tr>
	                                            <tr>
	                                                <th>상품명</th>
	                                                <td><%= o.getpCode() %></td>
	                                            </tr>
	                                            <tr>
	                                                <th>결제금액</th>
	                                                <td><%= o.getAmount() %></td>
	                                            </tr>
	                                            <tr>
	                                                <th>입금상태</th>
	                                                <td>
                                                    	<select name = "status" style="width: 80%; margin-left: 35px;" id="selectOption">
									                        <option value="예약접수">예약접수</option>
									                        <option value="예약확정">예약확정</option>
									                        <option value="여행완료">여행완료 </option>
									                        <option value="취소">취소</option>
								                        </select>
                                                    	
	                                                    
													</td>
													
													<script>
							                        	$(function(){
							                        		
							                        		$("#changeOrderForm option").each(function(){
							                        			if($(this).text() == "<%=o.getStatus()%>"){
							                        				$(this).attr("selected", true);
							                        			}
							                        		})
							                        		
							                        	})
							                        </script>
							                        
													
	                                            </tr>
                                       		</table>
	                                        
	                                      </div>
	                                      
	                                      <!-- Modal footer -->
	                                      <div class="modal-footer">
	                                      	<button type="submit" class="btn btn-warning">변경</button>
	                                        <button type="button" class="btn btn-secondary">취소</button>
	                                      </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
	                                
	                                <script>
	                                	$(function(){
	                                		
	                                		$("#change").click(function(){
				                        		for(int i = 0; i<list.size(); i++){
				                        			$("#change").append('<div class ='modal fade' id="change" + i>');
	                                			})
			                        		})	
	                                	})
			                        </script>
			                        
	                                <script>
	                                
	                                	$(function(){
	                                		$("#change").click(function(){
					                        	for(int i = 0; i<list.size(); i++){
					                        		$("#orderModal").append('<div class ='btn btn-warning btn-sm' id="orderModal" + i>');
				                        			
					                        	})
	                                		})
	                                	})
			                        </script>
			                        
			                        
	                              
	                               
	                            </div>
	                        </td>
							
                    	</tr>
                    <% } %>
                   <% } %>
                </tbody>
    
            </table>
            <br><br>
    
            <div align="center" class="pagination" id="pagingArea" style="margin: auto; position: relative; left: 330px;">
				<% if(currentPage != 1) { %>
            		<li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.or?currentPage=<%=currentPage-1%>';" style="color: black;">이전</button></li>
				<% } %>
			
				<% for(int p=startPage; p<=endPage; p++) { %>
				
					<% if(currentPage == p){ %>
            			<li class="page-item active"><button class="page-link" disabled style="background-color: orange; border: none;"><%= p %></button></li>
            		<% }else{ %>
            			<li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.or?currentPage=<%= p %>';" style="color: black;"><%= p %></button></li>
            		<% } %>
            	
				<% } %>
			
				<% if(currentPage != maxPage){ %>
            		<li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.or?currentPage=<%=currentPage+1%>';" style="color: black;">다음</button></li>
				<% } %>
    
            </div>

        </div>
    </div>
	
</body>
</html>