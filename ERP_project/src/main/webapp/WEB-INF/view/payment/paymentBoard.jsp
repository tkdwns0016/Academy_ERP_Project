<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>


        .cotainer-payment-height{
            width: 1150px;
            left: 2%;
            position: relative;
        }

        .paymentlistview-table th{
            text-align: center;
        }

        .container-paymentlistview-main{
            width: 1400px;
            height: 1200px;
            position: absolute;
            left: 8%;
            top:8%;
        }

        .container-paymentlistview-mid{
            border: 1px solid black;
            border-radius: 10px;
            height: 630px;
            width: 1200px;
            position: relative;
            left: 7%;
            top:7%;
        }

        .container-paymentlistview-content{
            width: 1150px;
            position: relative;
            left: 2%;
        }

        .container-paymentlistview-search{
            border: 2px solid gainsboro;
            background-color: #f7f7f7;
            width: 1150px;
            position: relative;
            left: 2%;

        }
        .container-paymentlistview-search-table{
            width:1150px
        }

        .container-paymentlistview-search-table button{
            width: 60px;
            border: 1px solid gainsboro;
            border-radius: 5%;
        }

        .container-paymentlistview-search-table button:hover{
            background-color: ghostwhite;
        }

        .container-paymentlistview-search-table-button1 button{
            background-color: #94c6ff;
            border-radius: 5px;

        }

        

        .container-paymentlistview-header{
       
            position: relative;

        }

        h1{
            width: 1150px;
            position: relative;
            left: 2%;
            top:7%;
        }

        .paymentlistview-table-div{
            width: 1150px;
            border-collapse: collapse;
            text-align: center;
            position: relative;
            left: 2%;

        }

        .paymentlistview-table-table{
            width: 1150px;
            border-collapse: collapse;
        }

        .container-paymentlistview-content button:nth-child(1){
            width: 100px;
            height: 30px;
            color: white;
            background-color: #54d4ff;
            font-weight: 600;

        }


        .container-paymentlistview-content button:nth-child(n+2){
            width: 100px;
            height: 30px;
            color: white;
            background-color: #847d7d;
            font-weight: 600;
        }

        .container-paymentlistview-content button:nth-child(n+2):hover{

            background-color: gainsboro;

        }

        .paymentlistview-button1{
        
        width: 60px;
        height: 30px;
        border: 1px solid gainsboro;
        background-color: lightskyblue;
        position: relative;
        left: 1%;
        top: 8%;

        }
        .paymentlistview-button2{
        
        width: 60px;
        height: 30px;
        border: 1px solid gainsboro;
        background-color: white;
        position: relative;
        left: 1%;
        top: 3%;

        }

        .paymentlistview-button1:hover, .paymentlistview-button2:hover{
            background-color: gainsboro;
        }

        .paymentlistview-payment-div{
            width: 1150px;
            position: relative;
            left: 2%;
         
        }
    </style>
   
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script> 

    <script src="js/bootstrap.js"></script>
</head>
<body>
   

<div class="container-paymentlistview-main">
    <div class="container-paymentlistview-mid">
<div class="container-paymentlistview-header">
    <H1>지출결의서조회</H1>
</div>

<div class="container-paymentlistview-content">
    <button>전체</button>
    <button>결제대기</button>
    <button>반려</button>
    <button>결제완료</button>
</div>
<div class="cotainer-payment-height"></div>
<div class="container-paymentlistview-search">
    <table class="container-paymentlistview-search-table">
        <tr height="10px">
       
        </tr>
        <tr>
            <td width="12%">조회기간</td>
            <td width="29%">
                <button>1일</button>
                <button>3일</button>
                <button>1주일</button>
                <button>1달</button>
                <button>1년</button>
            </td>
            <td width="5%"></td>
            <td>
                <input type="date" name="startDate" class="star"/>
                &nbsp;~&nbsp;
                <input type="date" name="endDate"/>
            </td>
            <td width="10%"  class="container-paymentlistview-search-table-button1">
                <button>조회</button>
            </td>
        </tr>
        <tr height="10px">
       
        </tr>
    </table>
</div>
<div class="cotainer-payment-height"></div>
<div class="paymentlistview-table-div">
<table class="paymentlistview-table-table" border="1px solid black"  >
        <tr height="40px" style="background-color: #58bfd045;">
            <th width="5%"><input type="checkbox"></th>
            <th width="10%">기안일자</th>
            <th width="32%">제목</th>
            <th width="13%">구분</th>
            <th width="10%">기안자</th>
            <th width="10%">결제자</th>
            <th width="10%">결제</th>
            <th width="10%">진행상태</th>
        </tr>
        <c:forEach var="pay" items="${paymentList }">
        <tr>
            <td>
                <input type="checkbox">
            </td>
            <td>
                ${pay.writeDate}
            </td>
            <td>
                ${pay.title }
            </td>
            <td>
                지출결의서
            </td>
            <td>
                ${pay.writer }
            </td>
            <td>
                ${pay.approver}
            </td>
            <td>
                <a href="/paymentView?id=${pay.paymentBoardId }">보기</a>
            </td>
            <td>
                ${pay.paymentStatus}
            </td>
        </tr>
</c:forEach>
</table>
</div>

<div class="paymentlistview-payment-div">
    <hr>
    <button class="paymentlistview-button1"><font color="white">작성</button>
    <button class="paymentlistview-button2">결제</button>
    <button class="paymentlistview-button2">반려</button>
</div>

</div>
</div>

</body>
</html>