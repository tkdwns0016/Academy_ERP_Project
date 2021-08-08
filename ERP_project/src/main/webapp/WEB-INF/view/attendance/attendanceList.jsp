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
	top:5%;
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
			<div class="select_date">

				<svg class="arrow_img1 float_left"
					xmlns="http://www.w3.org/2000/svg" width="36" height="36"
					fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
			<path class="arrow1"
						d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z" /></svg>
				<div class="date_div">${today } 근태리스트</div>
				<svg class="arrow_img2 float_left"
					xmlns="http://www.w3.org/2000/svg" width="36" height="36"
					fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
  <path class="arrow2"
						d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" /></svg>
			</div>

			<table class="section_table">
				<tr>
					<td colspan="4" style="border: none">
						<div style="text-align: left;">
							<span class="font_size">🚩근태리스트</span>&nbsp;&nbsp; <select
								class="dep_select" onchange="dep_select()" style="height: 28px">
								<option selected="selected">--부서별 검색--</option>
								<option value="경영팀">경영팀</option>
								<option value="개발팀">개발팀</option>
								<option value="영업팀">영업팀</option>
								<option value="인사팀">인사팀</option>
							</select> &nbsp;&nbsp; <input type="date" onchange="selectDate()" class="selectDate" max="<%=LocalDate.now()%>">
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
				</tr>
				<c:forEach var="attendance" items="${attendanceList }">
					<tr
						onclick="choice_empl('${attendance.name}','${attendance.workType}','${attendance.workStart}')">
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
					</tr>
				</c:forEach>
			</table>
			<div class="pagenation">
				<c:forEach var="page" begin="1" end="${paging.totPage }">
				<span style="cursor: pointer;" onclick="pagenation(${page})">
				[<a>${page}</a>]
				</span>
					</c:forEach>
			</div>
		</div>
	</section>
</body>
<script>
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
	if ("${select}" != "") {
		$(".dep_select").val('${select}');
	}
	/*arrow - hover Event*/
	$(".arrow_img1")
			.hover(
					function() {
						$(".arrow1")
								.attr(
										"d",
										"m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z");
					},
					function() {
						$(".arrow1")
								.attr(
										"d",
										"M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z");
					})
	$(".arrow_img2")
			.hover(
					function() {
						$(".arrow2")
								.attr(
										"d",
										"m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z");
					},
					function() {
						$(".arrow2")
								.attr(
										"d",
										"M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z");
					})

	/* date_div 내부 값 */
	var getDate = '${today}';
	var today = new Date(getDate);
	/* click for date move (left-arrow) */
	$(".arrow_img1").on(
			"click",
			function() {
				let adjust = today.getDate() - 1;
				today.setDate(adjust)
				let result;
				if (today.getMonth() + 1 < 10 || today.getDate() < 10) {
					if (today.getMonth() + 1 < 10 && today.getDate() < 10) {
						result = (today.getFullYear() + "-0"
								+ (today.getMonth() + 1) + "-0" + today
								.getDate());
					} else if (today.getDate() < 10) {
						result = (today.getFullYear() + "-"
								+ (today.getMonth() + 1) + "-0" + today
								.getDate());
					} else if (today.getMonth() + 1 < 10) {
						result = (today.getFullYear() + "-0"
								+ (today.getMonth() + 1) + "-" + today
								.getDate());
					}
				} else {
					result = (today.getFullYear() + "-" + (today.getMonth())
							+ "-" + today.getDate());
				}
				location.href = "/attendance?today=" + result + "&dep_choice="
						+ $('.dep_select').val()

			})

	/* click for date move (right-arrow) */
	$(".arrow_img2").on(
			"click",
			function() {
				if (getDate < nowDate) {
					let adjust = today.getDate() + 1;
					today.setDate(adjust)
					var result;
					if (today.getMonth() + 1 < 10 || today.getDate() < 10) {
						if (today.getMonth() + 1 < 10 && today.getDate() < 10) {
							result = (today.getFullYear() + "-0"
									+ (today.getMonth() + 1) + "-0" + today
									.getDate());
						} else if (today.getDate() < 10) {
							result = (today.getFullYear() + "-"
									+ (today.getMonth() + 1) + "-0" + today
									.getDate());
						} else if (today.getMonth() + 1 < 10) {
							result = (today.getFullYear() + "-0"
									+ (today.getMonth() + 1) + "-" + today
									.getDate());
						}
					} else {
						result = (today.getFullYear() + "-"
								+ (today.getMonth()) + "-" + today.getDate());
					}
					location.href = "/attendance?today=" + result
							+ "&dep_choice=" + $('.dep_select').val()
				}
			})

	/* now date (compare right-arrow side) */
	var newDate = new Date();
	var nowDate = "";
	if (newDate.getMonth() + 1 < 10 || newDate.getDate() < 10) {
		if (newDate.getMonth() + 1 < 10 && newDate.getDate() < 10) {
			nowDate = (newDate.getFullYear() + "-0" + (newDate.getMonth() + 1)
					+ "-0" + newDate.getDate());
		} else if (newDate.getDate() < 10) {
			nowDate = (newDate.getFullYear() + "-" + (newDate.getMonth() + 1)
					+ "-0" + newDate.getDate());
		} else if (newDate.getMonth() + 1 < 10) {
			nowDate = (newDate.getFullYear() + "-0" + (newDate.getMonth() + 1)
					+ "-" + newDate.getDate());
		}
	} else {
		nowDate = (newDate.getFullYear() + "-" + (newDate.getMonth()) + "-" + newDate
				.getDate());
	}

	/* use department select box function */
	function dep_select() {
		let dep_choice = $(".dep_select").val();
		location.href = "/attendance?today=${today}&dep_choice=" + dep_choice;
	}
	
	/* click employee */
	function choice_empl(name, workType, workStart) {
		location.href = "/select_atten_Empl?name=" + name + "&workType="
				+ workType;
	}
	
	/* select date input */
	function selectDate(){
		let selectDate = $(".selectDate").val();
		let dep_choice = $(".dep_select").val();
		location.href = "/attendance?today="+selectDate+"&dep_choice="+dep_choice;
		selectDate
	}
	
	/* pagenation href */
	function pagenation(page){
		let dep_choice = $(".dep_select").val();
		location.href = "/attendance?today=${today}&page="+page+"&dep_choice="+dep_choice;
	}
</script>
</html>