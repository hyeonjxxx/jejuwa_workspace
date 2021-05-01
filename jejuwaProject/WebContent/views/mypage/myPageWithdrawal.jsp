<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- content css-->
<link rel="stylesheet" type="text/css" href="resources/css/mypage/myPageWithdrawal.css">
</head>
<body>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	<%
		int memNo = login.getMemNo();
		String memId = login.getMemId();
		String memPwd = login.getMemPwd();
	%>


	<div class="outer">
        <br><br>
        <!-- 회원 상세정보 -->
        <div class="viewArea" align="center">
            
            <form action="<%= contextPath %>/userDelete.me" method="post"> 
            <div class="withdrawalArea">
			<input type="hidden" name="memNo" value="<%= memNo %>">
                <div align="left">제주와를 떠나기 전에...</div>

                <br>

                <table id="area1">
                    <tr>
                        <th align="left">※ 탈퇴 안내 </th>
                    </tr>                        
                    <tr>
                        <td>
                            회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
                        <br><br>
                        사용하고 계신 아이디(<b style="color:orange"><%=memId %></b>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>
                        탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다. <br>
                        <br>
                        탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다. <br>
                        회원정보 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
                        </td>
                    </tr>
                </table>

                <br>

                <div class="area2">
                    <table id="area2">
    
                        <tr>
                            <th align="center">탈퇴 사유 </th>
                        </tr>                        
                        <tr>
                            <td>
                                <input id="reason1" type="radio" name="reason" class="reason" value="아이디 변경을 위해 탈퇴 후 재가입"> <label for="reason1">아이디 변경을 위해 탈퇴 후 재가입</label> <br>
                                <input id="reason2" type="radio" name="reason" class="reason" value="사이트 이용 불편"> <label for="reason2">사이트 이용 불편</label> <br>
                                <input id="reason3" type="radio" name="reason" class="reason" value="상품의 다양성/품질 불만"> <label for="reason3">상품의 다양성/품질 불만</label> <br>
                                <input id="reason4" type="radio" name="reason" class="reason" value="판매 정책에 대한 불만"> <label for="reason4">판매 정책에 대한 불만</label> <br>
                                <input id="reason5" type="radio" name="reason" class="reason" value="기타 "> <label for="reason5">기타 <input name="reason" type="text" size=40 placeholder="사유를 입력해주세요"></label>
                            </td>
                        </tr>
                    </table>   
                </div>
                <br><br>
            </div>
            <br><br>
            <div>
                <input id="agreeBtn" type="checkbox"> <label for="agreeBtn">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
            </div>
            <br>
            <div class="bottomArea">
    
                 <!-- 버튼 (회원탈퇴) -->
                <div class="btn withdrawalBtn" align="center">
                    <a id="btn1" a href="" data-toggle="modal" onclick="return checkAgree();" data-target="#withdrawal" >회원탈퇴</a> 
                </div>   
                
            </div>

			<!-- 회원 탈퇴 모달 -->
            <!-- The Modal -->
            <div class="modal fade" id="withdrawal" align="center" >
                <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" id="withdrawalModalContent">
                
                    <!-- Modal body -->
                    <br>
                    <div class="modal-body">
                        	회원탈퇴를 하시겠습니까?
                    </div>
                    
                               
                    <div class="input-group mb-3" id="modalContent">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
                    </div>
                    <input name="memPwd3" size="25" type="password" placeholder=" 비밀번호" aria-label=" 비밀번호" aria-describedby="basic-addon1">
                        
                    </div>
                    
                    <!-- Modal footer -->
                    <div id="modalFooter">
                    <button id="okBtn" class="btn btn-warning" onclick="return updateMember();">OK</button>
                    <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
                    </div>
                    <script>
                    	
                    	 	function checkAgree(){
                    	 		if($('input:checkbox[id="agreeBtn"]').is(":checked") == false){
                    	 			alert("탈퇴 약관 동의가 필요합니다.");
                    	 			$("#btn1").attr("data-target", false);
                    	 			//$('input:checkbox[id="agreeBtn"]').focus();
                    	 			
                    	 		} else{
                    	 			$("#btn1").attr("data-target", "#withdrawal");
                    	 		}
                    	 	}
                    
                            function updateMember(){
                            		
                            	if($("input[name=memPwd3]").val() != "<%=memPwd%>"){
                                    alert("비밀번호가 일치하지 않습니다.");
                      				return false;
                                }
                            }
                    </script>
                	
                </div>
                </div>
            </div>
			</form>
		</div>
    </div>
    
    </div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>