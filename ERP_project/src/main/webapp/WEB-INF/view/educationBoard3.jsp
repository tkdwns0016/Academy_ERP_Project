<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href='/static/main.css' rel='stylesheet' />
<script src='/static/main.js'></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var today=new Date();
    var modal = document.getElementById('myModal');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
     
    
    
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
          title: '민현이 바보의날',
          start: '2021-06-21',
          end: '2021-06-24',
          context:'바보바보바보야'
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

  <div class='teduri'>
    <div id='calendar'></div>
   
  </div>

</body>
</html>
