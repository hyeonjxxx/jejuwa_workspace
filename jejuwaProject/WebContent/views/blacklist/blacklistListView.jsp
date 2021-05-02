<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   , java.util.ArrayList
			   , com.kh.blacklist.model.vo.Blacklist
			   , java.text.SimpleDateFormat
			   , java.util.Date" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Blacklist> list = (ArrayList<Blacklist>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format (new Date());

	
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
                        <select name="memberSearchCtg" id="memberSearchCtg">
                            <option value="memId">아이디</option>
                            <option value="memName">이름</option>
                        </select>
                        <input id="keyword" type="text" style="width: 200px;" onkeyup="enterkey();" placeholder="검색">
                    </span>              
                </div>
            </div>
        </div>
        
        <!-- 블랙 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="30" ><input type="checkbox" name="selectall" onclick="selectAll(this);"></th>
                        <th width="230">아이디</th>
                        <th width="150">이름</th>
                        <th width="250">활동중지일</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
                	<% if(list.isEmpty()){ %>
                		<tr>
                			<td colspan="4">조회된 회원이 없습니다.</td>
                		</tr>
                	<% } else{%>
                	<!-- 조회된 결과가 있을 경우 -->
                		<% for(Blacklist b : list) { %>
		                    <tr>
		                        <td><input type="checkbox" id="selectOne" name="selectOne" onclick='checkSelectAll()'></td>
		                        <td><%= b.getMemId() %></td>
		                        <td><%= b.getMemName() %></td>
		                        <td><%= b.getRestrictDate() %></td>
		                    </tr>
	                    <% } %>
                    <% } %>
                </tbody>
            </table>
            
            <!-- AJax 키워드 검색 기능(카테고리 : 이름, 아이디) -->
            <script>
            	function enterkey(){
            		if(window.event.keyCode == 13){
	            		var searchCtg = $("#memberSearchCtg option:selected").val();
	            		var keyword = $("#keyword").val();
	            		
	            		//console.log(searchCtg);
	            		//console.log(keyword);
	            		
            			$.ajax({
            				url:"searchAjax.bl",
            				type:"get",
            				data:{searchCtg:searchCtg,
            					  keyword:keyword
            				}, success:function(list){
            					console.log(list);
            					
            					
            					var result = "";
            					if(list.length == 0){
            						result = "<tr><td colspan='4'>조회된 회원이 없습니다.</td></tr>"
            					}
            					for(var i in list){
            						
            						result += "<tr>"
            							   + 	"<td><input type='checkbox' id='selectOne' name='selectOne' onclick='checkSelectAll()'></td>"
        						           +	"<td>" + list[i].memId + "</td>"
        						           +	"<td>" + list[i].memName + "</td>"
        						           +	"<td>" + list[i].restrictDate + "</td>"
        						           + "</tr>";
            					}
            					
            					// 아이디가 memberList인 테이블의 tbody영역안에 result 뿌리기
            					$("#memberList tbody").html(result);
            					$(".pagingArea").css("visibility", "hidden");
            					
            					// 상세보기 요청
            					$("#memberList>tbody>tr").click(function(e){
            	            		if(e.target.type == 'checkbox'){
            	            			return;
            	            		}else{
            	            			location.href='<%=contextPath%>/detail.bl?memId=' + $(this).children().eq(1).text();
            	            		}
            	            	});
            					
            	            		
            				}, error:function(){
            					console.log("ajax통신 실패");
            				}
            			});
            		}
            	}
            </script> 
            
            <script>
            	// 상세보기 요청
            	$("#memberList>tbody>tr").click(function(e){
            		if(e.target.type == 'checkbox'){
            			return;
            		}else{
            			location.href='<%=contextPath%>/detail.bl?memId=' + $(this).children().eq(1).text();
            		}
            	});
            	
            	
            	// 체크박스 (낱개로 모두 체크하는 경우 전체 체크 박스 true, 하나라도 체크해제된 경우 전체 체크 박스 false)
       			function checkSelectAll()  {
       			  // 전체 체크박스
       			  const checkboxes 
       			    = document.querySelectorAll('input[name="selectOne"]');
       			  // 선택된 체크박스
       			  const checked 
       			    = document.querySelectorAll('input[name="selectOne"]:checked');
       			  // selectall 체크박스
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

                    <!-- 버튼 (선택삭제) -->
                    <div align="right" class="btn blackBtn" >
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
                    <div align="right" class="btn blackBtn">
                        <a href="" id="btn2" data-toggle="modal" data-target="#enrollBlacklist">블랙리스트 등록</a> 
                    </div>   

                    
                </div>
    </div>
    
    
    <!-- 선택 삭제 -->
      <script>
      	
      	$("#btn1").click(function(){
  			var cnt = $("input[name='selectOne']:checked").length;
             var arr = [];
             
             if(cnt == 0){
                 alert("블랙리스트를 해제할 회원을 선택해주세요.");
                 $("#btn1").attr("data-target", false);
     		}else{
     			//arr.push($(this).next().text());
     			$("#btn1").attr("data-target", "#unblacklist");
     		}
             	$("input[name='selectOne']:checked").each(function(key) {
                     arr.push($(this).next().text());
                     //console.log($(this).eq(1).text());
                     //console.log(arr);
                 });
             
     	});
      
      </script>	


     <!-- 블랙리스트 해제 모달 -->
        <!-- The Modal -->
        <div class="modal fade" id="unblacklist" align="center" >
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" id="enrollbBtn">     

                    <!-- Modal body -->
                    <br>
                    <div class="modal-body" id="unblacklistBody" >
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
                        <button type="submit" id="okBtnBl" class="btn btn-warning" onclick="return removeBlacklist();">OK</button>
                        <button id="cancleBtnBl" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
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
            <div class="modal-content" id="enrollBlakcBtn">     


                <!-- Modal Header -->
                <div class="modal-header" id="modal-header">
                    <h4 class="modal-title" id="benrollTitle">블랙리스트 등록</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>


                <!-- Modal body -->
                <form action="<%= contextPath %>/enroll.bl" method="post">
                <input type="hidden" name="memNo2" value="<%=loginUser.getMemNo()%>">
               
                <div class="modal-body" id="modal-body">
                    <table>
                        <tr>
                            <th width="100px">아이디</th>
                            <td colspan="2"><input type="text" id="blackId" name="memId" placeholder="   아이디를 입력하세요"></td>
                        </tr>
                        <tr>
                            <th>사유</th>
                            <td width="130x" style="border-right-color: white;"><input type="radio" name="reason" id="reason1"> <label for="reason1">욕설/비방</label></td>
                            <td width="130px"><input type="radio" name="reason" id="reason2"><label for="reason2">게시글도배</label></td>
                        </tr>
                        <tr>
                            <th>처리날짜</th>
                            <td colspan="2"><%= today %></td>
                        </tr>
                    </table>
                </div>
                

                <!-- Modal footer -->
                <div id="modalFooter">
                    <button type="submit" id="okBtn" class="btn btn-warning">등 록</button>
                    <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취 소</button>
                </div>
                </form>
            </div>
        </div>
    </div>
	
</body>
</html>