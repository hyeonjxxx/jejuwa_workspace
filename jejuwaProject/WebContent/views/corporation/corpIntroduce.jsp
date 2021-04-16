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
    <style>
    
    </style>

</head>
<body>

	<%@ include file="../common/managerMenubar.jsp" %>
	
    
	<div class="introduce_wrap">
        <br>
        <br>
        <img src="<%= contextPath %>/resources/images/jejuwa_icon.png">
        
        <img src="<%= contextPath %>/resources/images/corpIntroduce_img.png"style="width:1000px;">
        <img src="">
        <br><br>
        <div style="color:#gray; font-size:17px; margin:50px;">
            <span>제주도 여행자를 위한 간결하고 직관적인 플랫폼으로 사용자들에게 필요한 서비스를 제공합니다.</span><br>
            <span>함께 여행 준비, 현지 경험(투어, 티켓, 특가여행, 패키지) 등 모든 여행 경험을 연결하여 새로운 여행방식을 만들어갑니다.</span>
        </div>
        <br><br><br><br><br>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>