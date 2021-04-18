<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.faq.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 사용자 게시판</title>

<!-- header css -->
<link rel="stylesheet" type="text/css" href="header.css">

<!-- content css-->
<link rel="stylesheet" type="text/css" href="cs-reviewList.css">    

<!-- footer css -->
<link rel="stylesheet" type="text/css" href="footer.css">

<!-- footer fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- FAQ 사용자 게시판 CSS -->
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/resources/css/customer/faqUserListView.css">

</head>
<body>

	<%@ include file = "../common/customerMenubar.jsp" %>
	
	<br><br>
	<div class="reviewList-wrap"align="center">
    <div id="title-wrap" align="left">
    <h2>자주하는 문의(FAQ)</h2>
    </div>
    <br>
    <div class="review-sum" align="right">
        <form action="" method="GET" >
            <fieldset>
                <select name = "searchKey">
                    <option value="title">제목</option>
                    <option value="qstatus">구분</option>
                </select>

                <label>검색어</label>
                    <input type = "text" id="searchKeyword" name = "search" >
                    <input type ="submit" value="검색">
            </fieldset>
        </form>

    </div>


    <div class="clear"></div>
    <div class="review-table">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>구분</th>
            </tr>
        </thead>
        <tbody>
        	<% if(list.isEmpty()){ %>
        		<tr>
        			<td colspan="3"> 존재하는 공지사항이 없습니다 </td>
        		</tr>
        	<%}else{ %>
        		<%for (Faq f : list){ %>
            		<tr class = "question">
                		<td width ="30px"><%=f.getFaqNo()%></td>
                		<td width = "250px"><%=f.getFaqTitle() %></td>
                		<td width = "100px"><%=f.getqCategory()%></td>
            		</tr>
            		
            		<tr class="answer">
            			<th colspan="3"><%=f.getFaqContent() %></th>
            		</tr>
            	<%} %>
            <%} %>
            
        </tbody>
    </table>
    
    <script>
        $(function(){
            $(".question").click(function(){
            	
            	var $p = $(this).next(); // jQuery 방식으로 선택한 요소를 담아둘 때 변수명 앞에 $를 붙인다.
                
                if($p.css("display") == "none"){
                    $(this).siblings("p").slideUp();
                    $p.slideDown(); // 보여지게
                    
                }else{
                    $p.slideUp(); //  사라지게
                }
				
				/*
                // slideDown 또는 slideUp 시킬 p 요소
                
				*/
            })
        })
    </script>
</div>
    <br><br>
</div>
	
</body>
</html>