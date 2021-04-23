<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); 
	//Member loginUser = (Member)request.getAttribute("loginUser");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<script>
		var msg = "<%= session.getAttribute("alertMsg") %>"; // 알람창으로 출력할 메세지
		// var msg = "메세지" / "null";
		
		if(msg != "null"){
			alert(msg);
			// 알람창 띄워준 후에 session에 담긴 메세지 지워야됨!!(안그러면 메뉴바 포함된 매 페이지 열때마다 alert계속뜰꺼임)
			<% session.removeAttribute("alertMsg"); %>
	}
	</script>

	<div class="wrap">
        <!-- 헤더 -->
        <div id="header" >
            <div id="header1">
                <a href="<%=contextPath%>/admin.go"><img src="<%= contextPath %>/resources/images/톱니바퀴.png" style="padding: 15px;"></a>
            </div>

            <!-- 로그인 전 div -->
            <% if(loginUser == null) { %>
            <div id="header2">
                <span class="topbtn">관리자off</span>
                <a href="#" class="topbtn" data-toggle="modal" data-target="#loginModal">로그인</a>
                <a href="<%=contextPath %>" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div>
			<% } else {%>
            <!-- 로그인 후 div -->
            <div id="header2">
                <span class="topbtn">관리자on</span>
                <a href="<%= contextPath %>/logout.ad" class="topbtn">로그아웃</a>
                <a href="<%=contextPath %>/jejuwa.go" class=topbtn style="margin-left: 700px;">홈페이지</a>     
            </div>
            <% } %>
            
        </div>

        <!-- 컨테이너 => iodex, content -->
        <div id="container">
            <!-- 인덱스 -->
            <div class="menu">
                <div class="submenu">회원 관리</div>
                    <p>
                        <a href="">회원 현황</a> <br>
                        <a href="">블랙리스트 관리</a> <br>
                    </p>
                
                    <div class="submenu">상품 관리</div>
                    <p>
                        <a href="<%=contextPath%>/list.pdt">상품 조회</a> <br>
                        <a href="<%=contextPath%>/enroll.pdt">상품 등록</a> <br>
                        <a href="<%=contextPath%>/list.or?currentPage=1">주문내역 관리</a> <br>
                    </p>
        
                    <div class="submenu">게시글 관리</div>
                    <p>
                        <a href="<%=contextPath%>/list.no?currentPage=1">공지사항 관리</a><br>
                        <a href="<%=contextPath%>/list.fa?currentPage=1">FAQ 관리</a> <br>
                        <a href="">1:1문의 관리</a> <br>
                        <a href="">리뷰관리</a> <br>
                    </p>
                    
                    <div class="stop"> <a href="">쿠폰 관리</a></div>
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
                        <th width="30" ><input type="checkbox"></th>
                        <th width="70">번호</th>
                        <th width="100">쿠폰코드</th>
                        <th width="200">쿠폰명</th>
                        <th width="230">기간</th>
                        <th width="70">할인율</th>
                        <th width="130">등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>감사쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>생일쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>생일쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>coupon004</td>
                        <td>생일쿠폰</td>
                        <td>2019-03-05 ~ 2021-04-22</td>
                        <td>20%</td>
                        <td>2019-03-05</td>
                    </tr>
                    
                    

                </tbody>

            </table>

        </div>

       
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea">

    
    
            <!-- 페이징  -->
            <div id="next-buttton" align="center" class="pagingArea">
                        
                    <button>&lt;</button>			
                
                        <button disabled>1</button>				
                        <button>2</button>
                        <button>3</button>
                   		
                
                    <button>&gt;</button>

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