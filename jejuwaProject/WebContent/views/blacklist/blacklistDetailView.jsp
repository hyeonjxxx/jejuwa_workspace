<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.blacklist.model.vo.Blacklist
                 , java.sql.Date
                 , com.kh.report.model.vo.Report
                 , java.util.ArrayList"
%>
<%
	Blacklist b = (Blacklist)request.getAttribute("b");
	int blacklistNo = b.getBlacklistNo();
	int memNo = b.getMemNo();
	String memId = b.getMemId();
	String memName = b.getMemName();
	Date restrictDate = b.getRestrictDate();
	int reportedCount = b.getReportedCount();
	
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="resources/css/blacklist/blacklistDetailView.css">
</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
	<div class="outer">
        <br>
        <h2>블랙리스트 상세정보</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br>
        

        
        <!-- 회원 상세정보 -->
        <div class="viewArea">
            <div>
                <table id="infoTable" border="1" align="center">
                    <tr>
                        <th width="160">&nbsp;&nbsp;아이디</th>
                        <td width="350"><%= memId %></td>
                        
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><%= memName %></td>
                        
                    </tr>
                    <tr>
                        <th>활동중지일</th>
                        <td><%= restrictDate %></td>
                        
                    </tr>
                    <tr>
                        <th>누적신고수</th>
                        <td>
                            <%= reportedCount %>
                        </td>                  
                </table>
            </div>

            <br><br>

            <!-- <div id="history" align="right">history</div> -->

            <div>
                <table id="reasonTable"  align="center">
                <!-- 조회된 결과가 없을 경우 -->
                <% if(list.isEmpty()){ %>
                	<tr>
                		<td colspan="2">조회된 신고 내역이 없습니다.</td>
                	</tr>
                <% } else{%>
                	<!-- 조회된 결과가 있을 경우 -->
                	<% for(Report r : list) { %>		
                    <tr>
                        <td width="160"><%= r.getReportDate() %></td>
                        <td width="350"><%= r.getReportReason() %></td>                        
                    </tr>
                    <% } %>
                <% } %>
                </table>
            </div>
                <br><br>

            <div class="bottomArea">
    
                <!-- 버튼 (블랙리스트 해제) -->
                <div align="right" class="btn" >
                    <a href="" id="btn1"  data-toggle="modal" data-target="#unblacklist">블랙리스트 해제</a>
                </div> 
                <!-- 버튼 (목록으로) -->
                <div class="btn">
                    <a href="<%=contextPath%>/list.bl?currentPage=1" id="btn2">목록으로</a>
                </div> 
                
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
                        <input name="memNo" type="hidden" value="<%=memNo%>">
                        <input name="memId" type="hidden" value="<%=memId%>">
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

</body>
</html>