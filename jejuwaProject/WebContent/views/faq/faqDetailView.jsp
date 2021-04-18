<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.faq.model.vo.Faq"%>
<%
	Faq f = (Faq)request.getAttribute("f");
%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/faq/faqDetailView.css">
</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
    <div class="outer">

        <br>
        <h2>FAQ 상세보기</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>

        <div id="detailForm" >
        	
                
            <table align="center" class="table table-bordered" id="detailArea"  align = "center" >
                <tr>
                    <th>구분</th>
                    <td colspan="2" style="height: 50px;"><%=f.getqCategory() %></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="2" style="height: 50px;"><%=f.getFaqTitle() %></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="2" style="height: 300px;"><%=f.getFaqContent() %></td>
                </tr>
            </table>
               
        </div>

       
        <!-- 버튼 구역 -->
        <div class="bottomArea" align="center">

            <!-- 버튼 (수정하기) -->
            <div class="btn">
                <a href="<%=contextPath %>/updateForm.fa?fno=<%=f.getFaqNo() %>" id="btn1" class = "btn btn-warning">수정하기</a>
            </div> 
             <!-- 버튼 (삭제하기) -->
            <div class="btn">
                <a href="" id="btn2" class = "btn btn-danger">삭제하기</a> 
            </div>   
			
		</div>

    </div>

</body>
</html>