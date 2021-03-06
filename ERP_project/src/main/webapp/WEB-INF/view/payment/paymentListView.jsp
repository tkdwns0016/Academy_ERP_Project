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
                    <p><u>???????????????</u></p>
                </div>
            <div class="paymentView-Line-div">
                <table class="paymentView-Line-table" border="2px solid black">
                    <tr>
                        <td rowspan="3" style="width: 30px;">???<br>???</td>
                        <td width="70px">?????????</td>
                        <td width="70px">?????????</td>

                    </tr>
                    <tr class="payment-View-Line-paymentName">
                        <td>${selectlist[0].writer }</td>
                        <td>
                        	<c:if test="${selectlist[0].paymentStatus=='????????????' }">${selectlist[0].approver }</c:if>
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
                       &nbsp;&nbsp; * ????????? : ?????? 20??? ?????? ????????? 1??? 9?????? ??????.<br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       ?????? 20????????? ???????????? ?????? ??? ?????? ???????????? ???????????? ????????? ?????????<br>
                       &nbsp;&nbsp; * ??????????????? ??????: ????????? ????????? ????????? ??????<br>
                       &nbsp;&nbsp; * ??????????????? ?????? : ???????????? ????????? ??????????????? ??????<br>
                    </p>
                    <p>
                        <font color="red">&nbsp;&nbsp; * ?????? ?????? ?????? : ??????, ??????, ?????????(3????????? ?????? ?????? + ??? 00???)</font><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ?????? ?????? : 7.15. ??????. ?????????<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ????????? ?????? : 7.16. ??????. ?????????, ????????? ??? 12???<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ????????? ?????? : 7.17 ????????????. ?????????.?????? ~ ?????????.<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ???????????? ?????? : 7.18 ???????????? 3???. ?????????. [??????, ????????????, ???????????????]
                    </p>

            </div>
            <div class="payment-View-history-superscript">
                ?????????: ${selectlist[0].accountCompany}

                
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ?????????: ${selectlist[0].writer}
            </div>
            <div class="payment-View-history">
              
                <table class="payment-View-history-table" border="1px solid black" >
                    <tr>
                        <th width="10%">??????</th>
                        <th width="12%">??????</th>
                        <th width="%">????????????</th>
                        <th >????????????</th>
                        <th>??????</th>
                        <th>????????????</th>
                    </tr>
                    
                    <c:forEach var="sl" items="${selectlist}"> 
                    <tr style="text-align: center;">
                        <td>${sl.division }</td>
     
                        <td class="ammountPrice">${sl.ammountPrice}</td>
                        <td>${sl.type }</td>
                        <td>${sl.detail }</td>
                        <td>${sl.remark }</td>
                        <td>
                        <c:if test=' ${ not empty sl.receipt}' >?????????.jpg</c:if>
                        
                        </td>
                    </tr>
					<input type="hidden" value="${sl.allAmmountPrice }" class="paymentlist-allsum">
                    </c:forEach>
                    <tr>
                        <td style="text-align: center; height: 10%;">
                            ??????
                        </td>
                        <td colspan="5" class="paymentViewList-sumif">
                         
                
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" height= "10%" style="background-color: lavender;">
                            ??????????????? ????????? ????????? ??????????
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="payment-last-div">
        <c:if test="${selectlist[0].approver== empl.name}">
            <button class="payment-View-button1" onclick="approveConfirm(${selectlist[0].paymentBoardId})">??????</button>
            <button class="payment-View-button2">??????</button>
        </c:if>
        	<button class="payment-View-button2" onclick="paymentViewPrint()">??????</button>
            <button class="payment-View-button2" onclick="window.close()">??????</button>
  
        </div>
    </div>


    <script>
    $(".paymentViewList-sumif").val($(".paymentlist-allsum"));

    
    
    function paymentViewPrint(){
    	window.print();
    }
  
    function approveConfirm(id) {
 
    	
    	var pay = confirm("????????? ?????????????????????????");
    	
    	if(pay){
	    	location.href='/paymentApprove	?id='+id;
   	   	}
    	}
    	
	
    </script>
</body>
</html>