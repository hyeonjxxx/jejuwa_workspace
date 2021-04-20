<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="resources/css/notice/noticeDetailView.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>공지사항 상세보기</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>
        <div class="btn3" align="right">
            <a href="">수 정</a> <a href="">삭 제</a>
        </div>
        <div class="noticeArea">
            <div class="title">
                <div><b><%= n.getNoticeTitle() %></b></div>
                <br>
                <div>제주와 <%= n.getEnrollDate() %> </div>
            </div>            
            <div class="NoticeContent">
            	<p>
                	<%= n.getNoticeContent() %>
                </p>
            </div>
			
			<!-- 첨부파일 부분 확인 및 수정 필요!! -->
            <!-- 첨부파일이 있을 경우 -->
            <div id="fileArea">
            <% if(n.getOriginFileName() == null){%>
            	첨부파일 없음
            <% } else {%>
               	첨부파일 <a href="<%=contextPath%>/<%=n.getFilePath()%>"><%= n.getOriginFileName() %></a>
            <% } %>
            </div>

        </div>


        <div class="bottomArea">            
            
            
            <div class="btn btn2" align="right">
                <a id="btn3" onclick="history.back();">목록으로</a> 
            </div>               

        </div>

    </div>
</body>
</html>