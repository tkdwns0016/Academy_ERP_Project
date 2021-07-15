<%@page import="payment.Payment"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<style>
  

  
  .back{
      background-color: ghostwhite;
  }

  .container-payment-writer{
      width: 1400px;
      height: 500px;
      background: #fff;
      box-shadow: 8px 8px 20px 0 rgba(0, 0, 0, 0.15)
  }

  .payment-table{
      width: 1300px;
      margin-left: 50px;
  }

  .payment-table td:first-child{
    text-align: center;
    width:150px;
  }

  .payment-table2{
      width: 1300px;
      margin-left: 50px;
  }

  .payment-writer-div{
      
      text-align: center;
  }

  .noread{
  background-color: #f5f5f5;
  }

  
</style>
<body>
    <div class="container-payment-writer">
    <form id="form" action="/paymentResult" method="post" enctype="multipart/form-data">
    <div class="payment-writer-div">
        <br>
        <h2>지출결의서</h2>
       <button type="button" style="float: right; margin-right: 50px;" >취소</button>&nbsp;<button style="float: right; margin-right: 5px;">작성</button>
    </div>
    <table  style="border-collapse: collapse;" class="payment-table">
        <tr>
            <td class="back" >기준일</td>
            <td class="back" colspan="8">  <input type="date" name="startDate" class="star"/>
                &nbsp;~&nbsp;
                <input type="date" name="endDate">
            </td>
        </tr>
        <tr>
            <td class="back">거래처</td>
            <td class="back" colspan="8">
                <button type="button" onclick="account()"><img src="image/돋보기.png" width="10px"></button><input type="text" name="accountCompany" class="payment-account noread" readonly="readonly" >
            </td>
        </tr>
        <tr>
            <td class="back">작성자</td>
            <td class="back" colspan="8">
                <input type="text" name="writer" readonly="readonly" class="noread" value="김상준">
            </td>
        </tr>
        <tr>
            <td class="back">부서</td>
            <td  class="back" colspan="8">
                <input type="text" name="writerDepartment" readonly="readonly" class="noread" value="개발">
            </td>
        </tr>
        <tr>
            <td class="back" style="border-bottom: 2px solid black ;">결제라인</td>
            <td class="back" colspan="8" style="border-bottom: 2px solid black ;">
                <button type="button" onclick="paymentline()"><img src="image/돋보기.png" width="10px"></button><input type="text" name="approver" class="payment-paymentLine noread" readonly="readonly" > 
            </td>
        </tr>
        <tr height="20px">

        </tr>
        </table>
        <table class="payment-table2">
        <tr>
            <td colspan="8">결제작성
                <button type="button" onClick="addon()">추가</button>
                <button type="button" onclick="deleteon()">삭제</button>
            </td>
        </tr>
        <tr>
          
         
                    <th width="3%" style="background-color: aliceblue;">구분</th>
                    <th width="1%" style="background-color: aliceblue;">상세내역</th>
                    <th width="1%" style="background-color: aliceblue;">증빙유형</th>
                    <th width="1%" style="background-color: aliceblue;">공급가액</th>
                    <th width="5%" style="background-color: aliceblue;">부가세</th>
                    <th width="1%" style="background-color: aliceblue;">합계</th>
                    <th width="1%" style="background-color: aliceblue;">첨부파일</th>
                    <th width="1%" style="background-color: aliceblue;">비고</th>
                </tr>
                <tr class="trcount">
                    <td>
                        <select name="division">
                            <option value="식대">식대</option>
                            <option value="소모품">소모품</option>  
                            <option value="출장비">출장비</option>  
                            <option value="조식식대(임직원)">조식식대(임직원)</option>  
                            <option value="야근식대(임직원)">야근식대(임직원)</option>  
                            <option value="유류비">유류비</option>  
                            <option value="부서회식비">부서회식비</option>                    
                        </select>
                    </td>
                    <td><input type="text" name="detail"></td>
                  
                    <td>
                        <select name="type">
                            <option value="개인카드영수증">개인카드영수증</option>  
                            <option value="법인카드">법인카드</option>
                            <option value="현금">현금</option>
                            <option value="외상">외상</option>                    
                        </select>
                    </td>
                    <td><input type="text" size="10" name="supplyPrice"></td>
                    <td><input type="text" size="10" name="VAT"></td>
                    <td><input type="text" size="10" name="ammountPrice"></td>
                    <td><input type="file" name="receipt" class="receipt"></td>
                    <td><input type="text" name="remark"></td>
                </tr>
    </table>
</form>
</div>


<script>

var date = new Date();
var year = date.getFullYear();
var month = ("0" + (1 + date.getMonth())).slice(-2);
var day = ("0" + date.getDate()).slice(-2);


$("input").eq(1).prop("min",year+"-"+month+"-"+day);


function addon(){
        var trCnt =$(".payment-table2 tr").length;
        if(trCnt <7 ){
            var innerHtml = "";
            innerHtml +='<tr>';
       
            innerHtml +='<td><select name="division"><option value="식대">식대</option><option value="소모품">소모품</option><option value="출장비">출장비</option> <option value="조식식대(임직원)">조식식대(임직원)</option>';  
            innerHtml +='<option value="야근식대(임직원)">야근식대(임직원)</option><option value="유류비">유류비</option><option value="부서회식비">부서회식비</option></select></td>';
            innerHtml +='<td><input name="detail" type="text"></td>';

            innerHtml +='<td><select name="type">';
            innerHtml +='<option value="개인카드영수증">개인카드영수증</option><option value="법인카드">법인카드</option><option value="현금">현금</option><option value="외상">외상</option></select></td>';
            innerHtml +='<td><input type="text" size="10" name="supplyPrice"></td>';
            innerHtml +='<td><input type="text" size="10" name="VAT"></td>';
            innerHtml +='<td><input type="text" size="10" name="ammountPrice"></td>';
            innerHtml +='<td><input type="file" name="receipt" class="receipt"></td>';
            innerHtml +='<td><input type="text" name="remark"></td>';
            innerHtml +='</tr>';
            $('.payment-table2 > tbody:last').append(innerHtml);
        }else{
            alert("최대 5개까지만 가능합니다.");
            return false;
        }

    }

    function deleteon(){
        var trCnt =$('.payment-table2 tr').length;
        console.log(trCnt);
        if(trCnt>3){
            console.log($('payment-table > tr:last'));
            $('.payment-table2 > tbody:last > tr:last').remove();
        }else{
            return false;
        }
    }

    function paymentline(){

        window.name="결제작성 폼"
        var url = "/paymentPopup";
        var name = "popup test1";
        var option = "width = 580, height = 340, top = 100, left = 200, location = no";
        window.open(url, name, option);
    }

    function setPaymentLineValue(name){
		
        $('.payment-paymentLine').val(name);

 	}

    function account(){

        window.name="거래처 검색"
        var url = "/account";
        var name = "popup test12";
        var option = "width = 500, height = 800, top = 100, left = 200, location = no,resizable=no";
        window.open(url, name, option);
    }

    function setAccountValue(account){
		
        $('.payment-account').val(account);

 	}
    function array(){
    	var list=$('#form').serializeArray();
    }
</script>
</body>
</html>