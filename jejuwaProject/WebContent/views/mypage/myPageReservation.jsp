<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, 
    com.kh.payment.model.vo.Payment, com.kh.product.model.vo.*
    , com.kh.member.model.vo.Member, com.kh.order.model.vo.*"%>
<%
	////ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	//Payment pa = (Payment)request.getAttribute("pa");
	//Member loginUser = (Member)session.getAttribute("loginUser");
	//Order o = (Order)request.getAttribute("o");
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

 <!-- jQuery library -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <!-- Popper JS -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

 <!-- Latest compiled JavaScript -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/myPageMenubar.css">
<link rel="stylesheet" type = "text/css" href="<%=request.getContextPath() %>/resources/css/mypage/myPageReservation.css">

</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	
		<div class="wrap">       
	        <div class="content" >
	
	            <!-- 강동원님 반갑습니다 영역 -->
	            <div class="myPageResercation">
	                
	                <!-- 여기서부터 예약조회!!!! 위에는 다 include 처리하기 -->
	                <div class="mypageContents">
	                    <h3 class="head">예약조회
	                        <em style="font-style: normal; font-size: 15px;">(최근1개월)</em>
	                    </h3>
	                </div>
	                <hr>
	
	                <table class = "orderList">
	                	<thead>
	                		<tr align = "center">
	                			<th>주문번호</th>
	                			<th>상품명</th>
	                			<th>상세보기</th>
	                			<th>접수현황</th>
	                		</tr>
	                	</thead>
	                    <tbody>
	                    	<%if(list.isEmpty()){ %>
		                        <!-- 조회된 결과가 없을 경우 -->
		                        <tr>
		                            <td colspan = "6" align="center">조회된 리스트가 없습니다.</td>
		                        </tr>
	                        <%}else{ %>

	                        <!-- 조회된 결과가 있을 경우 -->
								<%for(Order o : list){ %>
									<%if(loginUser != null && loginUser.getMemNo() == o.getMemNo() && o.getcReason() == null) {%>
				                        <tr align="center">
				                        	<td id = "orderNo" width="100"><%=o.getOrderNo() %></td>
				                            
				                            <td width="300"><%= o.getpName() %></td>
				                            <td id = "orderDetail" width="200">상세보기</td>
				                            <td width="100">
				                                <div style="margin: 0; padding: 0;"><%=o.getStatus() %></div>
				                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">즉시취소</button>
				                            </td>
				                        </tr>
			                        <%} %>

	                        	<%} %>
	                        <%} %>
	                        
	                        
	                        
	                        <!-- 즉시취소 가능할 때 -->
	                        
	                        <!--  
	                        <div class="container">
	                            <div class="modal fade" id="myModal">
	                              <div class="modal-dialog modal-dialog-centered">
	                                <div class="modal-content">
	                                                                 
	                                  // modal-body
	                                  <div class="modal-body">
	                                    취소되었습니다.
	                                  </div>
	                                  
	                                  // modal footer
	                                  <div class="modal-footer">
	                                    <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
	                                  </div>
	                                  
	                                </div>
	                              </div>
	                            </div>                           
	                        </div>
	                        -->    
	
	
	
	
	                        <!-- 즉시취소 불가능할 때 -->
	                        
	                        <div class="container">
	                                    
	                            <div class="modal fade" id="myModal">
	                              <div class="modal-dialog modal-dialog-centered">
	                                <div class="modal-content">
	                                                                 
	                                  <!-- Modal body -->
	                                  <div class="modal-body" align="center">여행당일에는 취소가 불가능합니다.</div>
	                                  
	                                  <!-- Modal footer -->
	                                  <div class="modal-footer">
	                                    <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
	                                  </div>
	                                  
	                                </div>
	                              </div>
	                            </div>
	                            
	                        </div>
	                	
	
	                        
	                    </tbody>
	                </table>
	                
	                <script>
	                	$(function(){
	                		$(".orderList>tbody>tr>#orderDetail").click(function(){
	                			location.href = '<%=contextPath%>/detail.res?ono=' + $(".orderList>tbody>tr").children().eq(0).text();
	                		})
	                	})
	                </script>

						
	                <br><br>
	                
	                </div>
	
	            </div>
	
	    </div>
         
</body>
</html>