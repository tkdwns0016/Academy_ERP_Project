
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />

<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>Insert title here</title>

<style>
.container-23 {
	width: 40%;
	float: left;
	margin: 0 50px
}

section {
	width: 100%;
	height: 100%;
	max-width: 100%;
	position: absolute;
	top: 10%;
}

.img {
	width: 100%;
	float: left;
	opacity: 1;
}

.img_div {
	position: relative;
	margin: 1%;
}

.form-control {
	width: 250px;
	position: relative;
	top: 0%;
	margin-top: -19px;
}

.mb1 {
	float: left;
	margin-left: 50px;
}

.mb2 {
	float: left;
	left: 10%;
	border: 1px solid black;
}

.mb3 {
	float: left;
	left: 5%;
}

.main_box {
	width: 38%;
	background-color: white;
	border-radius: 20px;
	margin-top: 1%;
	text-align: center;
	position: relative;
	min-width: 415px;
}

.main_box2 {
	width: 50%;
	height: 15%;
	background-color: white;
	text-align: center;
	position: relative;
	left: 7%
}

#calendar {
	height: 300px;
}

.fc-daygrid-day-number {
	text-decoration: none;
	color: black;
}

.fc-daygrid-day-number:hover {
	color: black;
}

.boardTd {
	border: 1px solid #eeeeee;
}

.boardTr {
	border: 1px solid #eeeeee;
	height: 25px
}

.boardTh {
	border: 1px solid #eeeeee;
}

.boardTable {
	border-collapse: collapse;
	text-align: center;
}

.boardId {
	width: 100px;
}

.boardTitle {
	width: 65%;
}

.boardWriter {
	width: 200px;
}

.boardCount {
	width: 175px;
}
</style>
</head>
<link href='/static/main.css' rel='stylesheet' />

</head>
<!-- 스크립트 추가끝 -->
<body class="body" onload="showImage()">
	<c:if test="${empty empl }">
		<script>
			alert("로그인 정보가 없습니다.")
			location.href = "/login";
		</script>
	</c:if>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />
	</c:if>
	<script src='/static/main.js'></script>


	<section>
		<div class="img_div" style="height: 30%;">
			<img class="img" id="show" style="height: 100%;" src="/image/1.jpg">
		</div>
		<div class="main_box mb1">
			<table style="margin-bottom: 5%;">
				<tr style="background: #f6f6f6; border-bottom: 1px solid black;">
					<th></th>
					<th style="text-align: center; font-size: 24px;">캘린더</th>
					<th></th>
				</tr>
			</table>
			<div id='calendar'></div>

		</div>


		<!-- 변경 추가 -->
		<script>
			$(function() {
				/* latest_tab(요소ID, 탭번호(열림), 자동탭[true-실행,false-정지], 시간[1000-1초]), 주의:자동탭은 1개만 사용하세요. 2개부터는 오류 발생. */
				latest_tab("TAB_A", 1, true, 3000);
			});

			// 자동탭의 시간을 담는 전역변수.
			function latest_tab(id, idx, auto, t) {
				$("#" + id + " .rumi_tab_content").hide();
				$("#" + id + " ul.rumi_tabs li:nth-child(" + idx + ")")
						.addClass("active").css({
							"color" : "#dd6666"
						});
				$("#" + id + " .rumi_tab_content:nth-child(" + idx + ")")
						.show();

				$("#" + id + " ul.rumi_tabs li").click(
						function(event) {
							var target = event.currentTarget
									|| event.explicitOriginalTarget
									|| event.srcElement
									|| document.activeElement;
							$(target.parentElement.children).removeClass(
									"active").css("color", "#333");
							$(target).addClass("active").css({
								"color" : "#dd6666"
							});
							$("#" + id + " .rumi_tab_content").hide();
							var activeTab = $(this).attr("rel");
							$("#" + activeTab).fadeIn()
						});

				if (auto == true) {

					var s = (idx + 1); // 초기 열린 페이지부터 탭 자동 실행

					$("#" + id)
							.mouseleave(
									function() {
										var re_total = $(
												"#" + id + " ul.rumi_tabs li")
												.index();
										var re_idx = $(
												"#" + id + " ul.rumi_tabs li")
												.index(
														$(
																"#"
																		+ id
																		+ " ul.rumi_tabs li")
																.closest(
																		"li.active"));
										s = (re_idx + 2)
										if (s > (re_total + 1)) {
											s = 1;
										}
									});
				}
			}
		</script>


		<!-- 콘텐츠 시작 { -->
		<div class="container-23">
			<div style="width: 100%; text-align: center; margin-bottom: 20px;">
				<!-- SUU Top page -->
				<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>
			<style>
span.txt_line {
	display: inline-block;
	padding: 15px 0px;
	font-size: 14px;
}

ul.rumi_tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 40px;
	border-bottom: 1px solid #ccc;
	border-left: 1px solid #ccc;
	border-right: 0px solid #ccc;
	border-top: 0px solid #ccc;
	width: 100%;
	font-size: 12px;
}

ul.rumi_tabs li {
	float: left;
	text-align: center;
	cursor: pointer;
	width: 82px;
	height: 40px;
	line-height: 40px;
	border: 1px solid #ccc;
	border-left: none;
	font-weight: bold;
	background: #fafafa;
	overflow: hidden;
	position: relative;
} /* 탭 - 메뉴 */
ul.rumi_tabs li:hover {
	background: #eee;
	color: red
}

.rumi_tab_box {
	min-width: 600px;
}

ul.rumi_tabs li.active {
	background: #FFFFFF;
	color: #dd6666;
	border-top: 3px solid #dd6666;
	border-bottom: 1px solid #FFFFFF;
} /* 선택된 탭 스타일 */
.rumi_tab_container {
	border: 1px solid #ccc;
	padding: 12px 8px 8px 8px;
	border-top: none;
	clear: both;
	float: left;
	width: 100%;
	background: #FFFFFF;
	height: 333px;
} /* 탭 내용 박스 */
.rumi_tab_content {
	padding: 5px;
	font-size: 12px;
	display: none;
	text-align: left;
}

.rumi_tab_container .rumi_tab_content ul {
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.rumi_tab_container .rumi_tab_content ul li {
	padding: 5px;
	list-style: none
}

.rumi_tab_box {
	position: absolute;
} /* 탭 전체 크기 */
#TAB_A {
	min-width: 415px; min-height : 270px;
	margin-bottom: 30px;
	min-height: 270px;
}

#TAB_B {
	min-height: 270px;
	margin-bottom: 30px;
}

#TAB_C {
	min-height: 270px;
	margin-bottom: 30px;
}

#TAB_D {
	min-height: 270px;
	margin-bottom: 30px;
}

#TAB_E {
	min-height: 270px;
	margin-bottom: 30px;
}

#TAB_LR .tab_left {
	float: left;
	width: 50%;
	text-align: left;
	padding-right: 5px;
}

#TAB_LR .tab_right {
	float: right;
	width: 50%;
	text-align: right;
	padding-left: 5px;
}

.boardWriter {
	min-width: 65px;
}
</style>

			<div id="TAB_A" class="rumi_tab_box">
				<ul class="rumi_tabs">
					<li rel="A_tab1" class="" style="color: rgb(51, 51, 51);">공지사항</li>
					<li rel="A_tab2" class="" style="color: rgb(51, 51, 51);">건의
						게시판</li>
					<li rel="A_tab3" class="" style="color: rgb(51, 51, 51);">익명
						게시판</li>


				</ul>
				<div class="rumi_tab_container">
					<div id="A_tab1" class="rumi_tab_content" style="display: none;">
						<div id="cw">
							<table class="boardTable">
								<tr class="boardTr">
									<th class="boardId boardTr">No.</th>
									<th class="boardTitle boardTh">게시글</th>
									<th class="boardWriter boardTh">작성자</th>
									<th class="suggestionCount">조회수</th>
								</tr>
								<c:forEach var="i" begin="0" end="9">
									<tr class="boardTr"
										onclick="location.href=('/noticeSearch?id=${notice[i].id }')">
										<td class="boardTd">${notice[i].id}</td>
										<td class="boardTd">${notice[i].title }</td>
										<td class="boardTd boardWriter">${noticeWriter[i] }</td>
										<td class="boardTd">${notice[i].count }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div id="A_tab2" class="rumi_tab_content" style="display: none;">
						<table class="boardTable">
							<tr class="boardTr">
								<th class="boardId boardTh">No.</th>
								<th class="boardTitle boardTh">게시글</th>
								<th class="boardWriter boardTh">작성자</th>
								<th class="boardCount">조회수</th>
							</tr>
							<c:forEach var="i" begin="0" end="9">
								<tr class="boardTr"
									onclick="location.href=('/suggestionSearch?id=${suggestion[i].id }')">
									<td class="boardTd">${suggestion[i].id}</td>
									<td class="boardTd">${suggestion[i].title }</td>
									<td class="boardTd">${suggestionWriter[i] }</td>
									<td class="boardTd">${suggestion[i].count }</td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div id="A_tab3" class="rumi_tab_content" style="display: none;">
						<table class="boardTable">
							<tr class="boardTr">
								<th class="boardId boardTh">No.</th>
								<th class="boardTitle boardTh">게시글</th>
								<th class="boardWriter boardTh">작성자</th>
								<th class="boardCount">조회수</th>
							</tr>
							<c:forEach var="i" begin="0" end="9">
								<tr class="boardTr"
									onclick="location.href=('/anonymousSearch?id=${anonymous[i].id }')">
									<td class="boardTd">${anonymous[i].id}</td>
									<td class="boardTd">${anonymous[i].title }</td>
									<td class="boardTd">${anonymous[i].nickName }</td>
									<td class="boardTd">${anonymous[i].count }</td>
								</tr>
							</c:forEach>
						</table>
					</div>


				</div>
			</div>






			<div style="clear: both;"></div>
			<!-- 변경 끝 -->
		</div>
	</section>




</body>
<!-- 스크립트 -->

<script>
	/* $(function(){
	 document.querySelectorAll(".fc-prev-button")[0].onclick=function(){
	 $(".fc-daygrid-day-number").css("text-decoration","none");
	 $(".fc-daygrid-day-number").css("color","black");
	 }
	 }); */
	document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('calendar');
		var today = new Date();
		var events;
		function list() {
			$.ajax({
				url : "/mainlist",
				async : false,
				type : "get",
				dataType : "json",
				success : function(result) {
					for (let i = 0; i < result.length; i++) {
						if (result[i].departmentId == 10) {
							result[i].departmentId = "경영팀 10"
						} else if (result[i].departmentId == 20) {
							result[i].departmentId = "개발팀 20"
						} else if (result[i].departmentId == 30) {
							result[i].departmentId = "인사팀 30"
						} else {
							result[i].departmentId = "영업팀 40"
						}
					}
					arr = result;

					events = arr.map(function(item) {
						return {
							publicId : item.id,
							title : item.title + " ["
									+ item.departmentId.substring(0, 3) + "]",
							start : item.startDate,
							end : item.endDate,
							STATUS : item.memo,
							groupId : item.departmentId.substring(4, 6),
							id : item.writer
						}
					});
				}
			});
		}
		;
		list()

		var calendar = new FullCalendar.Calendar(calendarEl, {

			initialDate : today,
			navLinks : false, // can click day/week names to navigate views
			selectable : false,
			selectMirror : true,

			eventClick : function(event) {
				location.href = "/educationBoard?departmentId="
						+ event.event.groupId;
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			eventLimit : false,
			events : events
		});

		calendar.render();

		$(".fc-scroller-liquid-absolute").removeAttr("style");
		$("a").css("text-decoration", "none");
		$("a").css("color", "black");

	});

	var img = new Array();
	img[0] = "/image/1.jpg";
	img[1] = "/image/2.jpg";
	img[2] = "/image/3.jpg";
	img[3] = "/image/4.jpg";
	img[4] = "/image/5.jpg";
	var j = 0;
	var ms = 500;

	function showImage() {
		$("#show").animate({
			opacity : '0'
		}, ms, function() {
			$("#show")[0].src = img[j];
		})
		$("#show").animate({
			opacity : '1'
		}, ms)
		j++;
		if (j == 5) {
			j = 0;
		}
		setTimeout(showImage, 4000);
	}

	var i = true;
	imgs = document.querySelectorAll(".img")
	$(document).ready(function() {
		setTimeout(function() {

			$(".img_ul").animate({
				margin : '0 -100%'
			}, 0)
			$(".img_ul").append(img[0]);
		}, 2000)
	})

	function search() {
		document.querySelector(".search_form").submit();
	}
</script>
</html>