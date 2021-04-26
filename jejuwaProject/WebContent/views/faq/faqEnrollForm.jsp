<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리자 등록페이지</title>
<!-- common  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	    
	.faqouter{
	    height: 890px; width: 860px;
	    margin: 20px;
	}
	
	.divisionLine{
	    width: 90%; height: 5px;  
	    background-color: lightgray;
	    margin-top: 10px;
	}    
	
	/* 입력폼 */
	th{width:70px; border:}       
	select, span{margin-left: 10px;}
	td, span{font-size: 14px; padding: 3px 0;}
	
	               
	/* 버튼 */
	#submit{margin-left: 280px;}


	
</style>
</head>
<body>

	<%@ include file = "../common/adminPageMenubar.jsp" %>
	
    <div class="faqouter">

        <br>
        <h2>FAQ 등록</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br>

        <div id="enrollForm" >
                <form action="<%=contextPath%>/insert.fa" method = "post">
                    <table align="center" id="enrollTable" class="table table-bordered">
                        <tr align="center"; >
                            <th >구분</th>
                            <td colspan="2" align="left">
                                <select name="category" id="">
                                    <option value="관광지/레저">관광지/레저</option>
                                    <option value="맛집">맛집</option>
                                    <option value="쿠폰">쿠폰</option>
                                    <option value="취소/결제">취소/결제</option>
                                </select>
                            </td>
                        </tr>
                        <tr align="center";>
                            <th>제목</th>
                            <td colspan="2" align="left">
                                <input type="text" name="title" style = "width: 100%; border:none;" placeholder="제목을 입력해주세요" required style="resize:none;">
                            </td>
                        </tr>
                        <tr align="center";>
                            <th>내용</th>
                            <td colspan="2">
                                <input type = "text" style = "width: 100%; height: 400px; border:none;" name="content" cols="85" rows="30"  placeholder="내용을 입력해주세요" ></input>
                            </td>
                        </tr>
                    </table>
		            <div class="btn">
		                <button type = "submit" id="submit" class="btn btn-warning">작성하기</button>
		                <a href="<%= contextPath %>/list.fa?currentPage=1" class="btn btn-info">취소하기</a> 
		            </div> 
                </form>
        </div>

    </div>

</body>
</html>