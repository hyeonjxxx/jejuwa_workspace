<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   	,com.kh.coupon.model.vo.*, java.util.ArrayList"
			    %>
<%
PageInfo pi = (PageInfo)request.getAttribute("pi");
ArrayList<Coupon> adlist = (ArrayList<Coupon>)request.getAttribute("adlist");



int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 쿠폰 게시판</title>

<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
	

#coupon_td *{
vertical-align: middle;
}

th{padding:10px; }

.coupon-content { 

margin: auto; 
margin-top:50px; 
width:750px;
    
}
.Information{
    margin: 20px;
    margin-top: 150px;
    font-size: small;
    color: gray;
}
	</style>
</head>
	
<body>
	
<%@ include file = "../common/mypageMenubar.jsp" %>
	
     <!-- 마이페이지 컨텐츠 -->
           
         
    <div class="coupon-content" >
                        
    <table class="table table-hover" id="coupon_td" >
        <thead>
            <tr align="center" >
                    <th width="200px">발급일</th>
                    <th width="400px">쿠폰명</th>
                    <th width="100px">할인</th>
                    <th width="500px" rowspan="2">사용기간</th>
                </tr>
        </thead>
        <tbody>
          <!-- 조회된 결과가 없을경우  -->
        <%if(adlist.isEmpty()) { %>
        	<tr>
        		<td colspan="6" align="center">존재하는 쿠폰이 없습니다.</td>
        	</tr>
        	
        	<% }else{ %>
        		
        	
        		<% for(Coupon cp : adlist) { %>
        			<%if(loginUser != null && loginUser.getMemNo()==cp.getMem_No()){ %>
            	<tr>
	              	<td width="200px" align="center"><%= cp.getCpn_Rgdt()%></td>
	                <td width="400px" align="center"><%= cp.getCpn_Name()%></td>
	                <td width="100px" align="center"><%= cp.getCpn_Dc()%>%</td>
	                <td width="300px" align="center" rowspan="2"><%=cp.getCpn_Str_Date()%> ~ <%=cp.getCpn_End_Date()%></td>
	                
	                
           		 </tr>
            
          	 <% } %>
          <% } %>
          <% } %>
          
        </tbody>
    </table>
    <br><br>
         </div>
         
         

          <!-- 조회된 결과가 없을 경우-->
          <!-- <tr><td colspan="6" align="center">조회된 리스트가 없습니다.</td>
           </tr>-->
         </tbody>
         
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea" align="center">

    <!-- 페이징  -->
            <div align="center" class="pagingArea">
                    
                    	
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=contextPath%>/list.mycpn?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.mycpn?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=contextPath%>/list.mycpn?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=contextPath%>/list.mycpn?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=contextPath%>/list.mycpn?currentPage=<%=maxPage%>';">&raquo;</button>
                	
					<% } %>

             	</div>
             
                    
                    <div class="Information">
                    <hr>
                    <p>
                        * 발급받으신 쿠폰을 주문/결제 시 적용하실 수 있습니다. <br>
                        * 사용기간이 만료되거나 사용한 쿠폰은 보유 목록에서 자동으로 삭제됩니다. <br>
                        * 주문/취소 시 이용기간이 남아 있는 쿠폰인 경우 재발급됩니다. <br>
                    </p>
                   </div>
                   
            </div>

       	</div>	

<!-- 푸터와 내려와야,, -->
<%@ include file = "../common/footer.jsp" %>
</body>
</html>