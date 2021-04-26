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
        <br>
        <h2>회원탈퇴</h2>
        <div class="divisionLine"></div>
        <br>
        
        <br>
        
        
        <!-- 회원 상세정보 -->
        <div class="viewArea" align="center">
            
            <div class="withdrawalArea">

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

                <br><br>

                <div class="area2">
                    <table id="area2">
    
                        <tr>
                            <th align="center">탈퇴 사유 </th>
                        </tr>                        
                        <tr>
                            <td>
                                <input type="radio" class="reason"> 아이디 변경을 위해 탈퇴 후 재가입<br>
                                <input type="radio" class="reason"> 사이트 이용 불편 <br>
                                <input type="radio" class="reason"> 상품의 다양성/품질 불만<br>
                                <input type="radio" class="reason"> 판매 정책에 대한 불만  <br>
                                <input type="radio" class="reason"> 기타 <input type="text" size=40 placeholder="사유를 입력해주세요">
                            </td>
                        </tr>
                    </table>   
                </div>
                <br><br>
            </div>
            <div>
                <input type="checkbox"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.

            </div>
            <div class="bottomArea">
    
                 <!-- 버튼 (수 정) -->
                <div class="btn" align="center">
                    <a id="btn1" a href="" data-toggle="modal" data-target="#withdrawal" >회원 탈퇴</a> 
                </div>   
                
            </div>


            <!-- The Modal -->
            <div class="modal fade" id="withdrawal" align="center" >
                <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" id="modal-content2">
                
                    <!-- Modal body -->
                    <br>
                    <div class="modal-body">
                        회원탈퇴를 하시겠습니까?
                    </div>
                    
                                
                    <div class="input-group mb-3" id="modalContent">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1" ><i class="bi bi-key" style="padding-left:3px;"></i></span>
                    </div>
                    <input name="memPwdPwd2" size="25" type="password" placeholder=" 비밀번호" aria-label=" 비밀번호" aria-describedby="basic-addon1">
                        
                    </div>
                    
                    <!-- Modal footer -->
                    <div id="modalFooter">
                    <button id="okBtn" class="btn btn-warning" onclick="return updateMember();">OK</button>
                    <button id="cancleBtn" data-dismiss="modal" class="btn btn-secondary">Cancle</button>
                    </div>
                    <script>
                            function updateMember(){
                                if($("input[name=memPwdPwd2]").val() != <%= memPwd %>){
                                    alert("비밀번호가 일치하지 않습니다.");
                                }else{
                                    $("#memInfoTable").submit();
                                }
                            }
                    </script>
                
                </div>
                </div>
            </div>
			
		</div>
    </div>

</body>
</html>