<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.like.model.vo.*"%>
<%
	Like l = (Like)request.getAttribute("l");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = ../common/loginUserMenubar.jsp %>
	
	<!-- 상품 상세 페이지에 ajax 가능하면 적용해보기 -->
		<!-- 로그인전 -->
		
		<!-- 로그인후 -->
		
		<script>
			$(function(){
				insertLike();
			})
			
			// 좋아요 버튼 눌렀을 때
			function insertLike(){
				$.ajax({
					url : "<%=contextPath%>/insert.li",
					// 가지고 오는건 상품코드
					data : {pcode : <%= l.getpCode()%>}
					success:function(){
						
					}, error:function(){
						
					}
				})
			}
		</script>
	
</body>
</html>