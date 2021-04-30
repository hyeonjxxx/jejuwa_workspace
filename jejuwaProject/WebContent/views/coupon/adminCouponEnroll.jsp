<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰등록페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <style>
       
 
 

.Coupon-wrap{
	magin:auto;
	height:50%;
}

#CouponEnrollForm table { margin: auto;
        
        border-collapse: separate;
        border-spacing: 0 30px;
} 

td{margin:50px;}

 

a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: blue; text-decoration: underline;}


.btn-c{
	margin:20px;
	text-align:right;
	margin-right:100px;
}

.btn-c * {
	margin:10px;
}

/* 입력폼 */



    </style>
</head>
<body>
<%@ include file="../common/adminPageMenubar.jsp" %>
           
    <div class="coupon-outer">
        <br>
        <h2>쿠폰등록</h2>
       <hr>
        <br>

        <!-- 상품등록 입력폼 -->
        <div class="Coupon-wrap">
            <form id="CouponEnrollForm" action="<%=contextPath%>/insert.do" method="post">
                
                <table>
                    <tr>
                        <td width="100">* 쿠폰명</td>
                        <td><input type="text" name="name_cpn" required></td>
                    </tr>
                    <tr>

                        <!-- 첫번째 입력값보다 나중 날짜이도록 설정 -->
                        <td width="100">* 기간</td>
                        <td><input type="date" name="start_cpn"> ~ <input type="date" name="end_cpn" max></td>
                    </tr>
                    <tr>
                        <td width="100">* 할인율(%) </td>
                        <td><input type="number" style="width: 100px;" min="3" max="50" name="dc" required>%</td>
                    </tr>
                    <tr>
                        <td width="100">* 쿠폰사용조건</td>
                        <td><input type="number" name="use" id="" placeholder="10,000" min="10000"max="100000" required step="10000" value="10000">원 이상 사용가능</td>
                    </tr>
                </table>
                	<br><br>
                    <div class="btn-c">
			            <div class="btn btn-outline-warning"><a href="<%=contextPath%>/listadmin.cpn?currentPage=1">목록</a></div><!-- 쿠폰목록조회페이지로 -->
			            <button type = "submit" class="btn btn-warning" >등록하기</button>
		            </div>
            
          
       
            </form>

        </div>
        <br><br>


    </div>
       

    
         
    
</body>
</html>