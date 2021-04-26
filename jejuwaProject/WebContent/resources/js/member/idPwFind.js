        // 아이디찾기 핸드폰 인증
    $(document).ready(function(){

  
        $("#id_mobile_auth").click(function(){
            console.log("핸드폰 일치 확인");
    
            $.ajax({
                url:"idFindMobileAuth.me",
                type:"POST",
                data:{
                    idFind_name: $('#idFind_name').val(),
                    id_phone: $('#id_phone').val()
                },
                success: function(res){
                    console.log(res.result);
                },
                error: function(){
                    alert("이름과 핸드폰번호가 일치하지 않습니다. 다시 확인해주세요.")
                    $('#idFind_name').one('focus', focus());
                }
            }) 
        })
    })    