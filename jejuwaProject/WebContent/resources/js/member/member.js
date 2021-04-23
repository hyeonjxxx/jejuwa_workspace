/**
 * 
 */
function loginError(){
    // 로그인 유효성 검사 
    var memId = document.getElementById("memId");
    var memPwd = document.getElementById("memPwd");

    if(memId.value !=  )    
    
}


// 전체약관동의 버튼클릭시, 전체 동의 또는 전체해제
function all_chk(){
    if(this.checked){
        setCheckbox(chk_ns, true);
    } else{
        setCheckbox(chk_ns, false);
    }
}

function validate(){

    


    // 유효성 검사 : 아이디,비밀번호,비밀번호확인,이름

    // input 요소 객체를 가져오기(작성되어있는 값(value) 가져오는게 아님)
    var memId = document.getElementById("memId");
    var memPwd = document.getElementById("memPwd");
    var pwdChecked = document.getElementById("pwdChecked");
    var memName = document.getElementById("memName");

    // 1) 아이디 검사(첫글자는 반드시 영문자로, 그리고 영문자, 숫자 포함하여 총 4~12자로 입력하시오.)
    var regExp = /^[a-z][a-z\d]{3,11}$/;

    if(!regExp.test(memId.value)){
    $("#id_chk").show();
    
    memId.value =""; // 사용자가 작성한 아이디 지우기
    memId.focus(); // 커서가 깜빡깜빡

    return false;
}

    // 2) 비밀번호 검사(영문자, 숫자, 특수문자(!@#$%^&*)로 총 8~15자로 입력하시오.)

    regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
    if(!regExp.test(memPwd.value)){
    $("#password_chk").show();

    memPwd.value ="";
    memPwd.focus();

    return false;
}

    // 3) 비밀번호 일치 검사(위의 비밀번호와 일치하게 입력하시오.)

    if(memPwd.value != pwd_chk.value){
    $("#pwd_chk").show();

    pwdChecked.select(); // 비밀번호 확인쪽이 선택됨.

    return false;
}

    // 4) 이름 검사
    regExp = /^[가-힣]{2,}$/g;

    if(!regExp.test(memName.value)){
        $("#memName_chk").show();
        memName.value ="";
        memName.focus();

        return false;
    }


}
