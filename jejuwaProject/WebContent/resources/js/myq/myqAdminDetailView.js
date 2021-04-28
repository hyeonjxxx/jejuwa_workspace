$(document).ready(function(){

    $("#answer").click(function(){
        $.ajax({
            url: "ans.amyq",
            type: "get",
            data: {
                answer_text:$("#answer_text").val(), // answer_text라는 key값으로 id가 answer_text인 값을 넘기겠다. 
                getMyq_no:$("#getMyq_no").val()
            },
            success:function(result){
                if(result > 0){
                    // 댓글 성공하면 내가 쓴 댓글이 최상단에 붙여지기 (갱신된 리스트 다시 조회해서 뿌려줘야함)
                    selectAnsList();
                } else{
                    // 답글 실패
                }
            },
            error:function(){
                console.log("댓글 작성용 ajax 통신 실패");
            }
        })
    })
    function selectAnsList(){
        $.ajax({
            url:"detail.amyq",
            success: 
            console.log("성공!")
        })
    }

})