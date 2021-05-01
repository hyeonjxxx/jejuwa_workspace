<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.myq.model.vo.MYQ
			   , com.kh.common.model.vo.Attachment" %>
<%
	MYQ q = (MYQ)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/myq/myqUserDetailView.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- myqAdminListView.js -->
</head>
<body>

	<%@ include file="../common/customerMenubar.jsp" %>

    <script>
        var msg = "<%= session.getAttribute("alertMsg") %>"; // 알람창으로 출력할 메세지
		// var msg = "메세지"   / "null";
		
		if(msg != "null"){
			alert(msg);
			// session에 한 번 담아둔 건 내가 지우기 전 까지 계속 남아있다 (메뉴바 포함된 매 페이지가 열릴때마다 alert 계속 뜰 것)
			// 알람창 띄워준 후에 session에 담긴 메세지 지워야함!!
			<% session.removeAttribute("alertMsg");%>
		}
    </script>
	<input type="hidden" name="getMyq_no" value ="<%= q.getMyq_no() %>" id="getMyq_no">
	<div class="outer">
        <br>
        <h2>1:1 문의 상세보기</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>
        <div class="btn3" align="right"></div>
        <div class="noticeArea">
            <div class="title">
                <div>
                <% if( q.getP_code() == null){%>
                	<b> 제목 : <%= q.getMyq_title() %><b>
                <% } else { %>
                	<b> 
	                	제목 : <span style="color:red; border: 0px;">[<%= q.getP_code() %>]</span>
	                	<%= q.getMyq_title() %>
	                </b>
                <% } %>
                </div>
                <br>
                <div> 이름 : <%= q.getMem_name() %> </div>
                <div> 아아디 : <%= q.getMem_id() %> </div>
                <div> 작성일 : <%= q.getMyq_enroll_date() %> </div>
            </div>            
            <div class="NoticeContent">
            	<p>
                	<%= q.getMyq_content() %>
                </p>
            </div>
           </div>
            
            <div class="ansArea">
            <div class="title">
                <% if ( q.getMyq_ans_content() == null){ %>
	                <div><b> 답변</b></div>
	                <br>
	                <div></div>
	                <div> 답변일 : </div> 
            <div class="AnsContent">
            	<p style="color:green;">
                	아직 답변되지 않았습니다. 조금만 기다려주세요 :)
                </p>
            </div>
                <% } else{ %>
	                <div><b> 답변</b></div>
	                <br>
	                <div>제주와 관리자</div>
	                <div> 답변일 : <%= q.getMyq_ans_date() %> </div> 
            <div class="AnsContent">
            	<p>
                	<%= q.getMyq_ans_content() %>
                </p>
            </div>
            <% } %>
            </div>
			
            <!-- 첨부파일이 있을 경우 -->
		 <div id="fileArea">
			<% if( at == null){%>
            	<b>첨부파일 없음</b>
            <% } else {%>
               	첨부파일 <a href="<%=contextPath%>/<%=at.getFilePath()%>/<%= at.getMdfFileName() %>"><%=at.getOrgFileName() %></a>
            <%} %>
            </div>

        </div>


        <div class="bottomArea">            
            
            
            <div class="btn btn2" align="right">
                <a id="btn4" href="<%=contextPath%>/list.umyq?currentPage=1">목록으로</a> 
            </div>               
        </div>
    </div>
        <%@ include file="../common/footer.jsp" %>
</body>
</html>