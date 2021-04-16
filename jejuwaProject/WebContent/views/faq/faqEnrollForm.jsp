<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/faqEnrollForm.css">
</head>
<body>

    <div class="outer">
        <br>
        <h2>공지사항 등록</h2>
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