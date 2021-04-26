<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   , java.util.ArrayList, com.kh.coupon.model.vo.Coupon" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCoupon</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- css -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/adminPageMenubar.css">

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="">
    
    <style>
    


.outer{

    height: 900px; width: 800px;
    margin: auto;
    margin-top: 10px;
    }
    
    .select-coupon{
        float: left;
        
    }
    /* 쿠폰관리 타이틀 */

    #coupon_title{
       font-weight: 800;
    }

   
    /* 테이블 */
    .listArea{text-align:center;}
    
   
    .listArea>table>tbody>tr:hover{
        background:lightgray;
        cursor:pointer;
    }
    .listArea>table *{
        magin:10px;
        padding:10px;}
    
    
    /* 버튼 + 페이징 구역*/
    .bottomArea a{
        margin: 15px;
        margin-left: 150px;
    }

    #send-button{
        float: right;
        
    }
   
    
    /* 버튼 */
    .btn a{
    text-decoration: none; 
    text-align: center;
    color:white; 
    background-color: dimgray;
    display: block;
    padding:7px;
    border-radius:4px;
    width:70px;
    
    }
    .btn a:hover{background-color: rgb(243, 225, 192);}
    
    
    /* 페이징 구역 */
    .pagingArea{
        margin-left:190px;
        margin-right: 120px;
    }

    #next-buttton{
        padding: 20px;
    }

    #send-button{
        margin-top: 30px;
        margin-left: 50px;
    }
    
    </style>
    
</head>
<body>
	
	<%@ include file="../common/adminPageMenubar.jsp" %>
	

	<div class="wrap">
        <!-- 헤더 -->
        

        <!-- 컨테이너 => iodex, content -->
        <div id="container">
         </div>
           
            <!-- 내용  -->
        <div class="content">
            
            <div class="outer">
        	<br>
        	<h2 id="coupon_title">쿠폰관리</h2>
        	<hr><br><br>
       		<div class="area1">
           <!-- 검색바 -->
            	<div align="right" class="searchArea">
              
               	 <div class="list-coupon">
                	<div class="select-coupon" >
	                </div>
                </div>
                    <div class="search-wrap" style="margin-left:520px;">
                        <form class="form-inline" action="/action_page.php">
                        	<input class="form-control mr-sm-2" type="text" placeholder="Search" ">
                        	<button class="btn btn-outline-info" type="submit" >검색</button>
                    	</form>
                    </div> <br>
                 </div>
            
        	</div>

        <!-- 쿠폰 리스트 테이블 -->
        <div class="listArea">
            <table  align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="30px" ><input type="checkbox"></th>
                        <th width="70px">번호</th>
                        <th width="70px">쿠폰코드</th>
                        <th width="200px">쿠폰명</th>
                        <th width="300px">기간</th>
                        <th width="70px">할인율</th>
                        <th width="130px">등록일</th>
                    </tr>
                </thead>
                <tbody>
                   <!-- 조회된 결과가 없을 경우 -->
		                <% if(list.isEmpty()){ %>
		                	<tr>
		                		<td colspan="6">조회된 회원이 없습니다.</td>
		                	</tr>
		                <% }else{%>
		                <!-- 조회된 결과가 있-->
		                <% for(Coupon c : list) {%>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><%= c.getCpn_Code() %></td>
                        <td><%= c.getCpn_Name() %></td>
                        <td><%= c.getCpn_Str_Date() %>~ <%= c.getCpn_End_Date() %></td>
                        <td><%= c.getCpn_Dc() %>%</td>
                        <td><%= c.getCpn_Rgdt() %></td>
                        
                    </tr>
                   
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
                	
                	<!--  마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
             </div>

             <!-- 버튼 쿠폰발송 -->
            <div id="send-button" class="btn">
                <a href="/<%=request.getContextPath() %>/send.coupon" id="btn2">쿠폰발송</a> 
            </div>   
			
		</div>

    </div>
                


    <script>
        $(function(){

            $(".submenu").click(function(){
                var $p = $(this).next();    

                if($p.css("display")=="none"){
                    $(this).siblings("p").slideUp();
                    $p.slideDown(); 
                }else{    
                    $p.slideUp();  
                }

            })
        })

    </script>
    
    <!-- 로그인 모달 -->
        <!-- The Modal -->
        <div class="modal fade" id="loginModal" align="center" >
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content" >
              
                <!-- Modal body -->
                <br>
                <div class="modal-body">
                    <span><i class="bi bi-person-circle"></i></span> 관리자 로그인
                </div>
                
                <form action="<%=contextPath%>/login.ad" method="post">
                    <div class="input-group mb-3" id="modalContent1">
                      <div class="input-group-prepend">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                      </div>
                      <input name="memId" id="memId" size="25" type="text" placeholder="아이디" required>
                    </div>
                    <div class="input-group mb-3" id="modalContent2">
                        <div class="input-group-prepend">
                          <span class="input-group-text"><i class="bi bi-key"></i></span>
                        </div>
                        <input name="memPwd" id="memPwd" size="25" type="password" placeholder=" 비밀번호" required>
                    </div>
                    
                    <!-- Modal footer -->
                    <div id="modalFooter">
                      <button type="submit" id="okBtn" class="btn btn-warning">로그인</button>
                      <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취 소</button>
                    </div>
                </form>
                               
              </div>
            </div>
          </div>
    
</body>
</html>