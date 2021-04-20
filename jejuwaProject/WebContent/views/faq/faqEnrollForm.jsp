<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리자 등록페이지</title>
<!-- common  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/faq/faqEnrollForm.css">
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
                <form action="<%=contextPath%>/insert.fa" method = "post">
                    <table align="center" id="enrollTable" align = "center" border = "1">
                        <tr>
                            <th>구분</th>
                            <td colspan="2">
                                <select name="category" id="">
                                    <option value="관광지/레저">관광지/레저</option>
                                    <option value="맛집">맛집</option>
                                    <option value="쿠폰">쿠폰</option>
                                    <option value="취소/결제">취소/결제</option>
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
                                <textarea style = "width: 100%;" name="content" cols="85" rows="30" style="resize:none;" placeholder="내용을 입력해주세요" ></textarea>
                            </td>
                        </tr>
                    </table>
		            <div class="btn">
		                <button type = "submit">작성하기</button>
		                <button type = "reset">취소하기</button> 
		            </div> 
                </form>
        </div>

    </div>

</body>
</html>