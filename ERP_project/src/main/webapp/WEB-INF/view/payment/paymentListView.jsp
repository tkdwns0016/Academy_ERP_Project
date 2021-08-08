<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>

    @font-face {
        font-family: 'NEXON Lv1 Gothic OTF';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    .payment-View-header{
        text-align: center;
        font-size: 35px;
    }
	.container-payment-main{
        width: 1200px;
        height: 1300px;
        position: relative;
 
        top: 10%;

    }

    .payment-mid-container{
        width: 1000px;
        height: 1200px;
        border: 1px solid black;
        position: relative;
        left: 2%;
        top: 5%;
    }

    .paymentView-Line-div{
        text-align: center;
        float: right;
        margin-right: 7%;
        
    }

    .paymentView-Line-table{
        text-align: center;
        border-collapse: collapse;
        font-size: 12px;

    }

    .payment-View-Line-paymentName td{
        height: 60px;
    }

    .payment-View-Notice{
        border: 3px solid dimgrey;
        width: 850px;
        height: 300px;
        position: relative;
        left: 7.5%;
        top: 10%;

        font-size: 16px;
        font-family: "NEXON Lv1 Gothic OTF";
    }

    .payment-View-history-superscript{
        position: relative;
        left: 7.5%;
        top: 13%;
    }

    .payment-View-history{
        
        position: relative;
        width: 855px;
        height: 500px;
        left: 7.5%;
        top: 14%;

    }

    .payment-View-history th{
        background-color: lavender;
        height: 40px;

    }


    .payment-View-history-table{
        border-collapse: collapse;
        width: 100%;
        height: 100%;
    }

    .payment-last-div{
        border: 1px solid black;
        width: 1000px;
        height: 37px;
        position: relative;
        left: 2%;
        top:2%
    }
    
    .payment-View-button1{
        
        width: 60px;
        height: 30px;
        border: 1px solid gainsboro;
        background-color: lightskyblue;
        position: relative;
        left: 1%;
        top: 8%;

    }
    .payment-View-button2{
        
        width: 60px;
        height: 30px;
        border: 1px solid gainsboro;
        background-color: ghostwhite;
        position: relative;
        left: 1%;
        top: 8%;
    }
    
    .payment-View-button1:hover{
        background-color: gainsboro;
    }

    .payment-View-button2:hover{
        background-color: gainsboro;
    }
</style>
</head>
<body>
    <div class="container-payment-main">
            <div class="payment-mid-container">
                <div class="payment-View-header">
                    <p><u>지출결의서</u></p>
                </div>
            <div class="paymentView-Line-div">
                <table class="paymentView-Line-table" border="2px solid black">
                    <tr>
                        <td rowspan="3" style="width: 30px;">결<br>재</td>
                        <td width="70px">기안자</td>
                        <td width="70px">결제자</td>

                    </tr>
                    <tr class="payment-View-Line-paymentName">
                        <td>${selectlist[0].writer }</td>
                        <td>
                        	<c:if test="${selectlist[0].paymentStatus=='결제완료' }">${selectlist[0].approver }</c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>${selectlist[0].writeDate }</td>
                        <td>${selectlist[0].approverDate}</td>
                    </tr>
                </table>
            </div>

            <div class="payment-View-Notice">
                    <p>
                       &nbsp;&nbsp; * 석식비 : 평일 20시 이후 야근시 1인 9천원 한도.<br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       또한 20시이후 야근하고 퇴근 후 회사 근처에서 식사하는 경우는 인정함<br>
                       &nbsp;&nbsp; * 야근택시비 청구: 해당일 출퇴근 기록부 첨부<br>
                       &nbsp;&nbsp; * 도서구입비 청구 : 도서명이 명시된 거래명세서 첨부<br>
                    </p>
                    <p>
                        <font color="red">&nbsp;&nbsp; * 적요 입력 예시 : 날짜, 사유, 사용자(3명까지 이름 표기 + 외 00명)</font><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 식대 예시 : 7.15. 석식. 송민현<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 회식비 예시 : 7.16. 회식. 오주원, 박정길 외 12명<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 택시비 예시 : 7.17 야근택시. 김상준.회사 ~ 의정부.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 도서구매 예시 : 7.18 도서구매 3권. 박정길. [개미, 종이여자, 달빛조각사]
                    </p>

            </div>
            <div class="payment-View-history-superscript">
                거래처: ${selectlist[0].accountCompany}

                
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                작성자: ${selectlist[0].writer}
            </div>
            <div class="payment-View-history">
              
                <table class="payment-View-history-table" border="1px solid black" >
                    <tr>
                        <th width="10%">구분</th>
                        <th width="12%">금액</th>
                        <th width="%">증빙유형</th>
                        <th >상세내용</th>
                        <th>비고</th>
                        <th>첨부파일</th>
                    </tr>
                    
                    <c:forEach var="sl" items="${selectlist}"> 
                    <tr style="text-align: center;">
                        <td>${sl.division }</td>
     
                        <td class="ammountPrice">${sl.ammountPrice}</td>
                        <td>${sl.type }</td>
                        <td>${sl.detail }</td>
                        <td>${sl.remark }</td>
                        <td>
                        <c:if test=' ${ not empty sl.receipt}' >영수증.jpg</c:if>
                        
                        </td>
                    </tr>
					<input type="hidden" value="${sl.allAmmountPrice }" class="paymentlist-allsum">
                    </c:forEach>
                    <tr>
                        <td style="text-align: center; height: 10%;">
                            합계
                        </td>
                        <td colspan="5" class="paymentViewList-sumif">
                         
                
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" height= "10%" style="background-color: lavender;">
                            업무처리에 관련된 비용이 맞는지?
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="payment-last-div">
        <c:if test="${selectlist[0].approver== empl.name}">
            <button class="payment-View-button1" onclick="approveConfirm(${selectlist[0].paymentBoardId})">결제</button>
            <button class="payment-View-button2">반려</button>
        </c:if>
        	<button class="payment-View-button2" onclick="paymentViewPrint()">인쇄</button>
            <button class="payment-View-button2" onclick="window.close()">닫기</button>
  
        </div>
    </div>


    <script>
    $(".paymentViewList-sumif").val($(".paymentlist-allsum"));

    
    
    function paymentViewPrint(){
    	window.print();
    }
  
    function approveConfirm(id) {
 
    	
    	var pay = confirm("정말로 승인하시겠습니까?");
    	
    	if(pay){
	    	location.href='/paymentApprove	?id='+id;
   	   	}
    	}
    	
	
    </script>
</body>
</html>