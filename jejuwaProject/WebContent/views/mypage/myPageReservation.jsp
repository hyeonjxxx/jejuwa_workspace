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
	
	 <style>
	        .myPageResercation{margin: auto;}
	        .myPageResercation>h3{margin-top: 60px; font-size: 20px; font-weight: bold;}       
	        th{padding: 10px;}
			#orderList *{vertical-align: middle;}
			#product{color: black; font-weight: bold;}
	 </style>

</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
        
        
        <div class="myPageResercation">
            
            <table id = "orderList" class="table table-striped">
            	<thead>
                	<h3 class="head">예약조회</h3>
                	<hr>
            		<tr align = "center">
            			<th width="150">주문번호</th>
            			<th width="250">상품명</th>
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
			<%for(int i =0; i<list.size(); i++){ Order o = list.get(i); %>
				<%if(loginUser != null && loginUser.getMemNo() == o.getMemNo() && o.getcReason() == null && !o.getStatus().equals("취소")) {%>
                       <tr align="center">
                       	<td id = "orderNo<%=i%>" width="100"><%=o.getOrderNo() %></td>
                           
                           <td width="500">
                           	<img src="<%=contextPath %>/<%=o.getBasicPath() %>" width="50" height="50" alt="">
                           	<a href = "<%=contextPath%>/infoDetail.pdt?pcode=<%=o.getpCode()%>" id="product"><%=o.getpName() %></a>
                           </td>
                           <td id = "orderDetail<%=i%>" width="200" style="cursor:pointer; color: orange;">상세보기</td>
                           <td width="200">
                               <div style="margin: 0; padding: 0;"><%=o.getStatus() %></div>
                              	<%--<a href = "<%=contextPath%>/delete.or?ono=<%= o.getOrderNo() %>" >즉시취소</a> --%>
                           </td>
                       </tr>
                      <%} %>
				
				<script>
                   	$(function(){
                       	$("#orderDetail").click(function(){
                  			for(int i = 0; i<list.size(); i++){
                  				$("#orderDetail").append('<div id="orderDetail" + i>');
                       		})
                 		})	
                     })
                </script>
                <script>
                	$(function(){
                		$("#orderList>tbody>tr>#orderDetail<%=i%>").click(function(){
                			location.href = '<%=contextPath%>/detail.res?ono=' + $("#orderNo<%=i%>").text();
                		})
                	})
                </script>
				
                    	<%} %>
                    <%} %>
                    
                    
                    
                </tbody>
            </table>
            <br>
            <Pre>   예약 취소는 상세보기 페이지에서 가능합니다.</Pre>
            					
            <br><br>
            
           </div>
		</div>

       
        <%@ include file = "../common/footer.jsp" %>
</body>
</html>