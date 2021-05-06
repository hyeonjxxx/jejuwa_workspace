<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java. util.ArrayList, com.kh.product.model.vo.Product, com.kh.common.model.vo.Attachment"%>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- content css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/product/productUpdateForm.css"> 
    
    <!-- modal icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">


</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>

	<div class="outer">
      <br>
      <span class="title">상품수정</span>
      <div class="divisionLine"></div>
      <br>

      <!-- 상품수정 입력폼 -->
		<div class="pdfInfo">
			<form action="<%=contextPath %>/update.pdt" method="POST" id="pdtUpdateForm" name="pdtUpdateForm" enctype="multipart/form-data">
	          <input type="hidden" name="pcode" value="<%=p.getpCode() %>">
	          <table>
				<tr>
	                  <td width="120">*카테고리</td>
	                  <td>
	                      <select name="loaclCode" id="loaclCode" >
	                          <option value="JJ">제주</option>
	                          <option value="AW">애월</option>
	                          <option value="HL">한림/협재</option>
	                          <option value="JM">중문</option>
	                          <option value="SG">서귀포</option>
	                          <option value="PS">표선</option>
	                          <option value="SS">성산/우도</option>
	                          <option value="DH">함덕/구좌</option>
	                      </select>
	                      
	                      <script>
	                      	$(function(){
	                       		$("#localCode option").each(function(){
	                       			if($(this).text == <%=p.getLocalCode() %>){
	                       				$(this).attr("selected", true);
	                       			}
	                       		});
	                       		
	                       	});
	                      </script>
	                      
	                      <select name="themeCode" id="themeCode">
	                          <option value="TR">투어</option>
	                          <option value="TT">티켓</option>
	                          <option value="AY">액티비티</option>
	                          <option value="FD">맛집</option>
	                      </select>
	                      
	                      <script>
	                       	$(function(){
	                      		$("#themeCode option").each(function(){
	                       			if($(this).text == <%=p.getThemeCode() %>){
	                       				$(this).attr("selected", true);
	                       			}
	                       		});
	                       		
	                       	});
	                      </script>
	                  </td>
				</tr>
				<tr>
				    <td>*상품명</td>
				    <td><input type="text" name="pName" id="pName" value="<%=p.getpName()%>" size="40px"></td>
				</tr>
				<tr>
				    <td>상품코드</td>
				    <td style="color: red;"><span>*자동으로 부여됨</span></td>
				</tr>
				<tr>
				    <td rowspan=2>*기본 이미지</td>
				 <td>기존파일 : <%=p.getBasicPath() %></td>
				</tr>
				<tr>
					 <td>수정파일 :  <input type="file" name="titleImg" id="titleImg" ></td>
					<!-- input타입은 이미지 미리보기가 없음!!!!@!!! value속성을 해도 -->
				 </tr>
				 <tr>
	           		<td width="100">세부 이미지1</td>
	               	<td><input type="file" name="subImg1" id="subImg1" ></td>
				</tr>
				<tr>
	               	<td width="100">세부 이미지2</td>
	               	<td><input type="file" name="subImg2" id="subImg2" ></td> 
				</tr>
				<tr>
	               	<td width="100">세부 이미지1</td>
	               	<td><input type="file" name="subImg3" id="subImg3" ></td>
				</tr>
				
				<!-- 기존의 세부이미지 파일이 있었다면-->
				<% if(list != null){ %>
				<% for(int i=1; i<list.size(); i++) {%>
				<tr>
					<td width=100>세부이미지[i]</td>
					<td><%=contextPath%>/<%=list.get(i).getFileNo() + list.get(i).getMdfFileName()%><br>
					<input type="file"  name="subImg1" id="subImg1">
					</td>
				</tr>
				<% } %>
				<% }else{ %>
				
				<% } %> 
				<tr>
					<td>*판매가</td>
					<td><input type="text" name="price" value="<%=p.getPrice()%>" style="width: 100px;" >원</td>
				</tr>
				<tr>
			       <td>*수량</td>
			       <td><input type="number" name="pStock" value="<%=p.getpStock()%>" style="width: 50px;">개</td>
				</tr>
				<tr>
				    <td rowspan=2>*상품상세 정보</td>
				    <td>기존파일 : <%=p.getDetailPath()%></td>
				</tr>
				<tr>
				    <td>수정 파일 : <input type="file" name="detailImg" id="detailImg"></td>
				</tr>
			</table>
	          
		    <br><br>        
		    <!-- 버튼 -->
		    <div align="right" class="btnArea">
		        <button id="backBtn" type="button" onclick="location.href = '<%=contextPath%>/list.pdt?currentPage=1';" >목록으로</button>
		        <!-- Button to Open the Modal -->
		        <button type="button" id="enrollBtn" data-toggle="modal" data-target="#updateModal">수 정</button>
		        <button type="button" id="deleteBtn" data-toggle="modal" data-target="#deleteModal">삭 제</button>
		    </div>
	
		    
		    <!-- update The Modal --> 
		    <div class="modal fade" id="updateModal"  align="center">
		       <div class="modal-dialog modal-dialog-centered">
		            <div class="modal-content" id="modal-content_pdt">
		            
		                <!-- Modal body -->
		                <div class="modal-body">
		               		 상품을 수정하시겠습니까?
		                </div>     
		                
		                <!-- Modal footer -->
		                <div class="modal-footer" align="center">
		                <button type="submit" id="okBtn" class="btn btn-warning">확인 </button>
		                <button type="button" id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">취 소</button>
		                </div>
		                
		            </div>
		        </div>
		    </div>
	    
		 	<!-- delete The Modal -->
		    <div class="modal fade" id="deleteModal" align="center" >
		      <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content" id="modal-content_pdt" >
		        
		                          
		          <!-- Modal body -->
		          
		          <div class="modal-body">
		            	상품을 삭제하시겠습니까?
		          </div>
		          
		          <div class="input-group mb-3" id="modalContent" >
		            <div class="input-group-prepend"  id="pwBar">
		              <span class="input-group-text" id="basic-addon11" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
		            </div>
		            <input name="adminPw" size="25" type="password" placeholder=" 관리자 비밀번호" aria-label="관리자 비밀번호" aria-describedby="basic-addon11">
		                           
		          </div>
		          
		          <!-- Modal footer -->
		          <div id="modalFooter">
		            <button type="button" id="okBtn1" class="btn btn-warning" onclick="return delPDT()">확 인</button>
		            <button type="button" id="cancleBtn1" data-dismiss="modal" class="btn btn-secondary">취 소</button>
		          </div>	        
		       
			       <script>
			       function delPDT(){
			       	if($("input[name=adminPw]").val() != <%=loginUser.getMemPwd()%>){
			       		alert("비밀번호가 일치하지 않습니다.");
			       		return false;
			       	}
			       	location.href="<%=contextPath%>/delete.pdt?pcode=<%=p.getpCode()%>";
			    			}
			       
			        </script>
		            </div>
		        </div>
		    </div>				        
	    
	            
	
	
	
	
			</form>
		</div>
      	   
    </div>	
    	

</body>
</html>