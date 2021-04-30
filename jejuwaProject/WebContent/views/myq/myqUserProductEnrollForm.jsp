<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.kh.product.model.vo.*"%>
<% Product p = (Product)request.getAttribute("p"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/myq/myqUserProductEnrollForm.css">

<style>


</style>
</head>
<body>

	<%@ include file="../common/customerMenubar.jsp" %>

	<div class="outer" >
        <br>
        <h2>문의사항 등록</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>

        <div class="enrollForm">
                <form id="enrollForm" action="<%=contextPath%>/insertp.umyq" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="memNo" value="<%=login.getMemNo() %>">
                    <input type="hidden" name="memId" value="<%= login.getMemId() %>">
                    <input type="hidden" name="memName" value="<%= login.getMemName() %>">
                    <input type="hidden" name="pCode" value="<%= p.getpCode() %>">
                    <input type="hidden" name="pName" value="<%= p.getpName() %>">
                    <!-- 제목, 내용, 첨부파일 -->
                    <table align="center" id="enrollTable">
                        <tr>
                            <th>제목</th>
                            <td colspan="2" >
                            	<span style="color:red"><b>[<%= p.getpName() %>]</b></span>
                            	<input type="text" name="title" size="72" value="" required>
                            </td>
                        </tr>

                        <tr>
                            <th>분류</th>
                            <td colspan="2">
                                <select name="category" id="category">
                                    <option value="상품문의" name="op_product" id="op_product">상품문의</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td id="file_target">첨부파일 추가<!-- 이미지 클릭시 화살표나오면서 파일 담을수있는 리스트 나오기 FAQ보기 -->
	                            <td colspan="2" style="display: none;">
	                                <input type="file" name="upfile" id="upfile" onchange="loadImg(this, 1);"><br>
	                                <input type="file" name="upfile" id="upfile" onchange="loadImg(this, 2);"><br>
	                                <input type="file" name="upfile" id="upfile" onchange="loadImg(this, 3);">
	                            </td>
                            </td>
                            <!-- 대표이미지?? 흠... -->
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="content" id="content" cols="75" rows="18" style="resize:none;" placeholder="내용을 입력해주세요" required></textarea>
                            </td>
                        </tr>
                    </table>
                    
					 <!-- Notice 테이블에는 작성자 컬럼 없으므로 회원 번호 넘기지 않아도 된다(?) -->

                     <!-- 버튼 구역 -->
			        <div class="bottomArea">
			
			            <!-- 버튼 (목록으로) -->
			            <div class="btn">
			                <a href="<%=contextPath%>/infoDetail.pdt?pcode=<%= p.getpCode() %>" id="btn4" >상품 상세페이지로</a>
			            </div> 
			             <!-- 버튼 (등 록) -->
			            <div class="btn">
			                <a href="<%=contextPath%>/insertp.umyq" id="btn4" data-toggle="modal" data-target="#enrollBtn" >글 작성</a>
			            </div>   			
					</div>
					
			        <!-- 문의사항 등록 모달 -->
			       <!-- The Modal -->
			       <div class="modal fade" id="enrollBtn" align="center" >
			           <div class="modal-dialog modal-dialog-centered">
			               <div class="modal-content" >
			             			                               
			                   <!-- Modal body -->
			                   <br>
			                   <div class="modal-body">
			                       	문의 하시겠습니까?
			                   </div>
			                           
			                   <!-- Modal footer -->
			                   <div id="modalFooter">
			                       <button type="button" id="okBtn" class="btn btn-warning">OK</button>
			                       <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
			                   </div>
			               </div>
			            </div>
			      </div>
                </form>
        </div>
    </div>
    <div style="clear:both;">asdasd<br>asdasd<br>asdasdasd<br></div>
    <script>
            $('#okBtn').click(function(e) {

                console.log("zzz");
                e.preventDefault();

                // Check
                // 아이디 인증 체크
                if($('#category option:selected').val() == "none") {
                    $('#op_product_info').change().text("문의 내용을 분류해주세요 !!")
                    return false;
                }

                $('#enrollForm').submit();
            });
            
            $(function(){
            $("#file_target").click(function(){
            	console.log("asdasdasd");
            	var $p = $(this).next(); // jQuery 방식으로 선택한 요소를 담아둘 때 변수명 앞에 $를 붙인다.
                
                if($p.css("display") == "none"){
                    $(this).siblings("#upfile").slideUp();
                     // 보여지게
                     $p.slideDown();
                    
                }else{
                    $p.slideUp();
                    //  사라지게
                }
				
				/*
                // slideDown 또는 slideUp 시킬 p 요소
                
				*/
            })
        })
    </script>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>