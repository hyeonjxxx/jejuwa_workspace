$(document).ready(function(){
                
    //

    
    // 일부선택시 상세보기로 넘어가지 않도록
    
    
    // 체크박스 : 전체선택
    $("#checkAll").click(function cAll(){
        if($("#checkAll").prop("checked")){
            $("input[type=checkbox]").prop("checked", true);
        }else{
            $("input[type=checkbox]").prop("checked", false);
        }
    })


})
