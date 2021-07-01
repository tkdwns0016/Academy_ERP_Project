 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

  <style>
    * {
      margin: 0;
      padding: 0;
    }

    a {
      text-decoration: none;
      color: black;
    }

    html,
    body {
      height: 100%;
    }

    header {
      width: 100%;
      height: 10%;
      position: relative;
      float: right;
      background-color: white;
      z-index: 3;
    }

    .headerdiv {
      height: 100%;
    }
    section {
      width: 100%;
      height: 100%;
      max-width: 100%
    }

    .slide_div {
      position: relative;
      overflow: hidden;
      width: 1300px;
      top: 20px;
      height: 30%;
      margin: 0 auto;
    }

    .img {
      width: 100%;
      float: left;
      opacity: 1;
    }

    .img_div {
      position: relative;
      margin: 1%;
      float: left;
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
    }

    .mb3 {
      float: right;
      margin-right: 4%
    }

    .main_box {
      width: 25%;
      height: 35%;
      background-color: white;
      border-radius: 20px;
      margin-top: 1%;
      text-align: center;
      position: relative;
    }

    th,
    td {
      width: 1%;
    }

    .search {
      position: relative;
      margin-top: -15px;
      height: 32px;
      width: 32px;
      color: black;
      top: -25px;
      left: 85%;
      cursor: pointer;
    }

    .search_form {
      position: absolute;
      width: 250px;
      top: 50%;
      left: 80%;
      clear: both;
      height: 38px;
    }

    .login {
      position: absolute;
      top: 50%;
      margin-top: -19px;
      height: 38px;
      left: 90%;
    }

    .three_line:hover {
      cursor: pointer;
    }

    .three_line {
      width: 30px;
      height: 30px;
      position: absolute;
      top: 50%;
      left: 3%;
      margin-top: -15px;
    }

    .svg {
      display: none;
    }

    .menu_bar {
      position: absolute;
      width: 100%;
      height: 100%;
    }
    .no-line{
    	text-decoration: none;
    	color: black;
    }
@media screen (min-width:1500px);
  </style>
  <link href='/static/main.css' rel='stylesheet' />
<script src='/static/main.js'></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var today=new Date();
    var modal = document.getElementById('myModal');
    var arr;
    var events;
    function list(){
    	$.ajax({
    		url:"/list",
    		async:false,
    		type:"get",
    		dataType:"json",
    		success:function(result){
    			arr=result;	
    			events = arr.map(function(item){
    				return{
    					title: item.title+' <'+item.departmentId+'>',
    					start: item.startDate,
    					end: item.endDate
    				}
    			});
    		}
    	});
    };
    list()
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
     
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: today,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
      select: function(arg) {
        $(".modal")[0].classList.remove('hidden');  
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: events });

    calendar.render();
	for(let i=0;i<arr.length;i++){
		calendar.addEvent(arr[i]);
	}
	
  });

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body class="body" onload="showImage()">
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>


  <section>
    <div class="img_div" style="height: 40%;">
      <img class="img" id="show" style="height: 100%;" src="/image/1.jpg">
    </div>
    <div>
    <div class="main_box mb1">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">캘린더</th>
          <th></th>
        </tr>
      </table>
    	<div id='calendar'></div>
   
    </div>
    
    
    <div class="main_box mb2">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">공지사항</th>
          <th style="text-align: right;"><a class="no-line" href="/notice">+더보기</a>&nbsp;&nbsp;</th>
        </tr>
      </table>

      <table class="">
        <tr class="noticeList">
          <th style="width:15%;">No.</th>
          <th style="width: 75%;">제목</th>
          <th style="width:10%;">작성자</th>
        </tr>
        <tr style="height:20px"><td></td><td></td><td></td></tr>
        <c:forEach var="i" begin="0" end="5">
        <tr>
        <td><a class="no-line" href="/noticeContext?id=${notice[i].id }">${notice[i].id }</a></td>
        <td><a class="no-line" href="/noticeContext?id=${notice[i].id }">${notice[i].title }</a></td>
        <td><a class="no-line" href="/noticeContext?id=${notice[i].id }">${notice[i].writer }</a></td>
        </tr>
        </c:forEach>
    </table>
    </div>
    
    
    <div class="main_box mb3">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 24px;">건의 게시판</th>
          <th style="text-align: right;"><a class="no-line" href="/suggestion">+더보기</a>&nbsp;&nbsp;</th>
        </tr>
      </table>
      <table class="">
        <tr>
          <th style="width:15%;">No.</th>
          <th style="width: 75%;">제목</th>
          <th style="width:10%;">작성자</th>
        </tr>
		<tr style="height:20px"><td></td><td></td><td></td></tr>
        <c:forEach var="i" begin="0" end="5">
       <tr>
        <td style="width:20px;"><a class="no-line" href="/suggestionContent?id=${suggestion[i].id }">${suggestion[i].id }</a></td>
        <td style="width:auto;"><a class="no-line" href="/suggestionContent?id=${suggestion[i].id }">${suggestion[i].title }</a></td>
        <td style="width:20px;"><a class="no-line" href="/suggestionContent?id=${suggestion[i].id }">${suggestion[i].writer }</a></td>
        </tr>
        </c:forEach>
      </table>
    </div>
  </div>
  </section>




</body>
<!-- 스크립트 -->
<script>


	
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
      opacity: '0'
    }, ms, function () {
      $("#show")[0].src = img[j];
    })
    $("#show").animate({
      opacity: '1'
    }, ms)
    j++;
    if (j == 5) {
      j = 0;
    }
    setTimeout(showImage, 4000);
  }

  var i = true;
  imgs = document.querySelectorAll(".img")
  $(document).ready(function () {
    setTimeout(function () {


      $(".img_ul").animate({
        margin: '0 -100%'
      }, 0)
      $(".img_ul").append(img[0]);
    }, 2000)
  })

  function side_slide() {
    if (i) {
      $("nav").animate({
        left: '0%'
      }, 0);
      i = false;
    } else {
      $("nav").animate({
        left: '-20%'
      }, 0);
      i = true;
    }
  }

  function search() {
    document.querySelector(".search_form").submit();
  }

</script>
</html>