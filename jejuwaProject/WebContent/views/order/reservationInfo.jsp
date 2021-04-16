<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
	
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- myPageMenubar -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/order/reservationInfo.css">
</head>
<body>

	<%@ include file = "../common/managerMenubar.jsp" %>
	
	<br><br>
	
	<div class="outer">
        <div>예약상세</div>
        <br>
        <form action="" class="reservationForm">
            <div>상품명</div>
            
            <div id="notice" style="font-size: 15px; border-bottom: none;" >
                <b style="color: blue;">SMS 또는 카카오톡으로 사용 방법 또는 e-티켓이 전송될 예정입니다.</b> <br>
    <b style="color: red;">업체 별로 사용방법 또는 e-티켓 발송 방식이 다를 수 있으니, 반드시 구매하신 상품 상세 페이지에서 내용을 확인하여 주세요. <br>
    사용 방법 및 e-티켓 발송에 대한 문의 사항은 제주와 상품 상세 페이지에 적힌 공급업체로 연락바랍니다.</b>
            </div>
            <br><br>
            <table border="1px">
                <tr>
                    <th>예약번호</th>
                    <td>xxxxx</td>
                    <th>이용일</th>
                    <td>xxxx</td>
                </tr>
                <tr>
                    <th>여행자</th>
                    <td colspan="3">강동원 님 외 1명</td>
                </tr>
                <tr>
                    <th>주문정보</th>
                    <td colspan="3">소인입장권(유효기간 : 구매 후 30일까지)</td>
                </tr>
                <tr>
                    <th>여행컨셉</th>
                    <td colspan="3"></td>
                </tr>
            </table>
            <br><br>

            <div>결제금액</div>

            <table border="1px">
                <tr>
                    <th>예약번호</th>
                    <td>xxxxx</td>
                    <th>총 금액</th>
                    <td>xxxx</td>
                </tr>
                <tr>
                    <th>결제수단</th>
                    <td>xxxxx</td>
                    <th>총 할인금액</th>
                    <td>xxxx</td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                    <th>결제금액</th>
                    <td>xxxx</td>
                </tr>
            </table>
            <br><br>


            <!-- 모달 -->
            <div>
                여행확인증
                <button class="openBtn">이메일전송</button>
            </div>
           
            <div class="modal hidden" >
              <div class="bg"></div>
              <div class="modalBox" align="center" style="width: 500px; height: 200px; margin: auto;">
                <p>여행확인증을 받을 이메일을 입력해주세요</p>
                <input type="email" placeholder="이메일을 입력해주세요." style="width: 350px; height: 20px;"> <br><br>
                <button class="closeBtn">취소</button>
                <button class="okBtn">확인</button>
              </div>
            </div>
            
            <script>
              const open = () => {
                document.querySelector(".modal").classList.remove("hidden");
              }
            
              const close = () => {
                document.querySelector(".modal").classList.add("hidden");
              }
            
              document.querySelector(".openBtn").addEventListener("click", open);
              document.querySelector(".closeBtn").addEventListener("click", close);
              document.querySelector(".bg").addEventListener("click", close);
            
            </script>


            <table border="1px">
                <tr>
                    <td>지각 관련 안내사항(약관 기반)</td>
                </tr>
                <tr>
                    <td>단독 투어: 15분 이상 미팅 장소에 나오지 않을 시 여행 해지/환불 불가 <br>
                        그룹 투어: 다른 여행자를 위해 지각할 시 기다려드리지 않으며 정시 출발
                    </td>
                </tr>
            </table>
            <br><br>
            <div>예약정보상세</div>
            <table border="1px">
                <tr>
                    <td>주문정보<br>
                        성인 입장권 ✕ 1
                    </td>
                </tr>
                <tr>
                    <td>
                        필수 안내- 주소 : 제주특별자치도 서귀포시 상예동 3592-5 <br>
                        - 문의전화 : 010-2691-0666 <br>
                        - 운영시간 : 09:30~18:00 (입장마감 17:30) <br>
                        - 48개월 이상 소인 금액 적용 <br>
                        
                        
                        【 꼭 확인하세요! 】
                        - 구매하신 인원 수대로 바코드가 MMS 문자로 발송됩니다. <br>
                        - 바코드에 수령된 인원 기준으로 관광지 입장하셔야 합니다. <br>
                        - 렌터카 및 자가운전자만 이용 가능합니다. <br>
                        - 단체관광 및 운전기사, 가이드 동반, 렌터카 기사 대여, 택시 이용 시 사용이 불가합니다. <br>
                        - 타 관광지 할인쿠폰과 중복할인이 불가합니다. <br>
                        - 관광지 폐장 1시간 전까지 입장해주셔야 관람이 편리합니다. <br>
                        - 패키지 상품은 한 군데라도 이용 시 부분 환불이 불가합니다. <br>
                        - 해당 상품의 유효기간은 구매 후 60일입니다. <br>
                        <br>
                        * 바코드 미발송, 분실 등에 대한 문의는 제주와로 부탁드립니다 
                    </td>
                </tr>
            </table>
            <br><br>
            <div>여행 비용</div>
            <table border="1px">
                <tr>
                    <th>총금액</th>
                    <td>xxxx원</td>
                </tr>
                <tr>
                    <th>결제금액</th>
                    <td>xxxx</td>
                </tr>
                <tr>
                    <th>결제수단</th>
                    <td>xxxx</td>
                </tr>
            </table>
            <br>
            <div style="font-size: 15px;">
                제주와는여행 확인증에 명시한 가이드 서비스 요금에만 취소 및 환불 정책을 적용하며 그 권리를 보장합니다. <br>
                여행 확인증에 명시되지 않은 내용이나 가이드와 개별적으로 약속한 내용은 제주와하고는 무관함을 알려드립니다. <br>
                현지 긴급 상황 발생 시 : 가이드 (공급처) 연락처로 연락주세요. <br>
                고객센터 운영시간: 한국시간 09시 ~ 18시 (월~금, 공휴일&휴일 1:1 문의만 가능) <br>
            </div>
        </form>
    </div>

    <br>

        <div id = "click_btn" align="center">
            <button type='button' id="modal_btn">취소요청하기</button>
        </div>

        
        <div class="black_bg"></div>
            <div class="modal_wrap">
                <div class="modal_close"><a href="#">close</a></div>
                    <div>
                        <form action = "enrollMember.do" id="reason">
                            <p style="border-bottom: 1px solid gray;" id="cancelHead">취소하기</p>
                            <p id="smallCancelHead">취소사유</p> <br>
                            <input type = "radio"> 여행자개인사정 <br><br>
                            <input type = "radio"> 모객마감 <br><br>
                            <input type = "radio"> 모객부족 <br><br>
                            <input type = "radio"> 가이드일정불가 <br><br>
                            <input type = "radio"> 가이드무응답 <br><br>
                            <input type = "radio"> 건강 상의 이유 <br><br>
                            <input type = "radio"> 재예약 진행을 위해 <br><br>
                            <input type = "radio"> 천재지변 <br><br>
                            <input type = "radio"> 기타 
                            <input type="text" style="width: 80%; height: 20px;" placeholder="기타의견을 적어주세요."><br>
                        <br>                 
                        </form>

                        <div id="reservationCancel">
                            <button type="submit" >예약취소하기</button>
                        </div>
                    </div>
            </div>

    <script>
        window.onload = function() {
     
        function onClick() {
            document.querySelector('.modal_wrap').style.display ='block';
            document.querySelector('.black_bg').style.display ='block';
        }   
        function offClick() {
            document.querySelector('.modal_wrap').style.display ='none';
            document.querySelector('.black_bg').style.display ='none';
        }
     
        document.getElementById('modal_btn').addEventListener('click', onClick);
        document.querySelector('.modal_close').addEventListener('click', offClick);
        
     
    };
    </script>
</body>
</html>