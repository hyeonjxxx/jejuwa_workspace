<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<%@ include file = "../common/managerMenubar.jsp" %>
	
	
	<div class = "paymentPage">
	<br><br>
		<p id="pHead">결제하기</p>
	    <ul class="outer">
	    	
	        <br>
	        <li class="container p-3 my-3 bg-dark text-white" id="inforMationTravel">
	            <table class="table table-bordered" style="margin: auto;">
	                <tr class="table-light">
	                    <td colspan="2" style="width: 350px; height: 60px;">xxxx 여행상품명</td>
	                </tr>
	                <tr class="table-light">
	                    <td style="height: 30px;">여행일</td>
	                    <td>xxx</td>
	                </tr>
	                <tr class="table-light">
	                    <td style="height: 30px;">인원</td>
	                    <td>xxx</td>
	                </tr>
	                <tr class="table-light">
	                    <td style="height: 30px;">총금액</td>
	                    <td>xxx원</td>
	
	                </tr>
	            </table>
	        </li>
	
	        <li id="reservationInfo" class="container p-3 my-3 bg-dark text-white">
	            <p style="font-size: 20px; font-weight: bold;">예약자정보</p>
	            <label for="usr">예약자 이름</label>
	            <input type="text" class="form-control" id="usr" name="username" required> <br>
	
	            <label for="email">이메일주소</label>
	            <input type="email" class="form-control" id="email" name="email" required> <br>
	
	            <label for="phone">휴대전화</label>
	            <input type="phone" class="form-control" id="phone" name="phone" required> <br>
	            
	            <p style="font-style: 8px;">예약 관련 연락 시 사용될 번호이니 정확하게 기입하여 주세요.</p>
	            
	        </li>
	
	        <li id="discount" class="container p-3 my-3 bg-dark text-white">
	            <p style="font-size: 20px; font-weight: bold;">할인적용</p> <br>
	            <select name="" id="" class="form-control">
	                <option value="" selected>쿠폰선택안함</option>
	                <option value="">웰컴쿠폰</option>
	            </select>
	            <br><br>
	            <hr>
	            <p style="font-size: 18px; font-weight: bold;">총 할인 금액</p>
	
	        </li>
	        
	        <li id="addReservation" class="container p-3 my-3 bg-dark text-white">
	            <p style="font-size: 20px; font-weight: bold;">추가예약정보</p>
	            <label for="usr2">예약자 이름</label>
	            <input type="text" class="form-control" id="usr2" name="username2"> <br>
	
	            <label for="email2">이메일주소</label>
	            <input type="email" class="form-control" id="email2" name="email2"> <br>
	        
	            <label for="phone2">휴대전화</label>
	            <input type="phone2" class="form-control" id="phone2" name="phone2" required> <br>
	            
	            <p style="font-style: 8px;">예약 관련 연락 시 사용될 번호이니 정확하게 기입하여 주세요.</p>
	        
	        
	        </li>
	
	
	        <li id="resultCash">
	            <p>총결제금액</p>
	            <p id="amount">xxxx원</p>
	        </li>
	
	
	        <li id="paymentMethod" class="container p-3 my-3 bg-dark text-white">
	            <p style="font-size: 20px; font-weight: bold;">결제방법</p> <br>
	            <fieldset style="border: none; font-size: 15px;">
	                <input type="radio"> 신용카드 결제 <br><br>
	                <input type="radio"> 실시간계좌이체 <br><br>
	                <input type="radio"> 네이버 페이 <br><br>
	                <input type="radio"> 카카오 페이 <br>
	            </fieldset>
	        </li>
	
	        <li style="background-color: white;">
	
	        </li>
	        
	        <li id="pInfo" class="container p-3 my-3 bg-dark text-white">
	            <p style="font-size: 20px; font-weight: bold;">약관 및 안내</p>
	            <fieldset style="border: none; font-size: 15px;">
	                <input type="checkbox" > 전체약관동의 <br><br>
	                <input type="checkbox"> 여행시 약관(필수) <br><br>
	                <input type="checkbox"> 개인정보 수집 및 이용 동의(필수) <br><br>
	                <input type="checkbox"> 개인정보제공동의(필수)    
	            </fieldset>
	        </li>
	
	</ul>

</div>

</body>
</html>