<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/faqEnrollForm.css">
<!-- common  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/product/css/productEnrollForm.css">
</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
    <div class="outer">

        <br>
        <h2>FAQ 등록</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>

        <div class="enrollForm">
                <form action="">
                    <table align="center" id="enrollTable">
                        <tr>
                            <th>구분</th>
                            <td colspan="2">
                                <select name="faqStatus" id="">
                                    <option value="place">관광지/레저</option>
                                    <option value="taste">맛집</option>
                                    <option value="coupon">쿠폰</option>
                                    <option value="cancle">취소/결제</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" size="93" placeholder="제목을 입력해주세요" required>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="" id="" cols="85" rows="30" style="resize:none;" placeholder="내용을 입력해주세요" ></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
        </div>

       
        <!-- 버튼 구역 -->
        <div class="bottomArea">

            <!-- 버튼 (목록으로) -->
            <div class="btn">
                <a href="" id="btn1">목록으로</a>
            </div> 
             <!-- 버튼 (등 록) -->
            <div class="btn">
                <a href="" id="btn2">등 록</a> 
            </div>   
			
		</div>

    </div>

</body>
</html>