<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 고객센터리뷰 </title>

   <!-- boardMenu css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/customerBoardMenu.css">

    <!-- boardMenu fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<style>
	div {border: 1px; }

	/* 전체 랩 */
	.reviewList-wrap{width: 700px; margin: auto; height:500px; }
	
	/*  테이블 랩 */
	.reviewList-wrap table { 
	    text-align: center;
	    margin: auto;
	    width: 680px;

	}
	#title-wrap {
	    padding-top: 20px;
	    margin: 5px;
	    margin-left: 30px;
	
	}
	
	.review-sum {margin-left:45px}
	/* 총 게시글 수 */
	
	.review-sum span{
	
	    font-size: small;
   
	}
	.search-wrap{ 
	    float: right;
	    width: 300px;
	}
		
	.clear {clear:both; height:0; overflow:hidden;}
	
	.review-table{
	    padding: 20px;
	    margin: 10px;
	    margin-top: 10px;
}
</style>



	<body>
	<%@ include file = "../common/loginUserMenubar.jsp" %>
	
	<div class="reviewList-wrap" align="center">
		<div class="board_menu">       
        	<div class="board_menu_list">                 
            <h2 id="customer_center"><a>고객센터</a></h2>
            <ul>
                <li class="subMenu">
                    <a href="<%=contextPath%>/list.uno?currentPage=1">공지사항<span style="margin-left: 74px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <a href="<%=request.getContextPath() %>/list.rvl">리뷰내역<span style="margin-left: 74px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <a href="<%=request.getContextPath() %>/list.ufa">자주하는문의 FAQ<span style="margin-left: 13px;">〉</span></a>
                </li>
                <li class="subMenu">
                    <a href="">1:1문의내역 <span style="margin-left: 50px;">〉</span></a>
                </li>
            </ul>  
             </div> 
             
    
    
 <div id="title-wrap" align="left">
    
    <div class="review-sum" align="left">
    	<h4>리뷰내역</h4>
   		<span>총 5개의 게시글이 있습니다.</span>
    </div>
    
    
    	<div class="search-wrap">
            	<form class="form-inline" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-outline-info" type="submit">검색</button>
            </form>

           
          
    </div>
    <div class="clear"></div>
    <div class="review-table">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>리뷰</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>5</td>
                <td>[제주 감귤체험]좋았어요</td>
                <td>user01</td>
                <td>2021-03-21</td>
            </tr>
            <tr>
                <td>4</td>
                <td>[제주 시티투어]즐거웠습니당</td>
                <td>user02</td>
                <td>2021-02-24</td>
            </tr>
            <tr>
                <td>3</td>
                <td>[한라산투어]별로네요..</td>
                <td>admin</td>
                <td>2020-07-05</td>
            </tr>
            <tr>
                <td>2</td>
                <td>[온천카페]너무 재밌었어요</td>
                <td>admin</td>
                <td>2020-04-25</td>
            </tr>
            <tr>
                <td>1</td>
                <td>[서귀포 투어]또가고싶어요</td>
                <td>admin</td>
                <td>2020-01-05</td>
            </tr>
        </tbody>
    </table>
</div>
    <br><br>
            

    	
    	
    

</body>
</html>