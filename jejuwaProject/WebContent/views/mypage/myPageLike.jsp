<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, 
    com.kh.product.model.vo.*, com.kh.like.model.vo.*"%>
<%
	//Product p = (Product)request.getAttribute("p");
	ArrayList<Like> list = (ArrayList<Like>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 좋아요</title>

<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>

        .likeOuter{margin: auto;}
        #recentP{font-size: 20px;}
        .likeOuter>h3{margin-top: 60px; font-size: 20px; font-weight: bold;}
        
        .gallery{width: 979px; margin: auto;}
        .gallery > li, .gallery>li>img{float: left; padding-right: 15px; width:180px; list-style: none;}
        
        /*.gallery > li:nth-child(2n) {padding-right: 0;}*/
        /*.gallery li a{display : block; position: relative; text-decoration: none;  }*/
        .gallery li ul{padding : 2px 2px 2px; border: 1px solid gray; height: 200px;}
        .gallery li ul li{list-style: none; color: black; font-size: 12px; font-weight: bold; margin-top: 150px;} 
        .gallery li ul li a{text-decoration: none; color: gray;}
    </style>
    
</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	
	<div class="likeOuter">
		
        <h3>좋아요</h3>
        <hr>
        <%if(list.isEmpty()){ %>
        	<ul class="gallery" align = "center">
				<li>
	        		좋아요 상품이 없습니다.
	  			</li>
			</ul>
        <%}else{ %>	
	        <%for(Like l : list){ %>
	        	<%if(loginUser != null && loginUser.getMemNo()==l.getMemNo()){ %>		
			<ul class="gallery" align = "center">
				<li>
					<img src="<%=contextPath %>/<%= l.getBasicPath()%>" width="150" height="150" alt="">
					<!-- <a href = "<%=contextPath%>/infoDetail.pdt?pcode=<%=l.getpCode()%>"><%=l.getBasicPath() %></a> -->
	        		<ul><li><a href = "<%=contextPath%>/infoDetail.pdt?pcode=<%=l.getpCode()%>"><%=l.getpName() %></a></li></ul>
	  			</li>
			</ul>
				<%}else{ %>
	
				<%} %>
	        <%} %>		
        <%} %>	
                  
     </div>
     
     </div>
     <%@ include file = "../common/footer.jsp" %>
	
	
	
</body>



</html>