<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.faq.model.vo.Faq, com.kh.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ게시판</title>
<!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        <!-- boardMenu css -->
        <link rel="stylesheet" type="text/css" href="boardMenu.css">
    
        <!-- boardMenu fonts-->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">
    
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    
        <!-- FAQ CSS -->
        <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/resources/css/faq/faqListView.css">
    
        <!-- FAQ SERVICE CSS -->
        <link rel="stylesheet" href="borderFAQ.css">

</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
		
    <div class="outer">
        <br>
        <h2>FAQ 관리</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>
        
	        <div class="area1">
	            <!-- FAQ 검색 -->
	            <div align="right" class="searchArea" style = "margin-left:10px;">
	                 <select name="faqSearch" id="faqSearch">
	                     <option value="title">제목</option>
	                     <option value="category">구분</option>
	                 </select>
	                 <input type="text" placeholder="검색" id = "keyword" onkeyup="enterkey();" >
	            </div>
	            
	            <script>
	            function enterkey(){
	            	if(window.event.keyCode == 13){
	            		var search = $("#faqSearch option:selected").val();
	            		var keyword = $("#keyword").val();
	            		
	            		$.ajax({
	            			url : "searchAjax.fa",
	            			type : "get",
	            			data : {search : search,
	            				    keyword : keyword},
	            			success : function(list){
	            				var result = "";
	            				if(list.length == 0){
	            					result = "<tr><td colspan = '3'>조회된 공지사항이 없습니다.</td></tr>"
	            				}
	            				for(var i in list){
	            					result += "<tr>"
				    	                    + "<td>" + list[i].faqNo + "</td>"
				    	                    + "<td>" + list[i].qCategory + "</td>"
				    	                    + "<td>" + list[i].faqTitle + "</td>"
	    	                        		+ "<tr>";
	            				}
	            				
	            				$("#faqTable tbody").html(result);
	            				$("#pagingArea").css("visibility", "hidden");
	            				
	            				$(function(){
	            					$("#faqTable>tbody>tr").click(function(){
	            						location.href = '<%=contextPath%>/detail.fa?fno=' + $(this).children().eq(0).text();
	            					})
	            				})
	            			}, error:function(){
	            				console.log("ajax통신 실패");
	            			}
	            		
	            		});
	            	}
	            }
	            
	            </script>
	            
	        </div>

	        <!-- 공지사항 리스트 테이블 -->
	        <div class="listArea">
	            <table align="center" class="faqList" id = "faqTable">
	                <thead>
	                    <tr>
	                        <th width="80">번호</th>
	                        <th width="160">구분</th>
	                        <th width="440">제목</th>
	                        
	                    </tr>
	                </thead>
	                <tbody>
	                
	                <%if(list.isEmpty()){ %>
	                	<tr>
	                		<td colspan = "5">존재하는 FAQ가 없습니다.</td>
	                	</tr>
	                
	                <%}else{ %>
	                	<%for(Faq f : list){ %>
		                    <tr>
		                        <td><%=f.getFaqNo()%></td>
		                        <td><%=f.getqCategory() %></td>
		                        <td><%=f.getFaqTitle() %></td>
		                        
		                    </tr>
		                <%} %>
	                <%} %>   
	
	                </tbody>
	            </table>
	        </div>
		
		    <script>
		    	$(function(){
		    		$(".faqList>tbody>tr").click(function(){
		    			location.href = '<%=contextPath%>/detail.fa?fno=' + $(this).children().eq(0).text(); 
		    		})
		    	})
		    </script>
    
		    <% if(loginUser != null){ %>
		        <!--로그인했고, 로그인한 사용자가 admin일 경우 보여지는 div-->                
		        <a href="<%= contextPath %>/enrollForm.fa" id = "writeButton" class="btn btn-secondary btn-sm" style = "margin-left:30px;">글작성</a>
		        <br><br>
		        
		    <%} %>
		        
		        <!-- 버튼, 페이징 구역 -->
	            <!-- 페이징  -->
	            <div id="pagingArea" class="pagination">
					<% if(currentPage != 1) { %>
	            	    <li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.fa?currentPage=<%=currentPage-1%>';" style="color: black;">이전</button></li>
				<% } %>
				
				<% for(int p=startPage; p<=endPage; p++) { %>
					
					<% if(currentPage == p){ %>
	            		<li class="page-item active"><button class="page-link" disabled style="background-color: orange; border: none;"><%= p %></button></li>
	            	<% }else{ %>
	            		<li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.fa?currentPage=<%= p %>';" style="color: black;" ><%= p %></button></li>
	            	<% } %>
	            	
				<% } %>
				
				<% if(currentPage != maxPage){ %>
	            	<li class="page-item"><button class="page-link" onclick="location.href='<%=contextPath%>/list.fa?currentPage=<%=currentPage+1%>';" style="color: black;">다음</button></li>
				<% } %>
	             </div>
			
			
		</div>


</body>
</html>