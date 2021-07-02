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
     
      initialDate: today,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
      select: function(arg) {
        $(".mo")[0].classList.remove('hidden');  
      },
      eventClick: function(arg) {
    	  $(".mo")[0].classList.remove('hidden');  
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: events });

    calendar.render();
	for(let i=0;i<arr.length;i++){
		calendar.addEvent(arr[i]);
	}
	$("a").css('text-decoration','none')
	$("a").css('color','black')

  });
</script>

<style>
.hidden{

display: none;
}
a{
	text-decoration: none;
}
.mo{
            position: absolute; /* Stay in place */
            z-index: 10; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
          
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
  

  #calendar {
    max-width: 1100px;
    margin: 100px auto;
  }
  table{
    border-collapse: collapse;
    text-align: center;
  }
tr td{
  border: 1px solid #c9c2c2;
}
.edu_name{
  width: 100px;
}
.edu_sml{
  width: 500px;
}
.edu_name_lrg{
  height: 120px;
}
.content{
  width: 98%;
  height: 110px;
}
.bar-1{
  width: 98%;
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
        <div style="text-align: center; font-size: 20px; font-weight: bold;"> 교육 일정</div>
        <br>
       <form action="/educationBoard" method="POST"> 
         <table>
           <tr><td class="edu_name">타이틀</td>      <td class="edu_sml"> <input class="bar-1" type="text" name="title" placeholder="제목 입력"><br></td></tr>
           <tr><td class="edu_name">교육 시작일</td> <td class="edu_sml">  <input class="bar-1" type="date" name="startDate"><br></td></tr>
           <tr><td class="edu_name">교육 종료일</td> <td class="edu_sml"> <input class="bar-1" type="date" name="endDate"> <br></td></tr>
           <tr><td class="edu_name_lrg">교육 내용</td>   <td> <textarea class="content" name="memo" placeholder="교육 내용 입력"></textarea> <br></td></tr><br>
          </table>
          <br>
          <input class="cancle" style="margin-left: 45%;" type="submit" value="저장">&nbsp; <input class="cancle" type="reset" value="취소">  
        </form> 
        </div>

  </div>

<script>
  $(".cancle")[0].onclick=function(){  
    $(".mo")[0].classList.add("hidden");
  }
  $(".cancle")[1].onclick=function(){
	  $(".mo")[0].classList.add("hidden");
  }
</script>
</body>
</html>