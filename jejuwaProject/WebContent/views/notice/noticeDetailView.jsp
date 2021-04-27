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
            <a href="<%=contextPath%>/updateForm.no?nno=<%= n.getNoticeNo() %>">수 정</a>
            <a href="" data-toggle="modal" data-target="#deleteNotice">삭 제</a>
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
                <a id="btn3" href="<%=contextPath%>/list.no?currentPage=1">목록으로</a> 
            </div>               
        </div>

    </div>
    
           <!-- 비밀번호 초기화 모달 -->
       <!-- The Modal -->
       <div class="modal fade" id="deleteNotice" align="center" >
         <div class="modal-dialog modal-dialog-centered">
           <div class="modal-content" >
           
                             
             <!-- Modal body -->
             <br>
             <div class="modal-body">
               	공지사항을 삭제하시겠습니까?
             </div>
             
             <form action="<%=contextPath%>/delete.no?nno=<%=n.getNoticeNo()%>" method="post">        
             <div class="input-group mb-3" id="modalContent">
               <div class="input-group-prepend">
                 <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
               </div>
               <input name="adminPwd" size="25" type="password" placeholder=" 관리자 비밀번호" aria-label="관리자 비밀번호" aria-describedby="basic-addon1">
                              
             </div>
             
             <!-- Modal footer -->
             <div id="modalFooter">
               <button type="submit" id="okBtn1" class="btn btn-warning" onclick="return deleteNotice();">OK</button>
               <button type="button" id="cancleBtn1" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
             </div>
             
             <script>
	       			function deleteNotice(){
	       				if($("input[name=adminPwd]").val() != <%= loginUser.getMemPwd()%>){
	       					alert("관리자 비밀번호가 일치하지 않습니다.");
	       					return false;
	       				}
	       			}
	       	</script>
	       		
             </form> 
           </div>
         </div>
       </div>
    
</body>
</html>