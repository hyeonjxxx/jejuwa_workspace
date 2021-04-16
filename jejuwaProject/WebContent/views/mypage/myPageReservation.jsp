<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <ul class="mypageStep">
                    <li>
                        <em>0</em>
                        <span>주문접수</span>
                        <img src="<%=request.getContextPath() %>/resources/images/화살표.png" id="img1">
                    </li>

                    <li>
                        <em>0</em>
                        <span>결제완료</span>
                        <img src="<%=request.getContextPath() %>/resources/images/화살표.png" id="img2">
                    </li>

                    <li>
                        <em>0</em>
                        <span>예약확정</span>
                        <img src="<%=request.getContextPath() %>/resources/images/화살표.png" id="img3">
                    </li>

                    <li>
                        <em>0</em>
                        <span>여행완료</span>
                    </li>
                </ul>
                
               <fieldset class = "searchPeriod_field">
                   <legend></legend>
                   <div class="selectDate">
                       <p id="period">구매기간</p>
                       <ul class="selectMonth">
                           <li class="on">
                               <button type="button" data-month="-1" class="btn btn-dark btn-sm">1개월</button>
                           </li>
                           <li class="on">
                               <button type="button" data-month="-3" class="btn btn-dark btn-sm">3개월</button>
                           </li>
                           <li class="on">
                               <button type="button" data-month="-6" class="btn btn-dark btn-sm">6개월</button>
                           </li>  
                       </ul>

                       <div class="selectRange">
                           <select id="startYear" title="년도를 선택하세요" width="70px">
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                                <option value="2014">2014</option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021" selected>2021</option>
                           </select>

                           <label for="startYear">년</label>

                           <select id="startMonth" title="월을 선택하세요" width="70px">
                               <option value="01">1</option>
                               <option value="02">2</option>
                               <option value="03">3</option>
                               <option value="04" selected>4</option>
                               <option value="05">5</option>
                               <option value="06">6</option>
                               <option value="07">7</option>
                               <option value="08">8</option>
                               <option value="09">9</option>
                               <option value="10">10</option>
                               <option value="11">11</option>
                               <option value="12">12</option>
                           </select>
                           <label for="startMonth">월</label>

                           <select id="startDay" title="일을 선택하세요" width="70px">
                               <option value="01">1</option>
                               <option value="02">2</option>
                               <option value="03">3</option>
                               <option value="04">4</option>
                               <option value="05">5</option>
                               <option value="06">6</option>
                               <option value="07">7</option>
                               <option value="08">8</option>
                               <option value="09">9</option>
                               <option value="10">10</option>
                               <option value="11">11</option>
                               <option value="12">12</option>
                               <option value="13">13</option>
                               <option value="14">14</option>
                               <option value="15">15</option>
                               <option value="16">16</option>
                               <option value="17">17</option>
                               <option value="18">18</option>
                               <option value="19">19</option>
                               <option value="20">20</option>
                               <option value="21">21</option>
                               <option value="22">22</option>
                               <option value="23">23</option>
                               <option value="24">24</option>
                               <option value="25">25</option>
                               <option value="26">26</option>
                               <option value="27">27</option>
                               <option value="28">28</option>
                               <option value="29">29</option>
                               <option value="30">30</option>
                               <option value="31">31</option>
                           </select>
                           <label for="startDay">일</label>
                           <span class="des">~</span>

                           <select id="endYear" title="년도를 선택하세요" width="70px">
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                            <option value="2015">2015</option>
                            <option value="2016">2016</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021" selected>2021</option>
                       </select>

                       <label for="endYear">년</label>

                       <select id="endMonth" title="월을 선택하세요" width="70px">
                           <option value="01">1</option>
                           <option value="02">2</option>
                           <option value="03">3</option>
                           <option value="04" selected>4</option>
                           <option value="05">5</option>
                           <option value="06">6</option>
                           <option value="07">7</option>
                           <option value="08">8</option>
                           <option value="09">9</option>
                           <option value="10">10</option>
                           <option value="11">11</option>
                           <option value="12">12</option>
                       </select>
                       <label for="endMonth">월</label>

                       <select id="endDay" title="일을 선택하세요" width="70px">
                           <option value="01">1</option>
                           <option value="02">2</option>
                           <option value="03">3</option>
                           <option value="04">4</option>
                           <option value="05">5</option>
                           <option value="06">6</option>
                           <option value="07">7</option>
                           <option value="08">8</option>
                           <option value="09">9</option>
                           <option value="10">10</option>
                           <option value="11">11</option>
                           <option value="12">12</option>
                           <option value="13">13</option>
                           <option value="14">14</option>
                           <option value="15">15</option>
                           <option value="16">16</option>
                           <option value="17">17</option>
                           <option value="18">18</option>
                           <option value="19">19</option>
                           <option value="20">20</option>
                           <option value="21">21</option>
                           <option value="22">22</option>
                           <option value="23">23</option>
                           <option value="24">24</option>
                           <option value="25">25</option>
                           <option value="26">26</option>
                           <option value="27">27</option>
                           <option value="28">28</option>
                           <option value="29">29</option>
                           <option value="30">30</option>
                           <option value="31">31</option>
                       </select>
                       <label for="endDay">일</label>
                       <button type="button" class="btn btn-dark btn-sm" id="btnLookup">조회</button>
                       </div>

                   </div>
               </fieldset>

               <br><br>

               <div class="outer">
                
                <table align="center" class="listArea" style="border-bottom: 1px solid black;">
                    <thead class="list">
                            <tr>
                                <th width="200" >주문일자</th>
                                <th width="300">상품</th>
                                <th width="70">수량</th>
                                <th width="100">주문금액</th>
                                <th width="100">상태</th>
                            </tr>
                    </thead>
                </table>




                <table>
                    <tbody>
                        <!-- 조회된 결과가 있을 경우 -->

                        <tr align="center">
                            <td width="200">
                                2021-xx-xx <br>
                                xxxxxxx <br>
                                <p><a href="">상세보기</a></p>
                            </td>
                            <td width="300">상품명</td>
                            <td width="70">1</td>
                            <td width="100">20,000</td>
                            <td width="100">
                                <div style="margin: 0; padding: 0;">예약확정
                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">즉시취소</button>
                            </td>

                        </tr>
                        
                        
                        
                        
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
                                  <div class="modal-body" align="center">
                                    여행당일에는 취소가 불가능합니다.
                                  </div>
                                  
                                  <!-- Modal footer -->
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
                                  </div>
                                  
                                </div>
                              </div>
                            </div>
                            
                        </div>
                    
                        <!-- 조회된 결과가 없을 경우-->
                        <!--
                        <tr>
                            <td colspan="6" align="center">조회된 리스트가 없습니다.</td>
                        </tr>
                        -->
        
                        
                    </tbody>
                </table>

                <br><br>
                
                </div>

            </div>

            
        </div>
    </div>


    </div>           
</body>
</html>