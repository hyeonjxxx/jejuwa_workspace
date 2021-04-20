<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%@ include file = "../common/mypageMenubar.jsp" %>
	

	<style>
	
	div{border: 1px  gray; box-sizing: border-box;}
ul, li, em{list-style: none;}
ul{
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    }
li{display: list-item;}
*{box-sizing: border-box;}

a{text-decoration: none; margin: -30px;}
.wrap{width: 1000px; height:800px;  margin: auto;}

.wrap>div{width: 100%;}
.content{height: 100%;}


.content>div{height: 100%; float: left;}
.content_1{width: 25%;}
.content_2{width: 75%;}

#Menu a{
    padding-top: 10px;
    font-size: 20px;
    line-height: 24px;
    letter-spacing: -1px;
    color: black;
    margin-left: -2px;
    }
.content_1 li a{
    font-size: 13px;
    color: black;
    letter-spacing: -0.8px;
    }
.content_1 li a:hover, #Menu a:hover{color: orange;}
.mypageStep {
    overflow: hidden;
    width: 100%;
    margin-top: 10px;
    border-radius: 10px;
    background-color: lightgray;
    }
.mypageStep li {
    float: left;
    position: relative;
    width: 20%;
    height: 117px;
    font-size: 20px;
    line-height: 6;
    }
.mypageStep li:first-child {background: none;}
.mypageStep em{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 25px;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }    
.mypageStep span{
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center;
    top: 70px;
    font-size: 16px;
    line-height: 22px;
    }

.user{
    font-size: 14px;
    line-height: 20px;
    position: relative;
    height: 51px;
    padding: 8px 0 0 30px;
    background-color: orange;
    }
.welcome{
    margin: 0;
    padding: 0;
    float: left;
    margin-left: -20px;
    font-size: 18px;
    line-height: 3px;
    font-weight: 700;

    }
.pointbox{
    word-spacing: -1px;
    font-size: 14px;
    line-height: 20px;
    padding: 19px 0;
    border: 1px solid lightgray;
    }

#reservation, #coupon{
    word-spacing: -1px;
    font-size: 20px;
    line-height: 20px;
    float: left;
    width: 50%;
    text-align: center;
    }   


#count{
    word-spacing: -1px;
    text-align: center;
    margin: 0;
    padding: 0;
    text-decoration: none;
    display: inline-block;
    padding-left: 15px;
    font-size: 30px;
    color: orange;
    font-style: normal;
    }

.unit{
    font-size: 20px;
    font-style: normal;

    }



.outer{
    margin: auto;
    }

th{padding: 10px;}

.coupon-content { margin-top: 10px;
    
}
.Information{
    margin: 20px;
    font-size: small;
    color: gray;
}
	</style>
	</head>
	
	
	
	<body>
	
     <!-- 마이페이지 컨텐츠 -->
            <div class="content_2">
             
                 
                    <div class="pointbox">
                        <ul class="info" id="pointinfo">
                            <li id="reservation" onclick="">
                                <span>예약</span>
                                <a href="" id="count">1 <em class="unit">건</em></a>
                            </li>

                            <li id="coupon" onclick="">
                                <span>쿠폰</span>
                                <a href="" id="count">1 <em class="unit">개</em></a>
                            </li>
                            <br>
                        </ul>
                    </div>
      
                

               <br><br>

               <div class="outer">
                
    

                <table>
                    <tbody>
                        <!-- 조회된 결과가 있을 경우 -->
                        <div class="coupon-content">
                        
    <table class="table table-hover">
        <thead>
            <tr>
                <tr align="center">
                    <th width>발급일</th>
                    <th width>쿠폰명</th>
                    <th width>사용조건</th>
                    <th width>사용기간</th>
                </tr>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>2021-02-11</td>
                <td>이달의 이벤트(30%)</td>
                <td>70,000원 이상 구매시</td>
                <td>2021-03-21 ~ 2021-04-12</td>
            </tr>
            <tr>
                <td>2021-01-22</td>
                <td>생일축하쿠폰(20%)</td>
                <td>30,000원 이상 구매시</td>
                <td>2021-02-24 ~ 2021-04-22</td>
            </tr>
            <tr>
                <td>2020-12-27</td>
                <td>웰컴할인쿠폰(10%)</td>
                <td>50,000원 이상 구매시</td>
                <td>2020-07-05 ~ 2021-07-08</td>
            </tr>
        </tbody>
    </table>
    <br><br>
                        </div>

                    
                        <!-- 조회된 결과가 없을 경우-->
                        <!--
                        <tr>
                            <td colspan="6" align="center">조회된 리스트가 없습니다.</td>
                        </tr>
                        -->
        
                        
                    </tbody>
                </table>
                    <hr>
                    <div class="Information">
                    <p>
                        * 발급받으신 쿠폰을 주문/결제 시 적용하실 수 있습니다. <br>
                        * 사용기간이 만료되거나 사용한 쿠폰은 보유 목록에서 자동으로 삭제됩니다. <br>
                        * 주문/취소 시 이용기간이 남아 있는 쿠폰인 경우 재발급됩니다. <br>
                    </p>
                    </div>

            </div>

            
        </div>
    </div>

            

</body>
</html>