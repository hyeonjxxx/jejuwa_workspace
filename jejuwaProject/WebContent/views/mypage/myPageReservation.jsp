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
	
	
		<div class="myPageWrap">       
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
	                
	                <table id = "orderList" class="table table-striped">
	                	<thead>
	                		<tr align = "center">
	                			<th>주문번호</th>
	                			<th width="300">상품명</th>
	                			<th width="200">상세보기</th>
	                			<th width="100">접수현황</th>
	                		</tr>
	                	</thead>
	                    <tbody>
	                    	<%if(list.isEmpty()){ %>
		                        <!-- 조회된 결과가 없을 경우 -->
		                        <!-- 왜 조회된 결과 없으면 안나올까? -->
		                        <tr align="center">
		                            <td rowspan = "4" align="center">조회된 리스트가 없습니다.</td>
		                        </tr>
	                        <%}else{ %>

	                        <!-- 조회된 결과가 있을 경우 -->
								<%for(Order o : list){ %>
									<%if(loginUser != null && loginUser.getMemNo() == o.getMemNo() && o.getcReason() == null) {%>
				                        <tr align="center">
				                        	<td id = "orderNo" width="100"><%=o.getOrderNo() %></td>
				                            
				                            <td width="300"><%= o.getpName() %></td>
				                            <td id = "orderDetail" width="200" style="cursor:pointer;">상세보기</td>
				                            <td width="100">
				                                <div style="margin: 0; padding: 0;"><%=o.getStatus() %></div>
			                                	<%--<a href = "<%=contextPath%>/delete.or?ono=<%= o.getOrderNo() %>" >즉시취소</a> --%>
				                            </td>
				                        </tr>
			                        <%} %>

	                        	<%} %>
	                        <%} %>
	                        
	                        
	                        
	                    </tbody>
	                </table>
	                <br>
	                <Pre>   예약 취소는 상세보기 페이지에서 가능합니다.</Pre>
	                <script>
	                	$(function(){
	                		$("#orderList>tbody>tr>#orderDetail").click(function(){
	                			location.href = '<%=contextPath%>/detail.res?ono=' + $("#orderList>tbody>tr").children().eq(0).text();
	                		})
	                	})
	                </script>
	
						
	                <br><br>
	                
	                </div>
	
	            </div>
	
	    </div>
      </div>
       
        <%@ include file = "../common/footer.jsp" %>
</body>
</html>