$(document).ready(function(){

    

    $("#answer").click(function(){
        $.ajax({
            url: "/ans.amyq",
            type: "post",
            data: {
                answer_text:$("#answer_text").val(), // answer_text라는 key값으로 id가 answer_text인 값을 넘기겠다. 
                getMyq_no:$("#getMyq_no").val()
            },
            success:function(result){
                if(result > 0){
                    // 댓글 성공하면 내가 쓴 댓글이 최상단에 붙여지기 (갱신된 리스트 다시 조회해서 뿌려줘야함)

                    // 깔끔하게 입력했던 textarea의 내용도 비워줘야 함 => replyContent에 ""로 깔끔하게 비워줌
                    $("#replyContent").val("");
                } else{
                    // 답글 실패
                }
            },
            error:function(){
                console.log("댓글 작성용 ajax 통신 실패");
            }
        })
    })
})