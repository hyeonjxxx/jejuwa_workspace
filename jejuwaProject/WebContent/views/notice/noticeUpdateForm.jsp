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
    <link rel="stylesheet" type="text/css" href="resources/css/notice/noticeUpdateForm.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
	
    <div class="outer">
        <br>
        <h2>공지사항 수정</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>

        <div class="enrollForm">
                <form action="<%=contextPath%>/update.no" id="updateForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
                    <table align="center" id="enrollTable">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" size="72" placeholder="제목을 입력해주세요" required value="<%= n.getNoticeTitle() %>">
                            </td>
                        </tr>
                        <tr>
                            <th>파일첨부</th>
                            <td colspan="2">
                            	<% if(n.getOriginFileName() != null) {%>
                            		<%= n.getOriginFileName() %>
                            		<!-- 기존에 첨부파일이 있는데 새로운 파일을 업로드 한 경우 -->
                            		<!-- 공지사항 테이블 안에 첨부파일 관리하므로 첨부파일 번호 넘기는 단계는 생략 -->
                            		<!-- 기존에 업로드된 파일 불필요하니 삭제(FilePath 넘기는 게 맞나..?) -->
                            		<%--<input type="hidden" name="originFileName" value="<%=n.getOriginFileName()%>">--%>
                            		<input type="hidden" name="originFilePath" value="<%=n.getFilePath()%>">
                            	<% } %>
                                <input type="file" name="reUpfile">
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="content" id="" cols="75" rows="20" style="resize:none;" placeholder="내용을 입력해주세요"><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                    </table>
                        <div class="bottomArea">
				            <div class="btn">
				                <a href="" id="btn1">삭 제</a>
				            </div> 
				            
				            <div class="btn">
				                <a href="<%=contextPath%>/list.no?currentPage=1"" id="btn2">목록으로</a>
				            </div> 
				            
				            <div class="btn">
				            	<!-- a태그로 하면 submit이 불가능하네,,, -->
				                <button type="submit" id="btn3">수 정</button> 
				            </div>   
				        </div>
                </form>
                <br>
        </div>


    </div>
	
</body>
</html>