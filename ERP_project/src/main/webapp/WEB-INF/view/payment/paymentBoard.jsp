<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>


        .cotainer-payment-height{
            width: 1150px;
            height: 3%;
            left: 2%;
            position: relative;
        }

        .paymentlistview-table th{
            text-align: center;
        }

        .container-paymentlistview-main{
            width: 80%;
            height: 750px;
            position: absolute;
            left: 8%;
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
   

</head>
<body>
<c:if test="${empty empl }">
		<script>
		alert("로그인 정보가 없습니다.")
		location.href="/login";
	</script>
	</c:if>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>
<section>
<form action="/payment" method="post">
<div class="container-paymentlistview-main">
    <div class="container-paymentlistview-mid">
<div class="container-paymentlistview-header">
    <H1>지출결의서조회</H1>
</div>

<div class="container-paymentlistview-content">
    <button type="button" class="paymentlistview-all" onclick="allPayment('전체')">전체</button>
    <button type="button" class="paymentlistview-wait" onclick="waitPayment('결제대기')">결제대기</button>
    <button type="button" class="paymentlistview-return" onclick="returnPayment('반려')">반려</button>
    <button type="button" class="paymentlistview-complete" onclick="completePayment('결제완료')">결제완료</button>
</div>
<div class="cotainer-payment-height"></div>
<div class="container-paymentlistview-search">
    <table class="container-paymentlistview-search-table">
        <tr height="10px">
       
        </tr>
        <tr>
            <td width="12%">조회기간</td>
            <td width="29%">
                <button type="button" onclick="oneDay()">1일</button>
                <button type="button" onclick="threeDays()">3일</button>
                <button type="button" onclick="oneWeek()">1주일</button>
                <button type="button" onclick="oneMonth()">1달</button>
                <button type="button" onclick="oneYear()">1년</button>
            </td>
            <td width="5%"></td>
            <td>
                <input type="date" name="startDate" class="startDate"/>
                &nbsp;~&nbsp;
                <input type="date" name="endDate" class="endDate"/>
            </td>
            <td width="10%"  class="container-paymentlistview-search-table-button1">
                <button type="submit">조회</button>
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
            <th class="paymentlistview-check-all" onclick="allchecked()" width="5%"><input type="checkbox"></th>
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
                <a href="#" onclick="goView(${pay.paymentBoardId})">보기</a>
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
    <button type="button" class="paymentlistview-button1" onclick="goWriter()"><font color="white">작성</button>
      <c:if test="${selectlist[0].approver== empl.name}">
    	<button type="button" class="paymentlistview-button2">결제</button>
    	<button type="button" class="paymentlistview-button2">반려</button>
      </c:if>
</div>

</div>
</div>
</form>
</section>   
<script>
console.log(${userId})

//현재 날짜 지정
var date=new Date();
var year =date.getFullYear();
var month =(date.getMonth()+1);
var day = (date.getDate());
month = month >= 10 ? month : '0' + month;
var datenow=year+"-"+month+"-"+day;

$(".startDate").val(datenow);
$(".endDate").val(datenow);


function oneDay(){
    var day = new Date(Date.parse(date) - 1 * 1000 * 60 * 60 * 24);
    var dayyear = day.getFullYear();
    var daymonth = day.getMonth()+1;
    var dayDay=day.getDate();

    daymonth = daymonth >= 10 ? daymonth : '0' + daymonth;
    var dayDateNow =dayyear+"-"+daymonth+"-"+dayDay;

    $(".startDate").val(dayDateNow);
}

function threeDays(){
    var threeDay = new Date(Date.parse(date) - 3 * 1000 * 60 * 60 * 24);
    var threeDayYear = threeDay.getFullYear();
    var threeDayMonth = threeDay.getMonth()+1;
    var threeDayday=threeDay.getDate();

    threeDayMonth = threeDayMonth >= 10 ? threeDayMonth : '0' + threeDayMonth;
    var threeDayNow =threeDayYear+"-"+threeDayMonth+"-"+threeDayday;

    $(".startDate").val(threeDayNow);
}


function oneWeek(){
    var week = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);
    var weekyear = week.getFullYear();
    var weekmonth = week.getMonth()+1;
    var weekday=week.getDate();

    weekmonth = weekmonth >= 10 ? weekmonth : '0' + weekmonth;
    var weekDateNow =weekyear+"-"+weekmonth+"-"+weekday;

    $(".startDate").val(weekDateNow);
}

function oneMonth(){
    var month = new Date(Date.parse(date) - 30 * 1000 * 60 * 60 * 24);
    var monthyear = month.getFullYear();
    var monthMonth = month.getMonth()+1;
    var monthday=month.getDate();

    monthMonth = monthMonth >= 10 ? monthMonth : '0' + monthMonth;
    var monthDateNow =monthyear+"-"+monthMonth+"-"+monthday;

    $(".startDate").val(monthDateNow);
}

function oneYear(){
    var year = new Date(Date.parse(date) - 365 * 1000 * 60 * 60 * 24);
    var yearYear = year.getFullYear();
    var yearMonth = year.getMonth()+1;
    var yearDay=year.getDate();

    yearMonth = yearMonth >= 10 ? yearMonth : '0' + yearMonth;
    var yearDateNow =yearYear+"-"+yearMonth+"-"+yearDay;

    $(".startDate").val(yearDateNow);
}

function goView(paymentBoardId){
	
	 window.name="결제조회"
	 var url = "/paymentView?id="+paymentBoardId;
	 var name = "goView";
	 var option = "width = 970, height = 800, top = 50, left = 20, location = no";
	 window.open(url, name, option);
}

function allPayment(all){
	location.href="/payment?paymentStatus="+all;
}

function waitPayment(wait){
	location.href="/payment?paymentStatus="+wait;
}

function returnPayment(back){
	location.href="/payment?paymentStatus="+back;
}

function completePayment(complete){
	location.href="/payment?paymentStatus="+complete;
}


if('<%=request.getParameter("paymentStatus")%>'=="결제대기"){
	$(".paymentlistview-wait").css("background-color","#54d4ff");
	$(".paymentlistview-all").css("background-color","#847d7d");
	$(".paymentlistview-return").css("background-color","#847d7d");
	$(".paymentlistview-complete").css("background-color","#847d7d");
}

if('<%=request.getParameter("paymentStatus")%>'=="반려"){
	$(".paymentlistview-return").css("background-color","#54d4ff");
	$(".paymentlistview-all").css("background-color","#847d7d");
	$(".paymentlistview-wait").css("background-color","#847d7d");
	$(".paymentlistview-complete").css("background-color","#847d7d");
}

if('<%=request.getParameter("paymentStatus")%>'=="결제완료"){
	$(".paymentlistview-complete").css("background-color","#54d4ff");
	$(".paymentlistview-all").css("background-color","#847d7d");
	$(".paymentlistview-wait").css("background-color","#847d7d");
	$(".paymentlistview-return").css("background-color","#847d7d");
}


function allchecked(){
	if($(".paymentlistview-check-all").prop("checked")==true){
		
	}
}

function goWriter(){
	var url = "/paymentWriter";
	 var name = "goWriter";
	 var option = "width = 1450, height = 500, top = 50, left = 30, location = no";
	 window.open(url, name, option);
}
</script>
</body>
</html>