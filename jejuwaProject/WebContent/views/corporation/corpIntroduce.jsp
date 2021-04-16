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
        <img src="<%= contextPath %>/resources/images/jejuwa_icon.png">
        
        <img src="<%= contextPath %>/resources/images/corpIntroduce_img.png"style="width:1000px;">
        <img src="">
        <br><br><br><br>
        <span style="color:#777; font-size:20px; text-align: center; margin:50px;">제주도 여행자를 위한 간결하고 직관적인 플랫폼으로 사용자들에게 필요한 서비스 제공과 함께 여행 준비, 현지 경험(투어, 티켓, 특가여행, 패키지) 등 모든 여행 경험을 연결하여 새로운 여행방식을 만들어갑니다.</span>
        <br><br><br><br><br>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>