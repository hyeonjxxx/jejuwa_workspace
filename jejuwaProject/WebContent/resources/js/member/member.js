/**
 * 

function loginError(){
    // 로그인 유효성 검사 
    var memId = document.getElementById("memId");
    var memPwd = document.getElementById("memPwd");

    if(memId.value !=  
    
}

 */



$(document).ready(function(){
    // 로그인 유효성 검사
    $('#memName').focusout(function() {
        // 회원가입 유효성 검사 : 이름,아이디,비밀번호,비밀번호확인
        // 1) 이름 검사
        var regExp = /^[가-힣]{2,}$/g;

        if(!regExp.test( $('#memName').val()  )){
            $('#memName_chk').change($("#memName_chk").html('<label style="color:red;">이름이 잘못입력되었습니다.</label>'));
            
            $('#memName').val("");
            $('#memName').one('focus',focus());
            return false;
        } else{
            $('#memName_chk').change($("#memName_chk").html('<label style="color:green;">좋은 이름이시네요 :)</label>'));
        }

    });

    // input 요소 객체를 가져오기(작성되어있는 값(value) 가져오는게 아님)

    // 2) 아이디 검사(첫글자는 반드시 영문자로, 그리고 영문자, 숫자 포함하여 총 4~12자로 입력하시오.)

    $("#memId").focusout(function(){
        var regExp = /^[a-z][a-z\d]{3,11}$/;

        if(!regExp.test( $('#memId').val()  )){
            $('#id_check').change($("#id_check").html('<label style="color:red;">유효햔 아이디로 입력해주세요.</label>'));
            
            $('#memId').val("");
            $('#memId').one('focus',focus());
            return false;
        } else{
            $('#id_check').change($("#id_check").html('<label style="color:green;">좋은 아이디 입니다.</label>'));
        }
    })


    // 3) 비밀번호 검사(영문자, 숫자, 특수문자(!@#$%^&*)로 총 8~15자로 입력하시오.)

    $("#memPwd").focusout(function(){
        var regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;

        if(!regExp.test( $('#memPwd').val()  )){
            $('#password_check').change($("#password_check").html('<label style="color:red;">유효한 비밀번호로 입력해주세요.</label>'));
            
            $('#memPwd').val("");
            $('#memPwd').one('focus',focus());
            return false;
        } else{
            $('#password_check').change($("#password_check").html('<label style="color:green;">야무진 비밀번호입니다 :)</label>'));
        }
    })

    // 4) 비밀번호 일치 검사(위의 비밀번호와 일치하게 입력하시오.)
    $("#pwdChecked").keyup(function(){
        if($('#memPwd').val() == $("#pwdChecked").val()){
                
                $('#pwd_chk').change($("#pwd_chk").html('<label style="color:green;">비밀번호가 일치합니다.</label>'));


            } else{
                $('#pwd_chk').change($("#pwd_chk").html('<label style="color:red;">비밀번호가 일치하지 않습니다.</label>'));
                $('#pwdChecked').one('focus',focus());

                return false;
            }
    })

    // 전체약관동의 버튼클릭시, 전체 동의 또는 전체해제
    $(".join_content").on("click", "#chk_all", function () {
        $(this).parents(".join_content").find('input').prop("checked", $(this).is(":checked"));
    });
});
    