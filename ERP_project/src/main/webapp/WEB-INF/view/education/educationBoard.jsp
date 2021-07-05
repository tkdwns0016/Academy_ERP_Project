<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='/static/main.css' rel='stylesheet' />
<script src='/static/main.js'></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
		var yyyy = today.getFullYear();
		var hh =today.getHours();
		var MM = today.getMinutes();
		if(dd<10){
		  dd='0'+dd
		} 
		if(mm<10){
		  mm='0'+mm
		} 
		if(hh<10){
			hh='0'+hh
		}
		if(MM<10){
			MM='0'+MM;
		}
		today = yyyy+'-'+mm+'-'+dd+"T"+hh+":"+MM;
		$(".st-date")[0].setAttribute("min", today);
		$(".cancle")[0].onclick = function() {
			$(".mo")[0].classList.add("hidden");
			$(".title").val("");
			$(".st-date").val("");
			$(".content").val("");
			$(".ed-date").val("");
		}
		$(".modal-button")[1].onclick = function() {
			var result = confirm('삭제 하시겠습니까?')
			if (result) {

			} else {
				$(".mo")[0].classList.add("hidden");
				$(".title").val("");
				$(".st-date").val("");
				$(".content").val("");
				$(".ed-date").val("");
				return false;
			}
		}
		
		var calendarEl = document.getElementById('calendar');
		var today = new Date();
		var modal = document.getElementById('myModal');
		var arr;
		var departmentId=[];
		function list() {
			$.ajax({
				url : "/list?departmentId="+${departmentId},
				async : false,
				type : "get",
				dataType : "json",
				success : function(result) {
					arr = result;
					events = arr.map(function(item) {
						return {
							publicId : item.id,
							title : item.title,
							start : item.startDate,
							end : item.endDate,
							STATUS : item.memo,
							groupId : ${departmentId},
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
			selectable : true,
			selectMirror : true,
			selectHelper: false,
			select : function(start) {
				var start=start.start;
				var startYY=start.getFullYear();
				var startMM=start.getMonth()+1;
				if(startMM<10){
					startMM='0'+startMM;
				}
				var startDD=start.getDate();
				if(startDD<10){
					startDD='0'+startDD;
				}
				var startHH=start.getHours();
				if(startHH<10){
					startHH='0'+startHH;
				}
				
				var startmm=start.getMinutes();
				if(startmm<10){
					startmm='0'+startmm;
				}
				var startVal=startYY+"-"+startMM+"-"+startDD+"T"+startHH+":"+startmm;
				var startMax=startYY+"-"+startMM+"-"+startDD+"T"+"24:00";
				$(".st-date")[0].setAttribute("min", startVal);
				$(".st-date")[0].setAttribute("max", startMax);
				$(".ed-date")[0].setAttribute("min", startVal);
				$(".title")[0].removeAttribute("readonly");
				$(".st-date")[0].removeAttribute("readonly");
				$(".ed-date")[0].removeAttribute("readonly");
				$(".content")[0].removeAttribute("readonly");
				$(".mo")[0].classList.remove('hidden');
				$(".modal-button")[0].classList.remove("hidden");
				$(".modal-button")[1].classList.add("hidden");
				$(".edu-id").val("0");
				$(".modal-button")[0].value = "작성"
			},
			eventClick : function(event) {
				$(".mo")[0].classList.remove('hidden');
				$(".title").val(event.event.title);
				var start=event.event.start;
				var startYY=start.getFullYear();
				var startMM=start.getMonth()+1;
				if(startMM<10){
					startMM='0'+startMM;
				}
				var startDD=start.getDate();
				if(startDD<10){
					startDD='0'+startDD;
				}
				var startHH=start.getHours();
				if(startHH<10){
					startHH='0'+startHH;
				}
				
				var startmm=start.getMinutes();
				if(startmm<10){
					startmm='0'+startmm;
				}
				var startVal=startYY+"-"+startMM+"-"+startDD+"T"+startHH+":"+startmm;
				var end=event.event.end;
				var endYY=end.getFullYear();
				var endMM=end.getMonth()+1;
				if(endMM<10){
					endMM='0'+endMM;
				}
				var endDD=end.getDate();
				if(endDD<10){
					endDD='0'+endDD;
				}
				var endHH=end.getHours();
				if(endHH<10){
					endHH='0'+endHH;
				}
				
				var endmm=end.getMinutes();
				if(endmm<10){
					endmm='0'+endmm;
				}
				var endVal=endYY+"-"+endMM+"-"+endDD+"T"+endHH+":"+endmm;
				$(".edu-id").val(event.event.extendedProps.publicId);
				$(".edu-dep").val(event.event.groupId);
				$(".st-date").val(startVal);
				$(".ed-date").val(endVal);
				$(".content").val(event.event.extendedProps.STATUS);
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
				var yyyy = today.getFullYear();
				var hh =today.getHours();
				var MM = today.getMinutes();
				if(dd<10){
				  dd='0'+dd
				} 
				if(mm<10){
				  mm='0'+mm
				} 
				if(hh<10){
					hh='0'+hh
				}
				if(MM<10){
					MM='0'+MM;
				}
				today = yyyy+'-'+mm+'-'+dd+"T"+hh+":"+MM;
				$(".st-date")[0].removeAttribute("max");
				$(".st-date")[0].setAttribute("min", today);
				$(".st-date")[0].onchange=function(){
					$(".ed-date")[0].setAttribute("min",$(".st-date")[0].value );
				}
				if(event.event.id==${empl.userId}){
					$(".title")[0].removeAttribute("readonly");
					$(".st-date")[0].removeAttribute("readonly");
					$(".ed-date")[0].removeAttribute("readonly");
					$(".content")[0].removeAttribute("readonly");
					$(".modal-button")[0].classList.remove("hidden");
					$(".modal-button")[1].classList.remove("hidden");
					$(".modal-button")[0].value = "수정";
					$(".modal-button")[1].value = "삭제";
					$(".modal-button")[1].setAttribute('type', 'submit');
				}else{
					$(".modal-button")[0].classList.add("hidden");
					$(".modal-button")[1].classList.add("hidden");
					$(".title")[0].setAttribute("readonly","readonly")
					$(".st-date")[0].setAttribute("readonly","readonly")
					$(".ed-date")[0].setAttribute("readonly","readonly")
					$(".content")[0].setAttribute("readonly","readonly")
				}
			},
			editable : false,
			dayMaxEvents : false, // allow "more" link when too many events
			events : events
		});

		calendar.render();
		
		$("a").css('text-decoration', 'none')
		$("a").css('color', 'black')

	});
</script>

<style>
.fc-day:hover {
	background: #eeeeeee;
}

.hidden {
	display: none;
}

a {
	text-decoration: none;
}

.mo {
	position: absolute; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.mo-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 40%;
	height: 50%;
}

body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

.teduri {
	position: relative;
	top: 15%;
}

#calendar {
	max-width: 1100px;
	margin: 50px auto;
}

table {
	border-collapse: collapse;
	text-align: center;
}

tr td {
	border: 1px solid #c9c2c2;
}

.edu_name {
	width: 100px;
}

.edu_sml {
	width: 500px;
}

.edu_name_lrg {
	height: 120px;
}

.content {
	width: 98%;
	height: 110px;
}

.bar-1 {
	width: 98%;
}

.fc-daygrid-day-number {
	text-decoration: none;
	color: black;
}

.fc-daygrid-day-number:hover {
	color: black;
}

.cancel-position {
	right: 1000px;
}

.title {
	width: 100%;
}

.btn-1 {
	margin-left: 45%;
}
</style>


</head>
<body>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>

	<div class='teduri'>
		<div id='calendar'></div>

	</div>

	<div class="mo hidden">
		<div class="mo-content">
			<div class="title"
				style="text-align: center; font-size: 20px; font-weight: bold;">
				교육 일정 <input class="cancle cancel-position" type="button" value="X">
			</div>
			<br>
			<form action="/educationBoard" method="POST">
				<table class="modal-table">
					<tr>
						<td class="edu_name">타이틀</td>
						<td class="edu_sml"><input class="bar-1 title" type="text"
							name="title" placeholder="제목 입력"><br></td>
					</tr>
					<tr>
						<td class="edu_name">교육 시작일</td>
						<td class="edu_sml"><input class="bar-1 st-date"
							type="datetime-local" min="" name="startDate"><br></td>
					</tr>
					<tr>
						<td class="edu_name">교육 종료일</td>
						<td class="edu_sml"><input class="bar-1 ed-date"
							type="datetime-local" name="endDate"> <br></td>
					</tr>
					<tr>
						<td class="edu_name_lrg">교육 내용</td>
						<td><textarea class="content" name="memo"
								placeholder="교육 내용 입력"></textarea> <br></td>
					</tr>
					<br>
				</table>
				<input type="hidden" name="writer" value="${empl.userId }">
				<input class="edu-dep" type="hidden" name="departmentId" value="${departmentId}">
				<input class="edu-id" type="hidden" name="id">
				<br> <input class='modal-button btn-1' name='button'
					type='submit' value='수정'>&nbsp;<input class='modal-button'
					name='button' type='submit' value='삭제'> <br>

			</form>
		</div>

	</div>

	<script>
		
	</script>
</body>
</html>