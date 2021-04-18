<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.faq.model.vo.Faq"%>
<%
	Faq f = (Faq)request.getAttribute("f");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리자 수정하기</title>

<!-- common  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/faq/faqUpdateView.css">
</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
    <div class="outer">

        <br>
        <h2>FAQ 수정하기</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>

        <form id="updateForm" action ="<%=contextPath%>/update.fa" method = "post">
        <input type = "hidden" name = "fno" value = "<%=f.getFaqNo() %>">
        	
                
            <table align="center" class="table table-bordered" id="detailArea">
                <tr>
                    <th>구분</th>
                    <td colspan="2" style="height: 50px;">
                    	<select name = "category">
                    		<option value = "관광지/레저">관광지/레저 </option>
                            <option value= "맛집">맛집</option>
                            <option value = "쿠폰">쿠폰</option>
                            <option value = "취소/결제">취소/결제</option>
                    	</select>

                        <script>
                            $(function(){
                                $("#updateForm option").each(function(){
                                    if($(this).text() == "<%=f.getqCategory()%>"){
                                        $(this).attr("selected", true);
                                    }
                                })
                            })
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="<%= f.getFaqTitle() %>" style="width: 100%;" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" rows="10" style="resize:none; width: 100%;" required><%= f.getFaqContent() %></textarea></td>
                </tr>
            </table>
            
            <br><br>
            
	        <div class="bottomArea" align="center">
				<button type = "submit">수정하기</button>
				<button type ="button" onclick = "history.back();">뒤로가기</button>
	        </div>
        </form>
    </div>

</body>
</html>