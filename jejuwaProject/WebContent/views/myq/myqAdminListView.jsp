<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import = "java.util.ArrayList,
    		  com.kh.myq.model.vo.MYQ,
    		  com.kh.common.model.vo.PageInfo" %>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<MYQ> list = (ArrayList<MYQ>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/myq/myqAdminListView.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- myqAdminListView.js -->
<script src="<%= request.getContextPath() %>/resources/js/myq/myqAdminListView.js"></script>

</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>1:1문의 관리</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br>
        

        <div class="area1">

            
            <div align="right" class="searchArea">
               
                <span href="">
                    <select name="memberStatus" id="">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="titleContent">제목+내용</option>
                    </select>
                    <input type="text" placeholder="검색">
                </span>              
            </div>
        </div>

        <!-- 문의 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="40" ><input type="checkbox" id="checkAll"></th>
                        <th width="90">번호</th>
                        <th width="300">제목</th>
                        <th width="90">작성자</th>
                        <th width="90">작성일</th>
                        <th width="90">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
                	<% if( list.isEmpty() ){ %>
	                	<tr>
	                		<td colspan="6">작성된 문의사항이 없습니다.</td>
	                	</tr>
	                <% }else{ %>
	                	<% for(MYQ q : list){ %>
	                    <tr>
	                    	<td><input id="choice_myq" type="checkbox"></td>
	                        <td class="ch2"><%= q.getMyq_no() %></td>
	                        <td class="ch2">
								<% if( q.getP_code() == null){%>
	                        		<%= q.getMyq_title() %>
	                        	<% } else { %>
	                        		<span style="color:red; border: 0px;">[<%= q.getP_code() %>]</span>
	                        		<%= q.getMyq_title() %>
	                        	<% } %>
	                        </td>
	                        <td class="ch2"><%= q.getMem_id() %></td>
	                        <td class="ch2"><%= q.getMyq_enroll_date() %>
	                        	
	                        </td>
	                        <td class="ch2">
								<% if( q.getMyq_ans_date() == null){%>
	                        		미답변
	                        	<%}else{ %>
	                        		답변
	                        	<% } %>
							</td>
	                    </tr>
	                    <% }} %>
                </tbody>
            </table>
            
            	<script>
				// 상세보기 요청
				$("#memberList>tbody>tr").click(function(){
		                location.href='<%=request.getContextPath()%>/detail.amyq?mno='+$(this).children().eq(1).text();
		                // /detail.amyq?mno=글번호
		                // #memberList>tbody>tr 여기 tr의 자손들 중에 2번째(=eq(1))의 text를 가져오겠다. 
		            })
			</script>
		
        </div>

                   <!-- 관리자 게시글 권한 -->
            <div style="display: block; text-align: right;" class="btn">
                <button id="btn1">선택삭제</button>
                <button id="btn2" style="margin-left:30px; margin-right:40px;
			">등 록</button> 
            </div>     
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea">

            <!-- 페이징  -->
            <div align="center" class="pagingArea">
                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.amyq?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.amyq?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=request.getContextPath()%>/list.amyq?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=request.getContextPath()%>/list.amyq?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.amyq?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
             </div>
		</div>
    </div>


</body>
</html>