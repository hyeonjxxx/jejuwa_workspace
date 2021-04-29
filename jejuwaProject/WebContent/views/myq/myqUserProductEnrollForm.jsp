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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/myq/myUserEnrollForm.css">


</head>
<body>

	<%@ include file="../common/loginUserMenubar.jsp" %>

	<div class="outer" >
        <br>
        <h2>상품 문의사항 등록</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>

        <div class="enrollForm">
                <form id="enrollForm" action="<%=contextPath%>/insert.umyq" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="memNo" value="<%=login.getMemNo() %>">
                    <input type="hidden" name="memId" value="<%= login.getMemId() %>">
                    <input type="hidden" name="memName" value="<%= login.getMemName() %>">
                    <!-- 제목, 내용, 첨부파일 -->
                    <table align="center" id="enrollTable">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" size="72" placeholder="제목을 입력해주세요" required>
                            </td>
                        </tr>

                        <tr>
                            <th>분류</th>
                            <td colspan="2">
                                <select name="category" id="category">
                                    <option value="주문/결제" name="op_payment" id="op_payment">주문/결제</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>화살표<!-- 이미지 클릭시 화살표나오면서 파일 담을수있는 리스트 나오기 FAQ보기 -->
	                            <td colspan="2">
	                                <input type="file" name="upfile1" id="upfile1" onchange="loadImg(this, 1);"><br>
	                                <input type="file" name="upfile2" id="upfile2" onchange="loadImg(this, 2);"><br>
	                                <input type="file" name="upfile3" id="upfile3" onchange="loadImg(this, 3);">
	                            </td>
                            </td>
                            <!-- 대표이미지?? 흠... -->
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="content" id="content" cols="75" rows="18" style="resize:none;" placeholder="내용을 입력해주세요" ></textarea>
                            </td>
                        </tr>
                    </table>
                    
					 <!-- Notice 테이블에는 작성자 컬럼 없으므로 회원 번호 넘기지 않아도 된다(?) -->

                     <!-- 버튼 구역 -->
			        <div class="bottomArea">
			
			            <!-- 버튼 (목록으로) -->
			            <div class="btn">
			                <a href="<%=contextPath%>/infoDetail.pdt?pcode=<%=p.getpCode() %>" id="btn4">상품페이지로</a>
			                <!-- 상품 창에서 -> 이미지 클릭시 이동하는 스크립트구문  -->
					
					<scirpt>
					$(function(){
		        		$(".pdtArea").click(function(){
		        			location.href = '<%=contextPath%>/infoDetail.pdt?pcode=
							=> <input type="hidden" name="pcode" value="<%=p.getpCode()%>">
							즉, 전달받은 pcode값 받아와서 여기다가 넣어놓기
		        		})	
		        	})
		        	<!-- pdtArea클릭시 이동할 함수 => infoDetail.pdt?pcode='' -->
		        	</scirpt>
			            </div> 
			             <!-- 버튼 (등 록) -->
			            <div class="btn">
			                <a href="" id="btn4" data-toggle="modal" data-target="#enrollBtn" >글 작성</a>
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

        $('#category').val()
        function enterkey(){
            if(window.event.keyCode == 13){
                var search = $("#faqSearch option:selected").val();
                var keyword = $("#keyword").val();
                
                $.ajax({
                    url : "searchAjax.fa",
                    type : "get",
                    data : {search : search,
                            keyword : keyword},
                    success : function(list){
                        var result = "";
                        if(list.length == 0){
                            result = "<tr><td colspan = '3'>조회된 공지사항이 없습니다.</td></tr>"
                        }
                        for(var i in list){
                            result += "<tr>"
                                    + "<td>" + list[i].faqNo + "</td>"
                                    + "<td>" + list[i].qCategory + "</td>"
                                    + "<td>" + list[i].faqTitle + "</td>"
                                    + "<tr>";
                        }
                        
                        $("#faqTable tbody").html(result);
                        $("#pagingArea").css("visibility", "hidden");
                        
                        $(function(){
                            $("#faqTable>tbody>tr").click(function(){
                                location.href = '<%=contextPath%>/detail.fa?fno=' + $(this).children().eq(0).text();
                            })
                        })
                    }, error:function(){
                        console.log("ajax통신 실패");
                    }
                
                });
            }
        }
    </script>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>