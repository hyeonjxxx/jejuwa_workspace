<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member"%> 
<%
	Member m = (Member)request.getAttribute("m");
	int memNo = m.getMemNo();
	String memId = m.getMemId();
	String memName = m.getMemName();
	String phone = m.getPhone();
	String email = (m.getEmail() == null) ? "" : m.getEmail();
	String memBirth = (m.getMemBirth() == null) ? "" : m.getMemBirth();
	
	// 이메일 emailId / domain 으로 나눠서 변수에 저장
	//String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
	String emailId = "";
	String domain = "";
	if(email != null){
		emailId = email.substring(0, email.indexOf("@"));
		domain = email.substring(email.indexOf("@")+1);
	}
	// 생년월일 "19980314" => "1998", "03", "14"
	String byear = "";
	String bmonth = "";
	String bday = "";
	if(memBirth != null){
		byear = memBirth.substring(0, 4);
		bmonth = memBirth.substring(4, 6);
		bday = memBirth.substring(6);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="resources/css/member/memberDetailView.css">
</head>
<body>

	<%@ include file="../common/adminPageMenubar.jsp" %>
		
	
    <div class="outer">
       <br>
       <h2>회원 상세정보</h2>
       <div class="divisionLine"></div>
       <br>
       
       <br><br><br><br>

       
       <!-- 회원 상세정보 -->
       <div class="viewArea">
           <form action="" method="post" id="memInfoTable">
               <table id="infoTable" border="1" align="center">

                    
                   <tr>
                       <th width="130">회원번호</th>
                       <td width="580"> &nbsp;&nbsp;&nbsp; <%= memNo %></td>
                       
                   </tr>

                   <tr>
                       <th>* 아이디</th>
                       <td> &nbsp;&nbsp;&nbsp; <%= memId %></td>
                       
                   </tr>
                   <tr>
                       <th>* 이름</th>
                       <td><input type="text" name="memName" maxlength="5" required value="<%= memName %>"></td>
                       
                   </tr>
                   <tr>
                       <th>비밀번호</th>
                       <td>

                           <div class="btn1" id="pwdBtn">
                               <a href="" data-toggle="modal" data-target="#resetPwd" >비밀번호 초기화</a>        
                           </div>

                       </td>
                               
                       
                   </tr>
                   <tr>
                       <th>* 전화번호</th>
                       <td><input type="text" name="phone" value="<%= phone %>"></td>
                       
                   </tr>
                   <tr>
                       <th>이메일</th>
                       <td>
                           <input type="text" name="emailHead" value="<%= emailId %>">
                           @ <input type="text" name="emailBody" value="<%= domain %>">
                           <select name="emailBody">
                               <option>직접입력</option>
                               <option>naver.com</option>
                               <option>gmail.com</option>
                               <option>kakao.com</option>
                           </select>
                           <!-- <input type="email"> -->
                       </td>
                       
                   </tr>
                   <tr>
                       <th>생년월일</th>
                       <td>
                            <!-- <input type="date" name="memBirth" value="2000-02-22"> -->
                            <!-- <input type="text" style="width:110px;"> 년 -->
                            <select name="year" id="year">
                            
                              <%for(int i=1930; i<=2021; i++){ %>
		                          <option ><%= i %></option>
		                          <% if(i == Integer.parseInt(byear)) {%>
		                          	<option selected><%= i %></option>
		                          <% } %>
                              <% } %>
                            </select> 년
                            
                            <select name="month" id="month" value="<%=bmonth %>">
                              <%for(int i=1; i<=12; i++){ %>
	                              <option ><%= i %></option>
	                              <% if(i == Integer.parseInt(bmonth)) {%>
	                             		<option selected><%= i %></option>
	                              <% } %>
                              <% } %>
                            </select> 월
                            
                            <select name="day" id="day" value="<%=bday %>">
                              <%for(int i=1; i<=31; i++){ %>
                              	<option ><%= i %></option>
                              	<% if(i == Integer.parseInt(bday)) {%>
	                             		<option selected><%= i %></option>
	                            <% } %>
                              <% } %>
                            </select> 일
                            
                        </td>
                       
                   </tr>                    
               </table>
               <br><br>
           </form>

           <div class="bottomArea" >
               
               <div class="btn1" id="dmBtn">
                   <a href="" id="btn1" data-toggle="modal" data-target="#deleteMember">회원탈퇴</a>
               </div> 
               
               <div class="btn2" id="listBtn">
                   <a href="" id="btn2">목록으로</a>
               </div> 
                
               <div class="btn2" id="udBtn">
                   <a href="" id="btn3" data-toggle="modal" data-target="#updateMember">회원정보 수정</a> 
               </div>   
               
           </div> 
	</div>
   </div>


       <!-- 비밀번호 초기화 모달 -->
       <!-- The Modal -->
       <div class="modal fade" id="resetPwd" align="center" >
         <div class="modal-dialog modal-dialog-centered">
           <div class="modal-content" >
           
                             
             <!-- Modal body -->
             <br>
             <div class="modal-body">
               	비밀번호를 초기화하시겠습니까?
             </div>
             
                 <!-- <input  size="30" class="form-control" type="password" placeholder="검색어를 입력하세요" id="resetPwd" name="">
                 <a href=""><span class="input-group-text " ><i class="bi bi-search"></i></span></a> -->
                            
             <div class="input-group mb-3" id="modalContent">
               <div class="input-group-prepend">
                 <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
               </div>
               <input size="25" type="password" placeholder=" 관리자 비밀번호" aria-label="관리자 비밀번호" aria-describedby="basic-addon1">
             </div>
             
             <!-- Modal footer -->
             <div id="modalFooter">
               <button id="okBtn" class="btn btn-warning">OK</button>
               <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
             </div>
           </div>
         </div>
       </div>




       <!-- 회원 탈퇴 모달 -->
       <!-- The Modal -->
       <div class="modal fade" id="deleteMember" align="center" >
           <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content" >
             
                               
               <!-- Modal body -->
               <br>
               <div class="modal-body">
                 	회원탈퇴 처리하시겠습니까?
               </div>
               
                   <!-- <input  size="30" class="form-control" type="password" placeholder="검색어를 입력하세요" id="resetPwd" name="">
                   <a href=""><span class="input-group-text " ><i class="bi bi-search"></i></span></a> -->
                              
               <div class="input-group mb-3" id="modalContent">
                 <div class="input-group-prepend">
                   <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
                 </div>
                 <input size="25" type="password" placeholder=" 관리자 비밀번호" aria-label="관리자 비밀번호" aria-describedby="basic-addon1">
               </div>
               
               <!-- Modal footer -->
               <div id="modalFooter">
                 <button id="okBtn" class="btn btn-warning">OK</button>
                 <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
               </div>
             </div>
           </div>
         </div>



         <!-- 회원 정보 수정 모달 -->
       <!-- The Modal -->
       <div class="modal fade" id="updateMember" align="center" >
           <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content" >
             
                               
               <!-- Modal body -->
               <br>
               <div class="modal-body">
                 	회원정보를 수정하시겠습니까?
               </div>
               
                   <!-- <input  size="30" class="form-control" type="password" placeholder="검색어를 입력하세요" id="resetPwd" name="">
                   <a href=""><span class="input-group-text " ><i class="bi bi-search"></i></span></a> -->
                              
               <div class="input-group mb-3" id="modalContent">
                 <div class="input-group-prepend">
                   <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
                 </div>
                 <input size="25" type="password" placeholder=" 관리자 비밀번호" aria-label="관리자 비밀번호" aria-describedby="basic-addon1">
               </div>
               
               <!-- Modal footer -->
               <div id="modalFooter">
                 <button id="okBtn" class="btn btn-warning">OK</button>
                 <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
               </div>
             </div>
           </div>
         </div>

</body>
</html>