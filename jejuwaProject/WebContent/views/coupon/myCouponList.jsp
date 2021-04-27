<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.model.vo.PageInfo
			   	,com.kh.coupon.model.vo.Coupon, java.util.ArrayList" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Coupon> mylist = (ArrayList<Coupon>)request.getAttribute("mylist");
	
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

<!-- footer fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
	
div{border: 1px  gray; box-sizing: border-box;  }
ul, li, em{list-style: none;}
ul{
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    }
li{display: list-item;}
*{box-sizing: border-box;}

a{text-decoration: none; margin: -30px;}
.wrap{width: 1000px; height:800px;  margin: auto;}

.wrap>div{width: 100%;}
.content{height: 100%;}


.content>div{height: 100%; float: left; }
.content_1{width: 25%;}
.content_2{width: 75%;}

#Menu a{
    padding-top: 10px;
    font-size: 20px;
    line-height: 24px;
    letter-spacing: -1px;
    color: black;
    margin-left: -2px;
    }
.content_1 li a{
    font-size: 13px;
    color: black;
    letter-spacing: -0.8px;
    }
.content_1 li a:hover, #Menu a:hover{color: orange;}
.mypageStep {
    overflow: hidden;
    width: 100%;
    margin-top: 10px;
    border-radius: 10px;
    background-color: lightgray;
    }
.mypageStep li {
    float: left;
    position: relative;
    width: 20%;
    height: 117px;
    font-size: 20px;
    line-height: 6;
    }
.mypageStep li:first-child {background: none;}
.mypageStep em{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 25px;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }    
.mypageStep span{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 70px;
    font-size: 16px;
    line-height: 22px;
    }

.user{
    font-size: 14px;
    line-height: 20px;
    position: relative;
    height: 51px;
    padding: 8px 0 0 30px;
    background-color: orange;
    }
.welcome{
    margin: 0;
    padding: 0;
    float: left;
    margin-left: -20px;
    font-size: 18px;
    line-height: 3px;
    font-weight: 700;

    }
.pointbox{
    word-spacing: -1px;
    font-size: 14px;
    line-height: 20px;
    padding: 19px 0;
    border: 1px solid lightgray;
    width:750px;
    }

#reservation, #coupon{
    word-spacing: -1px;
    font-size: 20px;
    line-height: 20px;
    float: left;
    width: 50%;
    text-align: center;
    }   


#count{
    word-spacing: -1px;
    text-align: center;
    margin: 0;
    padding: 0;
    text-decoration: none;
    display: inline-block;
    padding-left: 15px;
    font-size: 30px;
    color: orange;
    font-style: normal;
    }

.unit{
    font-size: 20px;
    font-style: normal;

    }

.outer{
    margin: auto;
    }

th{padding: 10px; width:800px;}

.coupon-content { margin-top: 10px; width:800px;
    
}
.Information{
    margin: 20px;
    font-size: small;
    color: gray;
}
	</style>
	</head>
	
	<body>
	
<%@ include file = "../common/mypageMenubar.jsp" %>
	
     <!-- 마이페이지 컨텐츠 -->
            <div class="content_2" >
             
                 
                    <div class="pointbox">
                        <ul class="info" id="pointinfo" >
                            <li id="reservation" onclick="">
                                <span>예약</span>
                                <a href="" id="count">1 <em class="unit">건</em></a>
                            </li>

                            <li id="coupon" onclick="">
                                <span>쿠폰</span>
                                <a href="" id="count">1 <em class="unit">개</em></a>
                            </li>
                            <br>
                        </ul>
                    </div>

               <br><br>

               <div class="outer">

          <table>
      <tbody>
                    
                    
  
    <div class="coupon-content"  width="800px">
                        
    <table class="table table-hover" >
        <thead>
            <tr>
                <tr align="center" width="750px">
                    <th width="400px">발급일</th>
                    <th width="500px">쿠폰명</th>
                    <th width="500px">할인</th>
                    <th width="1000px">사용기간</th>
                </tr>
            </tr>
        </thead>
        
        <tbody>
          <!-- 조회된 결과가 없을경우  -->
        <%if(mylist.isEmpty()) { %>
        	<tr>
        		<td colspan="4" align="center">존재하는 쿠폰이 없습니다.</td>
        	</tr>
        	
        	
        	<% }else{ %>
        		<% for(Coupon c : mylist) { %>
            	<tr>
	              	<td><%= c.getCpn_Rgdt()%></td>
	                <td><%= c.getCpn_Name()%></td>
	                <td><%= c.getCpn_Dc()%></td>
	                <td><%= c.getCpn_Str_Date()%> <span> ~ </span> <%=c.getCpn_End_Date()%></td>
	                
           		 </tr>
            
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
            <div class="pagingArea">
            
            	<!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.mycoupon?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.mycoupon?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=request.getContextPath()%>/list.mycoupon?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=request.getContextPath()%>/list.mycoupon?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.mycoupon?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% } %>
            </div>
         
             
                    <hr>
                    <div class="Information">
                    <p>
                        * 발급받으신 쿠폰을 주문/결제 시 적용하실 수 있습니다. <br>
                        * 사용기간이 만료되거나 사용한 쿠폰은 보유 목록에서 자동으로 삭제됩니다. <br>
                        * 주문/취소 시 이용기간이 남아 있는 쿠폰인 경우 재발급됩니다. <br>
                    </p>
                   </div>
            </div>

        </div>

</body>
</html>