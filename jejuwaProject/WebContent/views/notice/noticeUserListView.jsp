<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   , java.util.ArrayList
			   , com.kh.notice.model.vo.Notice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
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
<link rel="stylesheet" type="text/css" href="resources/css/notice/noticeUserListView.css">
</head>
<body>

	
	<%@ include file = "../common/customerMenubar.jsp" %>
	

	<div class="outer">
        <br><br>
        <h2>공지사항</h2>
        <br>
        
        <br>

        <div class="area1">

            
            <div align="right" class="searchArea">
               
                <span href="" >
                    <select name="noticeSearchCtg" id="noticeSearchCtg">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="titleContent">제목+내용</option>
                    </select>
                    <input id="keyword" type="text" onkeyup="enterkey();" placeholder="검색">
                </span>              
            </div>
            
        </div>

        <!-- 공지사항 리스트 테이블 -->
        <div class="listArea">
        
            <table align="center" id="memberList" class="table table-hover">
                <thead>
                    <tr>
                        <th width="90">번호</th>
                        <th width="350">제목</th>
                        <th width="90">조회수</th>
                        <th width="150">작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
                	<% if(list.isEmpty()){ %>
                		<tr>
	                		<td colspan="5">작성된 공지사항이 없습니다.</td>
	                	</tr>
	               	<% }else{%>
	               	<!-- 조회된 결과가 있을 경우 -->
	                    <% for(Notice n : list) {%>
		                    <tr>
		                        <td><%= n.getNoticeNo() %></td>
		                        <td><%= n.getNoticeTitle() %></td>
		                        <td><%= n.getNoticeCount() %></td>
		                        <td><%= n.getEnrollDate() %></td>
		                    </tr>
		                <% } %>
	                <% } %> 
                </tbody>
            </table>
            
            <script>
            	function enterkey(){
            		if(window.event.keyCode == 13){
	            		var searchCtg = $("#noticeSearchCtg option:selected").val();
	            		var keyword = $("#keyword").val();
	            		
	            		//console.log(searchCtg);
	            		//console.log(keyword);
	            		
            			$.ajax({
            				url:"searchAjax.no",
            				type:"get",
            				data:{searchCtg:searchCtg,
            					  keyword:keyword
            				}, success:function(list){
            					console.log(list);
            					
            					var result = "";
            					if(list.length == 0){
            						result = "<tr><td colspan='4'>조회된 공지사항이 없습니다.</td></tr>"
            					}
            					for(var i in list){
            						result += "<tr class='test4'>"
        						      	   +	"<td>" + list[i].noticeNo + "</td>"
        						           +	"<td>" + list[i].noticeTitle + "</td>"
        						           +	"<td>" + list[i].noticeCount + "</td>"
        						           +	"<td>" + list[i].enrollDate + "</td>"
        						           + "</tr>";
            					}
            					
            					// 아이디가 memberList인 테이블의 tbody영역안에 result 뿌리기
            					$("#memberList tbody").html(result);
            					$(".pagingArea").css("visibility", "hidden");
            					
            					$(function(){
            	            		$("#memberList>tbody>tr").click(function(){
            	            			location.href='<%=request.getContextPath()%>/detail.uno?nno=' + $(this).children().eq(0).text();
            	            		})
            	            	})
            					
            					
            				}, error:function(){
            					console.log("ajax통신 실패");
            				}
            			});
            		}
            	}
            </script>
            
            
            
            <script>
            	// 상세보기 요청
            	$(function(){
            		$("#memberList>tbody>tr").click(function(){
            			location.href='<%=request.getContextPath()%>/detail.uno?nno=' + $(this).children().eq(0).text();
            		})
            	})
            </script>

        </div>

       <br>
       
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea" align="center">

    
            <!-- 페이징  -->
            <div class="pagingArea">
            
            	<!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.uno?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.uno?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=request.getContextPath()%>/list.uno?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=request.getContextPath()%>/list.uno?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.uno?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
                	
            </div>

            <!-- 로그인 && 로그인한 사용자가 관리자인 경우 -->
            <!-- 
            <div align="right" class="btn">
                <a href="" id="btn2">등 록</a> 
            </div>
             --> 
			
		</div>

    </div>
    
    
    <%@ include file = "../common/footer.jsp" %>

</body>
</html>