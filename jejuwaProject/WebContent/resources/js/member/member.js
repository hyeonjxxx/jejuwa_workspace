/**
 * 
 */

function loginError(){
    document.getElementById("erorrArea").setAttribute("style:block")
    
}

function validate(){

    // 유효성 검사 : 아이디,비밀번호,비밀번호확인,이름

    // input 요소 객체를 가져오기(작성되어있는 값(value) 가져오는게 아님)
    var memId = document.getElementById("memId");
    var memPwd = document.getElementById("memPwd");
    var pwdChecked = document.getElementById("pwdChecked");
    var memName = document.getElementById("memName");

    // 4) 이름 검사
    regExp = /^[가-힣]{2,}$/g;

    if(!regExp.test(memName.value)){
        $("memName_chk").show();

        memName.value ="";
        memName.focus();

        return false;
    }
}
