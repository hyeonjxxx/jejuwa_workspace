<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
    
<%
/*
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
*/
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- myqUserListView css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myq/myqUserListView.css">

    <!-- myqUserListView js-->
    <link rel="stylesheet" href="">

    <!-- board fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>
	<%@ include file="../common/customerMenubar.jsp" %>
	
	<div class="outer">
        <br><br>
        <h2>1:1 문의</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>
        

        <div class="area1">

            
            <div align="right" class="searchArea">
                <span href="" >
                    <select name="memberStatus" id="">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="titleContent">제목+내용</option>
                    </select>
                    <input type="text" placeholder="검색">
                </span>              
            </div>
            
        </div>

        <!-- 공지사항 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="90">번호</th>
                        <th width="350">제목</th>
                        <th width="90">답변여부</th>
                        <th width="150">작성일</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

       
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea" align="center">

    
            <!-- 페이징  -->
            <div class="pagingArea">
            
            	<!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->

                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			

	                    <button onclick="">&laquo;</button>
	                    <button onclick="">&lt;</button>			

            <!-- 로그인 && 로그인한 사용자가 관리자인 경우 -->
            <!-- 
            <div align="right" class="btn">
                <a href="" id="btn2">등 록</a> 
            </div>
             --> 
			
		</div>

    </div>
</div>
    <br><br>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>