<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   , java.util.ArrayList
			   , com.kh.member.model.vo.Member" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");

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
<link rel="stylesheet" type="text/css" href="resources/css/member/memberListView.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>

	<div class="outer">
        <br>
        <h2>회원현황</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br>
        

        <div class="searchArea">

            <div align="right" class="searchArea" >
                <span href="">
                    <select name="memberStatus" id="Status" onchange="statusList();">
                        <option value="active">활동회원</option>
                        <option value="dormant">관리자</option>
                	</select>
                </span>
                <span href="" >
                    <select name="memberStatus" id="memberSearchCtg">
                        <option value="memId">아이디</option>
                        <option value="memName">이름</option>
                        <option value="phone">전화번호</option>
                    </select>
                    <input id="keyword" type="text" style="width: 200px;" onkeyup="enterkey();" placeholder="검색">
                </span>              
            </div>
        </div>
        
        <!-- 회원현황 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="100">회원번호</th>
                        <th width="100">아이디</th>
                        <th width="70">이름</th>
                        <th width="200">이메일</th>
                        <th width="150">전화번호</th>
                        <th width="100">가입일</th>
                    </tr>
                </thead>
                <tbody>
	                <!-- 조회된 결과가 없을 경우 -->
		                <% if(list.isEmpty()){ %>
		                	<tr>
		                		<td colspan="6">조회된 회원이 없습니다.</td>
		                	</tr>
		                <% }else{%>
		                <!-- 조회된 결과가 있을 경우 -->
			                <% for(Member m : list) {%>
			                <tr>
			                        <td><%= m.getMemNo() %></td>
			                        <td><%= m.getMemId()%></td>
			                        <td><%= m.getMemName() %></td>
			                        <td><%= (m.getEmail() == null) ? "" : m.getEmail() %></td>
			                        <td><%= m.getPhone() %></td>
			                        <td><%= m.getEnrollDate()%></td>
			                    </tr>
			                <% } %>
	                	<% } %>   
                </tbody>
            </table>
            
            <!-- 멤버 활동회원/관리자/탈퇴회원 나눠보기 기능 중 -->
            <script>
            	function statusList(){
            		location.href="<%=contextPath%>"
            	}
            </script>
            
            
            
            <script>
            	function enterkey(){
            		if(window.event.keyCode == 13){
	            		var searchCtg = $("#memberSearchCtg option:selected").val();
	            		var keyword = $("#keyword").val();
	            		
	            		//console.log(searchCtg);
	            		//console.log(keyword);
	            		
            			$.ajax({
            				url:"searchAjax.me",
            				type:"get",
            				data:{searchCtg:searchCtg,
            					  keyword:keyword
            				}, success:function(list){
            					console.log(list);
            					
            					
            					var result = "";
            					if(list.length == 0){
            						result = "<tr><td colspan='6'>조회된 회원이 없습니다.</td></tr>"
            					}
            					for(var i in list){
            						
            						result += "<tr class='test4'>"
        						      	   +	"<td>" + list[i].memNo + "</td>"
        						           +	"<td>" + list[i].memId + "</td>"
        						           +	"<td>" + list[i].memName + "</td>"
        						           +	"<td>" + list[i].email + "</td>"
        						           +	"<td>" + list[i].phone + "</td>"
        						           +	"<td>" + list[i].enrollDate + "</td>"
        						           + "</tr>";
            					}
            					
            					// 아이디가 memberList인 테이블의 tbody영역안에 result 뿌리기
            					$("#memberList tbody").html(result);
            					$(".pagingArea").css("visibility", "hidden");
            					
            					$(function(){
            	            		$("#memberList>tbody>tr").click(function(){
            	            			location.href='<%=contextPath%>/detail.me?mno=' + $(this).children().eq(0).text();
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
            			location.href='<%=contextPath%>/detail.me?mno=' + $(this).children().eq(0).text();
            		})
            	})
            
            </script>

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
	                    <button onclick="location.href='<%=contextPath%>/list.me?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.me?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
                	
            </div>
			
		</div>
			
		
    </div>

</body>
</html>