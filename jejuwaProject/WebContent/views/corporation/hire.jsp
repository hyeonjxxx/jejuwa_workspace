<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%@ include file="../common/managerMenubar.jsp" %>
	
    
	<div class="hire_wrap">
        <br>
        <br>
        <p style="font-weight: 1000;
        color:orange;
        font-size: 50px;
        text-align: center;" >Work with us!</p>
        
        <img src="<%= contextPath %>/resources/images/HireMain.png" style="width:700px; height:500px; display: block; margin: 0px auto;">
        <br>
        <img src="<%= contextPath %>/resources/images/BusinessCard.png" style="width:400px; display: block; margin: 0px auto;">
        <br>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>