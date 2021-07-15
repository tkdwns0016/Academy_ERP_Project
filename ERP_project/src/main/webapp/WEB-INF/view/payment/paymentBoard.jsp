<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        
        


        .paymentlistview-table th{
            text-align: center;
        }

        .container-paymentlistview-main{
            width: 70%;
            position: absolute;
            left: 15%;
            top:15%;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.0/content/tables/">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script> 

    <script src="js/bootstrap.js"></script>
</head>
<body>
   

<div class="container-paymentlistview-main">
<div style="text-align: center;">
    <H1>지출결의서</H1>
</div>
<table class="table table-sm table-hover paymentlistview-table"  >
    <thead class="table-light">
        <tr >
            <th>순서</th>
            <th >기안일자</th>
            <th>제목</th>
            <th scope="col">기안자</th>
            <th scope="col">결제자</th>
            <th scope="col">결제상태</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="pay" items="${ paymentList}">
        <tr style="text-align: center;">
            <td>1</td>
            <td onclick="location.href='/paymentView?id='">${pay.writeDate}</td>
            <td style="text-align: left;">${pay.detail}</td>
            <td>${pay.writer}</td>
            <td>${pay.approver}</td>
            <td>${pay.paymentStatus}</td>
        </tr>
    </c:forEach>
</tbody>
</table>

<div class="border-dee3eb" style="text-align: center;">
<a href="">[1]</a>
<a href="">[2]</a>    
<a href="">[3]</a>
<a href="">[4]</a>
<a href="">[5]</a>

</div>
<div class="temp-box" box-three></div>
<div class="border-dee3eb" style="text-align: right;"> <button>작성</button></div>
</div>
</body>
</html>