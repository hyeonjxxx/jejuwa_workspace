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


</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>주문내역관리</h2>
        <div class="divisionLine"></div>
       

        
        <!-- 주문검색 -->
        <div class="listArea">
      	 	<div class="search_option">
                <select name="orderSearch" class = "searchForm" id="orderSearch">
                    <option value="orderNo">주문번호</option>
                    <option value="memNo">회원번호</option>
                </select>
                   <input type="text" id = "keyword" onkeyup="enterkey();">
                   
            </div>
         	
         	<!-- jquery 방식을 통한 검색-->
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
	                                                <td><%= o.getAmount() %>원</td>
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
			                        
			                        <!--  
			                        <script>
							       		function enterkey(){
							       			// 엔터키 눌렀을 때 실행
							       			if(window.event.keyCode == 13){
							       				var search = $("#orderSearch option:selected").val();
							       				var keyword = $("#keyword").val();
							       				
							       				$.ajax({
							       					url : "searchAjax.or",
							       					type : "get",
							       					data : {search : search,
							       							keyword : keyword},
							       					success : function(list){
							       						console.log(list);
							       						
							       						var result = "";
							       						if(list.length == 0){
							       							result = "<tr><td colspan = '10'> 조회되는 예약 상품이 없습니다.</td></tr>"
							       						}
							       						for(var i in list){
							       							result += "<tr class = 'test4'>"
							       								    + "<td>" + list[i].orderNo + "</td>"
							       			                        + "<td>" + list[i].orderDate + "</td>"
							       			                        + "<td>" + list[i].amount + "</td>"
							       			                        + "<td>" + list[i].travelDate + "</td>"
							       			                        + "<td>" + list[i].travelUser + "</td>"
							       			                        + "<td>" + list[i].travelEmail + "</td>"
							       			                        + "<td>" + list[i].status + "</td>"
							       			                        + "<td>" + list[i].cReason + "</td>"
							       			                        + "<td>" + list[i].memNo + "</td>"
																	+ "<td><button id = 'change' type='button' class='btn btn-warning btn-sm' data-toggle='modal' data-target='#orderModal<%=i%>' style='width: 50px; height: 30px;'>변경</button></td>"
							       			                        + "</tr>";
							       						}
							       						
							       						$("#productListView tbody").html(result);
							       						$("#pagingArea").css("visibility", "hidden");
							       						
							       						$(function(){
							       							$("#change").click(function(){
							       								// 모달창 나오게
							       							})
							       							
							       						})
							       					}, error : function(){
							       						console.log("ajax통신 실패");
							       					}
							       				});
							       			}
							       		}
							         </script>
			                        -->
	                              
	                               
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