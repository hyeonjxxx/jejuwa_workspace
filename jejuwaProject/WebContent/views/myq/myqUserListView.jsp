<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList,
    		  com.kh.myq.model.vo.MYQ,
    		  com.kh.common.model.vo.PageInfo"%> 
    
    
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
	<input type:hidden name="memId" value="<%=login.getMemId() %>" >
	<div class="outer">
        <input type="hidden" id="is_mobile_auth" value="F">
        <br><br>
        <h2>1:1 문의</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>
        

            
        </div>

        <!-- 1:1문의 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="40" ><input type="checkbox" id="checkAll"></th>
                        <th width="90">번호</th>
                        <th width="300">제목</th>
                        <th width="90">작성일</th>
                        <th width="90">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
                	<% if( list.isEmpty() ){ %>
	                	<tr>
	                		<td colspan="5">작성된 문의사항이 없습니다.</td>
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
            <div class="write_btn">
                <button type=button style=" text-align: right;" >글작성</button>        
            </div>=
        </div>
	</div>
    <br><br>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>