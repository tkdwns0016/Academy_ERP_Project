<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
section {
	text-align: center;
	position: relative;
	top: 10%;
	width: 100%;
}

.attendance_container {
	position: relative;
	width: auto;
	min-width: 1200px;
}

.section_table {
	border-collapse: collapse;
	clear: both;
	margin: 0 auto;
	min-width: 850px;
}

.section_table td, th {
	padding: 5px;
	text-align: center;
	border: 1px solid rgb(240, 179, 179);
}

.attendance {
	width: 20px;
	height: 20px;
	text-align: center;
	border-radius: 50%;
	margin: auto;
}

h3 {
	margin: 0;
}

.border_none {
	border: none;
}

.date_div {
	font-size: 150%;
	float: left;
}

.thLine_back_color {
	background-color: gainsboro;
}

.date_div::selection {
	background: white;
}

.select_date {
	position: relative;
	width: 335px;
	height: auto;
	margin: 0 auto;
	top: 10%;
}

.arrow_img {
	margin: 6px 0;
	float: left;
}

.float_left {
	float: left;
}

.pagenation a {
	color: black;
	text-decoration: none;
	margin: 0 5px
}

.font_size {
	font-size: 30px;
	font-weight: bold;
}

.goback {
	background: beige;
	border: 2px solid;
	border-radius: 5px;
}
.pagename{
	border:none;
}
.button_td{
border:none;
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
		<div class="attendance_container">

			<table class="section_table">
				<tr>
					<td colspan="4" style="border: none">
						<div style="text-align: left;">
							<span class="font_size">🚩근태리스트</span>
						</div>

					</td>
					<td colspan="5" style="border: none">
						<div style="text-align: right;">🔴Not
							Perpect&nbsp;&nbsp;&nbsp;&nbsp;🟤Perpect</div>
					</td>
				</tr>
				<tr class="thLine_back_color">
					<th>처리상태</th>
					<th>이름</th>
					<th>부서</th>
					<th>직급</th>
					<th>근로유형</th>
					<th>근무시작시간</th>
					<th>근무종료시간</th>
					<th>소정근무시간</th>
					<th>날짜</th>
				</tr>
				<c:forEach var="attendance" items="${emplOneList }">
					<tr>
						<td>
							<div class="attendance"></div>
						</td>
						<td>${attendance.name }</td>
						<td>${attendance.department }</td>
						<td>${attendance.position }</td>
						<td>${attendance.workType }</td>
						<td class="on_time">${attendance.workStart }</td>
						<td>${attendance.workEnd }</td>
						<td>${attendance.workingTime }</td>
						<td>${attendance.workDate }</td>
					</tr>
				</c:forEach>
				<tr><td style="border: none">
			<button class="goback" onclick="goback()">돌아가기</button>
			</td>
			<td colspan="7" style="border: none">
			<div class="pagenation">
				<c:forEach var="page" begin="1" end="${paging.totPage }">
				<span style="cursor: pointer;" onclick="pagenation(${page})">
				[<a>${page}</a>]
				</span>
					</c:forEach>
			</div>
			</td></tr>
			</table>
		</div>
	</section>
</body>
<script>
	var name = '${emplOneList[0].name}';
	var workType = '${emplOneList[0].workType}';
	/* attendance color */
	var attendance = $(".attendance");
	var on_timeList = $(".on_time");
	for (let i = 0; i < attendance.length; i++) {
		let this_date = on_timeList[i].innerHTML;
		if (this_date > "09:00") {
			attendance[i].style.background = "red"
		} else {
			attendance[i].style.background = "green"
		}
	}
	function goback() {
		location.href = "/attendance"
	}
	/* pagenation href */
	function pagenation(page){
		location.href = "/select_atten_Empl?name="+name+"&workType="+workType+"&page="+page
	}
</script>
</html>