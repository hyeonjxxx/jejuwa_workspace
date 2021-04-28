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
<link rel="stylesheet" type="text/css" href="resources/css/notice/noticeListView.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>공지사항 관리</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br>
        

        <div class="area1">

            
            <div align="right" class="searchArea">
               
                <span href="">
                    <select id="noticeSearchCtg" name="noticeSearchCtg">
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
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="40" ><input type="checkbox" name="selectall" onclick="selectAll(this);"></th>
                        <th width="90">번호</th>
                        <th width="320">제목</th>
                        <th width="90">조회수</th>
                        <th width="140">작성일</th>
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
		                        <td><input type="checkbox" name="selectOne" onclick='checkSelectAll()'></td>
		                        <td class="ch2"><%= n.getNoticeNo() %></td>
		                        <td class="ch2"><%= n.getNoticeTitle() %></td>
		                        <td class="ch2"><%= n.getNoticeCount() %></td>
		                        <td class="ch2"><%= n.getEnrollDate() %></td>
		                    </tr>
		                <% } %>
	                <% } %>   
                </tbody>
            </table>
            
            <!-- AJax 키워드 검색 기능(카테고리 : 제목, 내용, 제목+내용) -->
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
            						result = "<tr><td colspan='5'>조회된 공지사항이 없습니다.</td></tr>"
            					}
            					for(var i in list){
            						result += "<tr>"
        						       	   + 	"<td><input id='test3' type='checkbox'></td>"
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
            	            			location.href='<%=contextPath%>/detail.no?nno=' + $(this).children().eq(1).text();
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
            			location.href='<%=contextPath%>/detail.no?nno=' + $(this).children().eq(1).text();
            		})
            	})
            	
            	
            	// 체크박스 1(낱개로 모두 체크하는 경우 전체 체크 박스 true, 하나라도 체크해제된 경우 전체 체크 박스 false)
       			function checkSelectAll()  {
       			  // 전체 체크박스
       			  const checkboxes 
       			    = document.querySelectorAll('input[name="selectOne"]');
       			  // 선택된 체크박스
       			  const checked 
       			    = document.querySelectorAll('input[name="selectOne"]:checked');
       			  // select all 체크박스
       			  const selectAll 
       			    = document.querySelector('input[name="selectall"]');
       			  
       			  if(checkboxes.length === checked.length)  {
       			    selectAll.checked = true;
       			  }else {
       			    selectAll.checked = false;
       			  }

       			}

            	// 체크박스 전체 체크, 전체 해제
       			function selectAll(selectAll)  {
       			  const checkboxes 
       			     = document.getElementsByName('selectOne');
       			  
       			  checkboxes.forEach((checkbox) => {
       			    checkbox.checked = selectAll.checked
       			  })
       			}
            	
             </script>  	
             
             

        </div>

       
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea">

            <!-- 로그인 && 로그인한 사용자가 글 작성자인 경우 -->
            <div align="right" class="btn noticeListbtn">
                <a href="" id="btn1">선택삭제</a>
            </div>                
            
    
            <!-- 페이징  -->
            <div align="center" class="pagingArea">
                    
                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=contextPath%>/list.no?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
             </div>

            <!-- 로그인 && 로그인한 사용자가 글 작성자인 경우 -->
            <div align="right" class="btn noticeListbtn">
                <a href="<%= contextPath %>/enrollForm.no" id="btn2">등 록</a> 
            </div>   
			
		</div>

    </div>
</body>
</html>