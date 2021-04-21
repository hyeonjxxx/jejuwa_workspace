<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="resources/css/notice/noticeEnrollForm.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>

	<div class="outer">
        <br>
        <h2>공지사항 등록</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>

        <div class="enrollForm">
                <form id="enrollForm" action="<%=contextPath%>/insert.no" method="post" enctype="multipart/form-data">
                    <!-- 제목, 내용, 첨부파일 -->
                    <table align="center" id="enrollTable">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" size="72" placeholder="제목을 입력해주세요" required>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="2">
                                <input type="file" name="upfile">
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="content" id="" cols="75" rows="18" style="resize:none;" placeholder="내용을 입력해주세요" ></textarea>
                            </td>
                        </tr>
                    </table>
                    
					 <!-- Notice 테이블에는 작성자 컬럼 없으므로 회원 번호 넘기지 않아도 된다(?) -->

                     <!-- 버튼 구역 -->
			        <div class="bottomArea">
			
			            <!-- 버튼 (목록으로) -->
			            <div class="btn">
			                <a href="<%=contextPath%>/list.no?currentPage=1" id="btn1">목록으로</a>
			            </div> 
			             <!-- 버튼 (등 록) -->
			            <div class="btn">
			                <a data-toggle="modal" data-target="#enrollBtn" >등 록</a>
			            </div>   			
					</div>
					
			        <!-- 공지사항 등록 모달 -->
			       <!-- The Modal -->
			       <div class="modal fade" id="enrollBtn" align="center" >
			           <div class="modal-dialog modal-dialog-centered">
			               <div class="modal-content" >
			             			                               
			                   <!-- Modal body -->
			                   <br>
			                   <div class="modal-body">
			                       	공지사항을 등록하시겠습니까?
			                   </div>
			                           
			                   <!-- Modal footer -->
			                   <div id="modalFooter">
			                       <button type="submit" id="okBtn" class="btn btn-warning">OK</button>
			                       <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
			                   </div>
			               </div>
			            </div>
			      </div>
       
                </form>
        </div>


    </div>

       

</body>
</html>