<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, 
    com.kh.payment.model.vo.Payment, com.kh.product.model.vo.*
    , com.kh.member.model.vo.Member, com.kh.order.model.vo.Order
    , com.kh.coupon.model.vo.Coupon"%>
<%
	////ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	//Payment pa = (Payment)request.getAttribute("pa");
	Product p = (Product)request.getAttribute("p");
	Coupon c = (Coupon)request.getAttribute("c");
	Member m = (Member)request.getAttribute("m");
	String travleDate = (String)request.getAttribute("travleDate");
	Member loginUser = (Member)session.getAttribute("loginUser");
	Order o = (Order)request.getAttribute("o");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기 페이지</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <link rel="stylesheet" type = "text/css" href="<%=request.getContextPath() %>/resources/css/payment/payment.css">

</head>
<body>

	<%@ include file = "../common/loginUserMenubar.jsp" %>
	
	<%--!=로 변경해야됨 --%>
	<%if(loginUser != null)  {%>
	
		<form id = "orderEnrollForm" action = "<%=contextPath%>/insert.or" method = "post">
			<input type="hidden" name="pcode" value="<%=p.getpCode() %>">
			<input type="hidden" name="price" value="<%=p.getPrice() %>">
			<input type="hidden" name="travle" value="<%=travleDate%>">
			
				<div class = "paymentPage">
					<br><br>
						<p id="pHead">결제하기</p>
					    <ul class="paymentOrder">
					    	
					        <br>
					        <li class="container p-3 my-3 bg-dark text-white" id="inforMationTravel">
					            <table class="table table-bordered" style="margin: auto;">
					                <tr class="table-light">								
					                    <td name = "username" colspan="2" style="width: 350px; height: 60px;"><%=p.getpName() %></td>
					                </tr>
					                <tr class="table-light">
					                    <td style="height: 30px;">여행일</td>
					                    <td><input name = "travleDate" value = "<%=travleDate%>" style = "border:none;" readonly></td>
					                </tr>
					                <tr class="table-light">
					                    <td style="height: 30px;">총금액</td>
					                    <td><%=p.getPrice()%>원</td>
					
					                </tr>
					            </table>
					        </li>
					
					        <li id="reservationInfo" class="container p-3 my-3 bg-dark text-white">
					            <p style="font-size: 20px; font-weight: bold;">예약자정보</p>
					            <label for="usr">예약자 이름</label>
					            <input type="text" class="form-control" id="usr" name="username" readonly value = "<%=loginUser.getMemName()%>"> <br>
					
					            <label for="email">이메일주소</label>
					            <input type="email" class="form-control" id="email" name="email" readonly value = "<%=loginUser.getEmail()%>"> <br>
					
					            <label for="phone">휴대전화</label>
					            <input type="phone" class="form-control" id="phone" name="phone" readonly value = "<%=loginUser.getPhone()%>"> <br>
					            
					        </li>
							
	
							
	
					        <li id="discount" class="container p-3 my-3 bg-dark text-white">
					            <p style="font-size: 20px; font-weight: bold;">할인적용</p> <br>
					            <select name="" id="" class="form-control">
									<%if(c == null){ %>
					            		<option value="" selected>쿠폰선택안함</option>
									<%}else{ %>
					                	<option value=""><%=c.getCpn_Name() %></option>
					                <%} %>
					            </select>
					            <hr>
					            <p style="font-size: 12px;">* 쿠폰을 선택하시면 총 결제금액에 자동으로 반영됩니다. </p>
					
					        </li>
							
							
							<li id="resultCash">
					            <p>총결제금액</p>
					            <p id="amount" name = "price"><%=p.getPrice() - p.getPrice() * c.getCpn_Dc()/100 %> 원 </p>
					        </li>
							
					        <li id="paymentMethod" class="container p-3 my-3 bg-dark text-white">
					            <p style="font-size: 20px; font-weight: bold;">결제방법</p> <br>
					            <fieldset style="border: none; font-size: 15px;">
					                <input type="radio" name="pay"> 신용카드 결제 <br><br>
					                <input type="radio" name="pay"> 실시간계좌이체 <br><br>
					                <input type="radio" name="pay"> 네이버 페이 <br><br>
					                <input type="radio" name="pay"> 카카오 페이 <br>
					            </fieldset>
					        </li>
					
					        <li style="background-color: white;">
					
					        </li>
					        
					        <li id="pInfo" class="container p-3 my-3 bg-dark text-white">
					            <p style="font-size: 20px; font-weight: bold;">약관 및 안내</p>
					            <fieldset style="border: none; font-size: 15px;">
					                <input type="checkbox" id="checkall"> 전체약관동의 <br><br>
					                <input type="checkbox" name="chk"> 여행시 약관(필수) <br><br>
					                <input type="checkbox" name="chk"> 개인정보 수집 및 이용 동의(필수) <br><br>
					                <input type="checkbox" name="chk"> 개인정보제공동의(필수)    
					            </fieldset>
					        </li>
							
							<script>
								$(document).ready(function(){
									$("#checkall").click(function(){
										if($("#checkall").prop("checked")){
											$("input[name=chk]").prop("checked", true);
										}else{
											$("input[name=chk]").prop("checked", false);
										}
									})
								})
							</script>


							<li>
								<button type="submit" class = "btn btn-warning" id="order">주문하기</button>
							</li>
					
					</ul>
				
				</div>
		
		</form>
	
	<%} %>
	
</body>
</html>