<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css"  href="../../resources/css/faqListView.css">
    
        <!-- FAQ SERVICE CSS -->
        <link rel="stylesheet" href="borderFAQ.css">

</head>
<body>
	<%@ include file="../common/custmorMenubar.jsp" %>
	
    <div class="outer">
        <br>
        <h2>공지사항 관리</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br><br><br><br><br><br><br><br>
        

        <div class="area1">

            
            <!-- span태그로 했는데..맞나..? -->
            <div align="right" class="searchArea">
               
                <span href="" >
                    <select name="faqStatus" id="">
                        <option value="place">관광지/레저</option>
                        <option value="taste">맛집</option>
                        <option value="coupon">쿠폰</option>
                        <option value="cancle">취소/결제</option>
                    </select>
                    <select name="memberStatus" id="">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="titleContent">제목+내용</option>
                    </select>
                    <input type="text" placeholder="검색">
                </span>              
            </div>
            
        </div>

        <!-- 공지사항 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList">
                <thead>
                    <tr>
                        <th width="30" ><input type="checkbox"></th>
                        <th width="70">번호</th>
                        <th width="100">구분</th>
                        <th width="400">제목</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>취소/결제</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                        
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                        
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>10</td>
                        <td>맛집</td>
                        <td>예약, 취소는 어떻게 하나요?</td>
                    </tr>
                    
                    

                </tbody>

            </table>

        </div>

       
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea">

            <!-- 버튼 (선택삭제) -->
            <div align="right" class="btn">
                <a href="" id="btn1">선택삭제</a>
            </div>                
            
    
            <!-- 페이징  -->
            <div align="center" class="pagingArea">
                        
                    <button>&lt;</button>			
                
                        <button disabled>1</button>				
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>			
                
                    <button>&gt;</button>

             </div>

             <!-- 버튼 (등록) -->
            <div align="right" class="btn">
                <a href="" id="btn2">등 록</a> 
            </div>   
			
		</div>

    </div>
	
</body>
</html>