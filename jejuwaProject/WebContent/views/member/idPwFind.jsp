<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- idPwFind css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/member/idPwFind.css">



    <!-- idPwFind fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <!-- jQuery 휴대폰 인증 서비스-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    
    <!-- iamport.payment.js 휴대폰 인증 서비스-->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <!-- idPwFind js-->
        <script src="<%=request.getContextPath()%>/resources/js/member/idPwFind.js"></script>

</head>
<body>
	<%@ include file="../common/loginUserMenubar.jsp" %>
    <input type="hidden" id="is_mobile_auth_id" value="F">
    <input type="hidden" id="is_mobile_auth_pwd" value="F">
    <div class="idPwFind_wrap">
        <p>아이디/비밀번호 찾기</p><br><br><br>
        <div class="idFind_wrap">
            <b style="font-size: 20px;">아이디 찾기</b><br><br>
            <form action="<%= request.getContextPath() %>/IdFindSuccess.me" method="post">
                
                <input type="hidden" name="memId" value="">
                <div class="idFind">
                    <table class="tb-id">
                        <tbody>
                            <tr class="name">
                                <th>이름</th>
                                <td><input type="text" name = "idFind_name" id="idFind_name"></td>
                            </tr>
                            <tr class="phone">
                                <th>휴대폰번호</th>
                                <td>
                                    <input type="text" name="id_phone" id="id_phone" placeholder="(-없이)">
                                    <button type="button" id="id_mobile_auth">인증번호요청</button>
                                </td>
                            </tr>
                            <tr class="certification">
                                <th>인증번호</th>
                                <td>
                                    <input type="text" name="id_auth_num" id="id_auth_num">
                                    <button type="button" id="id_auth_confirm">인증번호 확인</button>
                                </td>
                            </tr>
                            <tr class="memo">
                                <th></th>
                                <td style="font-size:10px;">* 인증번호는 발송 후 30분내에서만 유효합니다</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttonArea">
                    <button type="submit" class="btn btn-warning btn-idPwfind" id="idFind_btn">아이디 찾기 ></button>
                </div>
            </form>
            <br>

        </div>
        <div class="pwFind_wrap">
            <b style="font-size: 20px;">비밀번호 찾기</b><br><br>
            <form action="<%= request.getContextPath() %>/PwFindSuccess.me" method="post">
                <input type="hidden" name="memPwd" value="">
                <div class="pwFind">
                    <table class="tb-pw">
                    <tbody>
                        <tr class="id">
                            <th>아이디</th>
                            <td><input type="text" name ="pwFind_id" id="pwFind_id" class="full"></td>
                        </tr>
                        <tr class="name">
                            <th>이름</th>
                            <td><input type="text" name ="pwFind_name" id="pwFind_name" class="full"></td>
                        </tr>
                        <tr class="phone">
                            <th>휴대폰번호</th>
                            <td>
                                <input type="text" name="pwd_phone" id="pwd_phone" placeholder="(-없이)">
                                <button type="button" id="pwd_mobile_auth">인증번호요청</button>
                            </td>
                        </tr>
                        <tr class="certification">
                            <th>인증번호</th>
                            <td>
                                <input type="text" name="pwd_auth_num" id="pwd_auth_num">
                                <button type="button" id="pwd_auth_confirm">인증번호 확인</button>
                            </td>
                        </tr>
                        <tr class="memo">
                            <th></th>
                            <td style="font-size:10px;">* 인증번호는 발송 후 30분내에서만 유효합니다</td>
                        </tr>
                    </tbody>
                    </table>
                </div>
                <div class="buttonArea">
                    <button type="submit" class="btn btn-warning btn-idPwfind" id="pwFind_btn"> 비밀번호 찾기 > </button>
                </div> <br>
            </form>
            <br>
 
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>