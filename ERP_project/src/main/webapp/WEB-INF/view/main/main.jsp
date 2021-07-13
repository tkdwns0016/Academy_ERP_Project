 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>Insert title here</title>

  <style>

    section {
      width: 100%;
      height: 100%;
      max-width: 100%
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

   
    #calendar{
    	height: 300px;
    	
    }
  .fc-daygrid-day-number{
  	text-decoration:none;
  	color:black;
  }
  .fc-daygrid-day-number:hover {
	color:black;
}

  </style>
  </head>
  <link href='/static/main.css' rel='stylesheet' />
<script src='/static/main.js'></script>


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
    	<div id='calendar' ></div>
   
    </div>
    
    
    <div class="main_box mb2">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 22px;">공지사항</th>
          <th style="text-align: right;"> <a class="no-line" href="/notice">+더보기</a>&nbsp;&nbsp;</th>
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
        <tr onclick="location.href=('/noticeSearch?id=${notice[i].id }')">
         <td style="width:20px; height: 50px;" >${notice[i].id }</td>
        <td style="width:auto; height: 50px;" >${notice[i].title }</td>
        <td style="width:20px; height: 50px;" >${notice[i].writer }</td>
       </tr>
        </c:forEach>
    </table>
    </div>
    
    
    <div class="main_box mb3">
      <table style=" margin-bottom: 5%;">
        <tr style="background: #f6f6f6; border-bottom: 1px solid black;">
          <th></th>
          <th style="text-align: center; font-size: 22px;">건의 게시판</th>
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
       <tr onclick="location.href=('/suggestionSearch?id=${suggestion[i].id }')">
        <td style="width:20px; height: 50px;">${suggestion[i].id }</td>
        <td style="width:auto; height: 50px;">${suggestion[i].title }</td>
        <td style="width:20px; height: 50px;">${suggestion[i].writer }</td>
        </tr>
        </c:forEach>
      </table>
    </div>
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
    var today=new Date();
    var events;
    function list(){
    	$.ajax({
    		url:"/mainlist",
    		async:false,
    		type:"get",
    		dataType:"json",
    		success:function(result){
    			for(let i=0;i<result.length;i++){
    				if(result[i].departmentId==10){
    					result[i].departmentId="경영팀 10"
    				}else if(result[i].departmentId==20){
    					result[i].departmentId="개발팀 20"
    				}else if(result[i].departmentId==30){
    					result[i].departmentId="인사팀 30"
    				}else{
    					result[i].departmentId="영업팀 40"
    				}
    			}
    			arr=result;	
    			
    			events = arr.map(function(item){
    				return{
    					publicId : item.id,
						title : item.title +" ["+item.departmentId.substring(0,3)+"]",
						start : item.startDate,
						end : item.endDate,
						STATUS : item.memo,
						groupId : item.departmentId.substring(4,6),
						id : item.writer
    				}
    			});
    		}
    	});
    };
    list()
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
     
   
      initialDate: today,
      navLinks: false, // can click day/week names to navigate views
      selectable: false,
      selectMirror: true,
      
      eventClick : function(event) {
    	  location.href="/educationBoard?departmentId="+event.event.groupId;
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: events });

    calendar.render();

	$(".fc-scroller-liquid-absolute").removeAttr("style");
	$("a").css("text-decoration","none");
	$("a").css("color","black");
	
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

 
  function search() {
    document.querySelector(".search_form").submit();
  }

 
  
</script>
</html>