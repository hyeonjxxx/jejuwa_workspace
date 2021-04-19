<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.order.model.vo.Order"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
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
       

        
        <!-- 상품목록 -->
        <div class="listArea">
            <div class="search_option">
                    <select name="option" id="option">
                        <option value="total">주문번호</option>
                        <option value="pName">회원번호</option>
                        <option value="pCode">옵션번호</option>
                    </select>
                    
                    <!-- 검색바는 다시 수정이 필요!! (form태그로!!) -->
                    <!-- <form action="" class="search_form"> -->
                        <input type="search" name="" id="">
                        <button type="submit">검색</button>
                    <!-- </form> -->

            </div>
            
            <!-- 삭제/등록버튼 -->
            <div class="btn">
                <a href="#" class="btn btn-secondary btn-sm">삭 제</a>
                <a href="#" class="btn btn-secondary btn-sm">등 록</a>
            </div>
    
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
            			<td colspan="5">존재하는 공지사항이 없습니다.</td>
            		</tr>
            	<% }else{ %>
                	<%for(Order o : list){ %>
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
	                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal" style="width: 50px; height: 30px;">
	                                 	변경
	                                </button>
	                              
	                                <!-- The Modal -->
	                                <div class="modal fade" id="myModal">
	                                  <div class="modal-dialog modal-dialog-centered">
	                                    <div class="modal-content">
	                                    
	                                      <!-- Modal Header -->
	                                      <div class="modal-header">
	                                        <h4 class="modal-title" >주문내역</h4>
	                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                      </div>
	                                      
	                                      <!-- Modal body -->
	                                      <div class="modal-body">
	                                        <table class="table table-bordered" style="text-align: center;">
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
	                                                <td>xxx</td>
	                                            </tr>
	                                            <tr>
	                                                <th>결제금액</th>
	                                                <td><%= o.getAmount() %></td>
	                                            </tr>
	                                            <tr>
	                                                <th>입금상태</th>
	                                                <td>
	                                                    <input type="checkbox" id="reserJ" name="status" value="reserJ" onclick="checkOnlyOne(this)"><label for="reserJ">예약접수</label>
	                                                    <input type="checkbox" id="reserH" name="status" value="reserH" onclick="checkOnlyOne(this)"><label for="reserH">예약확정</label>
	                                                    <input type="checkbox" id="reserW" name="status" value="reserW" onclick="checkOnlyOne(this)"><label for="reserW">여행완료</label>
	                                                    <input type="checkbox" id="reserC" name="status" value="reserC" onclick="checkOnlyOne(this)"><label for="reserC">여행취소</label>
													</td>
													
	    	                                         <script>
	                                                    function checkOnlyOne(element) {
	                                
	                                                      const checkboxes 
	                                                          = document.getElementsByName("status");
	                                                      
	                                                      checkboxes.forEach((cb) => {
	                                                          cb.checked = false;
	                                                      })
	                                                      element.checked = true;
	                                                  }
	                                                </script>
	                              
	                                            </tr>
	                                        </table>
	                                      </div>
	                                      
	                                      <!-- Modal footer -->
	                                      <div class="modal-footer">
	                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                                      </div>
	                                      
	                                    </div>
	                                  </div>
	                                </div>
	                                
	                              </div>
	                        </td>
							
                    	</tr>
                    <% } %>
                   <% } %>
                </tbody>
    
            </table>
            <br><br>
    
            <div align="center" class="pagingArea">
    
                <button>이전</button>
    
                <button>X</button>
                <button>X</button>
    
                <button>다음</button>
    
            </div>

        </div>
    </div>
	
</body>
</html>