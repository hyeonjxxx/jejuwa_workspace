<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 취소 내역</title>

<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 달력 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <style>
        .wrap{width: 1000px; height:800px;  margin: auto;}        
        .wrap>div{width: 100%;}
        .outer{margin: auto;}
        .outer>h3{margin-top: 60px; font-size: 20px; font-weight: bold;}       
        th{padding: 10px;}

    </style>
</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	
	<div class="outer">
                
                    <table class="listArea" >   
                        <h3>취소내역</h3>
                        <hr>
                        <tr align="center" style="border-bottom: 1px solid black;">
                            <th rowspan="3" width=800 >상품</th>
                            <th rowspan="2" width=200>상태</th>
                        </tr>
                    </table>
                
                    <br>
               
                    <table>
                        
                            <!-- 조회된 결과가 있을 경우 -->

                            <tr align="center">
                                
                                <td width=800 >
                                    상품명 <br>
                                    <a href="" style="color: orange;">취소내역상세보기</a>
                                </td>
                                <td width=200>
                                    <div>예약확정</div>
                                    <input id="datepicker" type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">다시예약하기</input>
                                </td>

                            </tr>

                            <script>
                                $(function() {
                                    $("#datepicker").datepicker({
                                    });
                                });
                            </script>



                            <!-- 조회된 결과가 없을 경우-->
                            <!--
                            <tr>
                                <td colspan="6" align="center"><br><br>
                                    	조회된 리스트가 없습니다.
                                </td>
                            </tr>
                            -->

                    </table>
                    <br><br>
                
                </div>
            </div>
        </div>
    </div>
</body>
</html>