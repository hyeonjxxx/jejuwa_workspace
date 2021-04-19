<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productEnrollForm.css"> 
    
    <!-- modal icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">


</head>
<body>


	<%@ include file="../common/adminPageMenubar.jsp" %>

    <div class="outer">
        <br>
        <span class="title">상품등록</span>
        <div class="divisionLine"></div>
        <br>

        <!-- 상품등록 입력폼 -->
        <div class="pdfInfo">
            <form action="<%=request.getContextPath() %>/insert.pdt" method="POST" id="pdfEnrollForm" name="pdfEnrollForm">
               <table>
                    <tbody><tr>
                        <td width="120">*카테고리</td>
                        <td>
                            <select name="loaclCode" id="loaclCode">
                                <option value="JJ">제주</option>
                                <option value="AW">애월</option>
                                <option value="HL">한림/협재</option>
                                <option value="JM">중문</option>
                                <option value="SG">서귀포</option>
                                <option value="PS">표선</option>
                                <option value="SS">성산/우도</option>
                                <option value="DH">함덕/구좌</option>
                            </select>
                            <select name="themeCode" id="themeCode">
                                <option value="TR">투어</option>
                                <option value="TT">티켓</option>
                                <option value="AY">액티비티</option>
                                <option value="FD">맛집</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td style="color: red;"><span>*자동으로 부여됨</span></td>
                    </tr>                    
                    <tr>
                        <td>*상품명</td>
                        <td><input type="text" name="" id=""></td>
                    </tr>
                    <tr>
                        <td>*기본 이미지</td>
                        <td><input type="file" name="titleImg" id="titleImg"></td>
                    </tr>
                    <tr>
                        <td>세부 이미지1</td>
                        <td><input type="file" name="subImg1" id="subImg1"></td>
                    </tr>
                    <tr>
                        <td>세부 이미지2</td>
                        <td><input type="file" name="subImg2" id="subImg2"></td>
                    </tr>
                    <tr>
                        <td>세부 이미지3</td>
                        <td><input type="file" name="subImg3" id="subImg3"></td>
                    </tr>
                    <tr>
                        <td>*판매가</td>
                        <td><input type="text" style="width: 100px;">원</td>
                    </tr>
                    <tr>
                        <td>*수량</td>
                        <td><input type="number" style="width: 50px;">개</td>
                    </tr>
                    <tr>
                        <td>*상품상세 정보</td>
                        <td><input type="file" name="detailImg" id="detailImg"></td>
                    </tr>
                </tbody></table>
            </form>

        </div>
        <br><br>

        <!-- 버튼 -->
        <div align="right" class="btnArea">
            <div id="btnBack"><a href="">목록으로</a></div>
            <!-- Button to Open the Modal -->
            <button type="button" id="btnEnroll" data-toggle="modal" data-target="#myModal">등 록</button>
        </div>

        <!-- The Modal -->
        <div class="modal fade" id="myModal" align="center">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" >

                    <!-- Modal body -->
                    <br>
                    <div class="modal-body">
                    	상품을 등록하시겠습니까?
                    </div>
                    
                    <!-- Modal footer -->
                    <div id="modalFooter">
                        <button id="okBtn" class="btn btn-warning">OK</button>
                        <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
                    </div>
                </div>
            </div>
        </div>        

        
    </div>	

</body>
</html>