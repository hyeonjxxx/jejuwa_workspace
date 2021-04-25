<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.order.model.vo.Order"%>
<%
	//ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	Order o = (Order)request.getAttribute("o");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_취소내역_상세내역</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        #notice{
            background-color: orange;
            width:70%;
            margin: auto;
            padding: 10px;
        }

        #cancel{
            position: relative;
            left: -100px;

        }
        .outer div{
            margin: auto;
            width: 70%;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 10px;
        }
        .reservationForm table{
            width: 70%;
            margin: auto;
        }
        #policy{
            text-align: center;
        }

    </style>
</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	
	<br><br>
    <div class="outer" >
        <div id = "cancel" style="font-size: 20px;">취소내역</div>
        <hr>
        <br>
        <form action="" class="reservationForm" align="center">          
            
            <table class="table table-bordered" style="width: 700px;" >
                <tr class="table-warning">
                    <th width="200px">상품명</th>
                    <td colspan="3"><%=o.getpName() %></td>
                </tr>
                <tr>
                    
                    <th>예약번호</th>
                    <td><%=o.getOrderNo() %></td>
                    <th width="200px">이용일</th>
                    <td>xxxx</td>
                </tr>

                <tr class="table-warning">
                    <th>여행자</th>
                    <td colspan="3"><%=o.getTravelUser() %></td>
                    
                </tr>

                <tr>
                    <th>예약일</th>
                    <td colspan="3">xxxx</td>
                </tr>

                <tr class="table-warning">
                    <th>취소자</th>
                    <td colspan="3"><%=o.getTravelUser() %></td>
                </tr>

                <tr >
                    <th>결제내역</th>
                    <td colspan="3"><%=o.getAmount() %></td>
                </tr>

                

            </table>
            <br><br>
 
        </form>
    </div>

    <div id="policy">
        <a href="" style="text-decoration: none; color: black;">취소 및 환불정책</a>
    </div>
</body>
</html>