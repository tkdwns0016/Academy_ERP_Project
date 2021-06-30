<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    function list(){
    	$.ajax({
    		url:"/list",
    		async:false,
    		type:"get",
    		dataType:"json",
    		success:function(result){
    			arr=result;	
    		}
    	});
    };
    list()
console.log(arr);
    
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
      events: [
        { id:1,
          title: arr[0].title,
          start: arr[0].startDate,
          end: arr[0].endDate,
          context:arr[0].content
        },
        {
          title: 'Long Event',
          start: '2020-09-07',
          end: '2020-09-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-09-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-09-11',
          end: '2020-09-13'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T10:30:00',
          end: '2020-09-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-09-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-09-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-09-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-09-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-09-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        }
      ]
    });

    calendar.render();
	for(let i=0;i<arr.length;i++){
		calendar.addEvent(arr[i]);
	}
	
  });

</script>


<style>
.hidden{

display: none;
}
.modal{
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
          
 }
.modal-content {
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
    margin: 0 auto;
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
</style>
</head>
<body>
 <div class='teduri'>
    <div id='calendar'></div>
   
  </div>

  <div class="modal hidden">
    <div class="modal-content">
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
  <button value="체크"></button>
<script>
  $(".cancle")[0].onclick=function(){
    $(".modal")[0].classList.add('hidden');
  }
  $(".cancle")[1].onclick=function(){
    $(".modal")[0].classList.add('hidden');
  }
</script>
</body>
</html>