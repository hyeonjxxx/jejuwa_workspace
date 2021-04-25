<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   , java.util.ArrayList
			   , com.kh.blacklist.model.vo.Blacklist" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Blacklist> list = (ArrayList<Blacklist>)request.getAttribute("list");
	
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
<link rel="stylesheet" type="text/css" href="resources/css/blacklist/blacklistListView.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>블랙리스트 관리</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br>
        

        <div class="area1">

            
            <div class="searchArea">

                <div align="right" class="searchArea" >
                    <span href="" >
                        <select name="memberStatus" id="">
                            <option value="active">아이디</option>
                            <option value="dormant">이름</option>
                            <option value="dormant">전화번호</option>
                        </select>
                        <input type="text" style="width: 200px;"placeholder="검색">
                    </span>              
                </div>
            </div>
        </div>
        
        <!-- 블랙 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="30" ><input type="checkbox"></th>
                        <th width="200">아이디</th>
                        <th width="120">이름</th>
                        <th width="220">활동중지일</th>
                        <th width="120">누적 신고수</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
                	<% if(list.isEmpty()){ %>
                		<tr>
                			<td colspan="5">조회된 회원이 없습니다.</td>
                		</tr>
                	<% } else{%>
                	<!-- 조회된 결과가 있을 경우 -->
                		<% for(Blacklist b : list) { %>
		                    <tr>
		                        <td><input type="checkbox"></td>
		                        <td><%= b.getMemId() %></td>
		                        <td><%= b.getMemName() %></td>
		                        <td><%= b.getRestrictDate() %></td>
		                        <td><%= b.getReportedCount() %></td>
		                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
            
            <script>
            	// 상세보기 요청
            	$(function(){
            		$("#memberList>tbody>tr").click(function(){
            			location.href='<%=contextPath%>/detail.bl?memId=' + $(this).children().eq(1).text();
            		})
            	})
            
            </script>
            
            

        </div>

       
                <!-- 버튼, 페이징 구역 -->
                <div class="bottomArea">

                    <!-- 버튼 (선택삭제) -->
                    <div align="right" class="btn" >
                        <a href="" id="btn1"  data-toggle="modal" data-target="#unblacklist">블랙리스트 해제</a>
                    </div>                
                    
            
                    <!-- 페이징  -->
                    <div align="center" class="pagingArea">
                                
                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
	                    <% if(currentPage == 1) {%>
	                    	<button disabled>&laquo;</button>
		                    <button disabled>&lt;</button>
	                    <%} else {%>
		                    <button onclick="location.href='<%=contextPath%>/list.bl?currentPage=1';">&laquo;</button>
		                    <button onclick="location.href='<%=contextPath%>/list.bl?currentPage=<%=currentPage-1%>';">&lt;</button>			
						<% } %>
						
						<% for(int p=startPage; p<=endPage; p++ ) {%>
						
							<% if(currentPage == p) {%>
	                        	<button disabled><%= p %></button>
	                        <% }else{ %>				
		                        <button onclick="location.href='<%=contextPath%>/list.bl?currentPage=<%= p %>';"><%= p %></button>
	                        <% } %>		
	                	<% } %>
	                	
	                <!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
	                	<% if(currentPage == maxPage){ %>
	                		<button disabled>&gt;</button>
		                    <button disabled>&raquo;</button>
	                	<% } else{ %>
	                		<button onclick="location.href='<%=contextPath%>/list.bl?currentPage=<%=currentPage+1%>';">&gt;</button>
		                    <button onclick="location.href='<%=contextPath%>/list.bl?currentPage=<%=maxPage%>';">&raquo;</button>
	                	<% } %>
        
                     </div>
        
                     <!-- 버튼 (등록) -->
                    <div align="right" class="btn">
                        <a href="" id="btn2" data-toggle="modal" data-target="#enrollBlacklist">블랙리스트 등록</a> 
                    </div>   

                    
                </div>
    </div>


     <!-- 블랙리스트 해제 모달 -->
        <!-- The Modal -->
        <div class="modal fade" id="unblacklist" align="center" >
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">     

                    <!-- Modal body -->
                    <br>
                    <div class="modal-body" >
                        	블랙리스트를 해제하시겠습니까?
                    </div>
                    
                    <form action="<%= contextPath %>/remove.bl" method="post">
                    <div id="ubModalContent" class="input-group mb-3">
                        <div class="input-group-prepend">
                        <span class="input-group-text" >
                            <i class="bi bi-key"></i>
                        </span>
                        </div>
                        <input name="adminPwd" size="25" type="password" placeholder=" 관리자 비밀번호">
                        <input name="memNo" type="hidden" value="">  <!-- 선택된 행의 id를 넘겨야함 -->
                        <input name="memId" type="hidden" value="">  <!-- 필요한가..?(디테일뷰에서는필요했음) -->
                    </div>

                    <!-- Modal footer -->
                    <div id="ubModalFooter">
                        <button type="submit" id="okBtn" class="btn btn-warning" onclick="return removeBlacklist();">OK</button>
                        <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
                    </div>
                    
                    <script>
                    	function removeBlacklist(){
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



    <!-- 블랙리스트 등록 모달 -->
    <!-- The Modal -->
    <div class="modal fade" id="enrollBlacklist" align="center" >
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content2">     


                <!-- Modal Header -->
                <div class="modal-header" id="modal-header">
                    <h4 class="modal-title">블랙리스트 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>


                <!-- Modal body -->
                
                <div class="modal-body" id="modal-body">
                    <table>
                        <tr>
                            <th width="100px">아이디</th>
                            <td colspan="2">user05</td>
                        </tr>
                        <tr>
                            <th>사유</th>
                            <td width="130x" style="border-right-color: white;"><input type="checkbox"> 욕설/비방</td>
                            <td width="130px"><input type="checkbox"> 게시글도배</td>
                        </tr>
                        <tr>
                            <th>처리날짜</th>
                            <td colspan="2">2021.03.27</td>
                        </tr>
                    </table>
                </div>
                

                <!-- Modal footer -->
                <div id="modalFooter">
                    <button id="okBtn" class="btn btn-warning">등 록</button>
                    <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취 소</button>
                </div>
            </div>
        </div>
    </div>
	
</body>
</html>