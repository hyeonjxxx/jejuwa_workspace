<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <!-- boardMenu css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common/customerBoardMenu.css">

    <!-- boardMenu fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

</head>
<body>
	<%@ include file = "../common/loginUserMenubar.jsp" %>

	<div class="board_menu">       
        <div class="board_menu_list">                 
            <h2 id="customer_center"><a>고객센터</a></h2>
            <ul>
                <li class="subMenu">
                    <a href="<%=request.getContextPath()%>/list.uno?currentPage=1">공지사항<span style="margin-left: 74px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <a href="<%=request.getContextPath() %>/list.rvl">리뷰내역<span style="margin-left: 74px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <a href="<%=request.getContextPath() %>/list.ufa">자주하는문의 FAQ<span style="margin-left: 13px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <% if(login == null){ %>
                    <a href="<%= request.getContextPath() %>/lgview.me" onclick="login();">1:1문의내역</a>
					<% } else{ %>
					<a href="<%=request.getContextPath() %>/list.umyq">1:1문의내역 <span style="margin-left: 50px;">〉</span></a>
					<%} %>
                </li>
            </ul>
  
	     </div>
    
<script>
	function login(){
		alert("로그인이 필요한 서비스입니다. 로그인해주세요.");
	}
</script>
</body>
</html>