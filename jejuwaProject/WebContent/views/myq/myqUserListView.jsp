<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.ArrayList,
    		  com.kh.myq.model.vo.MYQ,
    		  com.kh.common.model.vo.PageInfo"%> 
    
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<MYQ> list = (ArrayList<MYQ>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- myqUserListView css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myq/myqUserListView.css">

    <!-- myqUserListView js-->
    <link rel="stylesheet" href="">

    <!-- board fonts-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>
	<%@ include file="../common/customerMenubar.jsp" %>
	
	<div class="outer">
        <br><br>
        <h2>1:1 문의</h2>
        <br>
        
        <br>

		<!-- 검색창 -->
		<div class="area1">
            <div align="right" class="searchArea">
               
                <span href="" >
                    <select name="noticeSearchCtg" id="noticeSearchCtg">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="titleContent">제목+내용</option>
                    </select>
                    <input id="keyword" type="text" onkeyup="enterkey();" placeholder="검색">
                </span>              
            </div>
		</div>

        <!-- 1:1문의 리스트 테이블 -->
        <div class="listArea">
            <table align="center" id="memberList"  class="table table-hover">
                <thead>
                    <tr>
                        <th width="40" ><input type="checkbox" id="checkAll" name="checkAll"></th>
                        <th width="100">번호</th>
                        <th width="200">제목</th>
                        <th width="150">작성일</th>
                        <th width="150">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 조회된 결과가 없을 경우 -->
					<!--  iNo = count - (page * limit 현재 페이지에 보여지는 숫자값으로 리로드-->
                	<% if( list.isEmpty() ){ %>
	                	<tr>
	                		<td colspan="5">작성된 문의사항이 없습니다.</td>
	                	</tr>
	                <% }else{ %>
	                	<% for(MYQ q : list){ %>
	                    <tr> 
	                    	<td><input id="choice_myq" name ="choice_myq" type="checkbox" value="<%= q.getMyq_no() %>"></td>
	                        <td class="ch2"><%= q.getMyq_no() %></td>
	                        <td class="ch2">
								<% if( q.getP_code() == null){%>
	                        		<%= q.getMyq_title() %>
	                        	<% } else { %>
	                        		<span style="color:red; border: 0px;">[<%= q.getP_name() %>]</span>
	                        		<%= q.getMyq_title() %>
	                        	<% } %>
	                        </td>
	                        <td class="ch2"><%= q.getMyq_enroll_date() %>
	                        	
	                        </td>
	                        <td class="ch2">
								<% if( q.getMyq_ans_date() != null && q.getMyq_ans_content() != null){%>
	                        		답변
	                        	<%}else{ %>
	                        		미답변
	                        	<% } %>
							</td>
	                    </tr>
	                    <% }} %>
                </tbody>
            </table>
        </div>
        <br>
        <!-- 관리자 게시글 권한 -->
            <div style="display: block; text-align: right;" class="btn">
					<button id="btn4" data-toggle="modal" data-target="#enrollBtn" >삭제하기</button>
                <button type="button" id="btn2" style="margin-left:30px; margin-right:40px;" onclick="location.href='<%=request.getContextPath()%>/enroll.umyq'">글 작성</button> 
            </div>     
		<script>

		</script>
        <!-- 버튼, 페이징 구역 -->
        <div class="bottomArea">
			<!-- 삭제버튼 모달 -->
			<div class="modal fade" id="enrollBtn" align="center" >
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content" >
															 
						<!-- Modal body -->
						<br>
						<div class="modal-body">
								선택한 문의를 삭제하시겠습니까??
						</div>
								
						<!-- Modal footer -->
						<div id="modalFooter">
							<button type="button" id="okBtn" class="btn btn-warning">OK</button>
							<button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
						</div>
					</div>
				 </div>
		   </div>


            <!-- 페이징  -->
            <div align="center" class="pagingArea">

					<!-- 만약 조회된 결과 없을 경우 -->
					<% if( list.isEmpty() ){ %>
						<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>
						<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
					<% } else{%>


                    <!-- 내가 보는 페이지가 1번 페이지일 경우 <,<< 버튼 disabled -->
                    <% if(currentPage == 1) {%>
                    	<button disabled>&laquo;</button>
	                    <button disabled>&lt;</button>			
                    <%} else {%>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.umyq?currentPage=1';">&laquo;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.umyq?currentPage=<%=currentPage-1%>';">&lt;</button>			
					<% } %>
					
					<% for(int p=startPage; p<=endPage; p++ ) {%>
					
						<% if(currentPage == p) {%>
                        	<button disabled><%= p %></button>
                        <% }else{ %>				
	                        <button onclick="location.href='<%=request.getContextPath()%>/list.umyq?currentPage=<%= p %>';"><%= p %></button>
                        <% } %>		
                	<% } %>
                	
                	<!-- 내가 보는 페이지가 마지막 페이지일 경우 >,>> 버튼 disabled -->
                	<% if(currentPage == maxPage){ %>
                		<button disabled>&gt;</button>
	                    <button disabled>&raquo;</button>
                	<% } else{ %>
                		<button onclick="location.href='<%=request.getContextPath()%>/list.umyq?currentPage=<%=currentPage+1%>';">&gt;</button>
	                    <button onclick="location.href='<%=request.getContextPath()%>/list.umyq?currentPage=<%=maxPage%>';">&raquo;</button>
                	<% }} %>
             </div>
		</div>
	</div>


	<script>
		// 상세보기 요청
		// $("#memberList>tbody>tr").click(function(){
		// 		location.href='<%=request.getContextPath()%>/detail.umyq?myqno='+$(this).children().eq(1).text();
		// 		// /detail.amyq?myqno=글번호
		// 		// #memberList>tbody>tr 여기 tr의 자손들 중에 2번째(=eq(1))의 text를 가져오겠다. 
		// 	})

		// 체크박스 체크
		$("#memberList>tbody>tr").click(function(e){
            		if(e.target.type == 'checkbox'){
            			return;
            		}else{
            			location.href='<%=contextPath%>/detail.umyq?myqno='+ $(this).children().eq(1).text();
            		}
        });



		$("#checkAll").on("click", function () {
        	$(this).parents("#memberList").find('input').prop("checked", $(this).is(":checked"));
    	});
		

		// $(function(){
		// 	$("input[id=choice_myq]").on("click", function(){
		// 		if ($("input[id=choice_myq]:checked").length >0 ) {
		// 			$(".btn #btn4").prop("disabled", false);
		// 			console.log("체크박스있을때");


					
		// 			var myq_no = $('input[id=choice_myq]:checked').parent().siblings(1).html() // 체크한 곳의 myq_no 가져오기




		// 		} else{
		// 			$(".btn #btn4").prop("disabled", true);
		// 			console.log("체크박스없을때");
		// 		}
		// 	})
		// })

		function test() {
        var select_obj = '';
  
        $('input[type="checkbox"]:checked').each(function (index) {
            if (index != 0) {
                select_obj += ', ';
            }
            select_obj += $(this).val();
        });
  
        alert(select_obj);
    	}


		$(document).ready(function() {
			$("#okBtn").click(function(){
				var length = $('input[id=choice_myq]:checked').length; // 체크된 숫자갯수

				console.log("숫자갯수" + length);

				var myq_arr = []; // 배열선언
				
				$('input[id=choice_myq]:checked').each(function(){
					var myq_no = $(this).val(); // 내가 원하는 값을 value로 담아놓고 체크할 때 value값 담기(생각의전환 필요!) 
					
					myq_arr.push(myq_no);
					// 배열에 담기
				});

				console.log("배열" + myq_arr);
				// 체크된 게시물 번호 배열에 담았음
				console.log(myq_arr);
				$.ajax({
					type: "POST",
					url: "delete.umyq",
					data: {
						myq_no: myq_arr
					},
					success: function(jdata){
						if(jdata != 1) {
							alert("삭제 오류");
						}
						else{
							alert("삭제 성공");
						}
					},
					error: function(){alert("서버통신 오류");}
				});
			});
		})
		
		
		

		 
		

		
	</script>

    <br><br>
    <!-- </%@ include file="../common/footer.jsp" %> -->
</body>
</html>