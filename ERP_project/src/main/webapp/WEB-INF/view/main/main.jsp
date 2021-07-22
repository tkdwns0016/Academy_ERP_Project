 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>

<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<title>Insert title here</title>

  <style>


   .container-23{
   width: 800px;
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
    }

    .main_box2 {
      width: 50%;
      height: 15%;
      background-color: white;
      text-align: center;
      position: relative;
      left:7%
    }

   #calendar{
   height:300px;
   }
   

  .fc-daygrid-day-number{
     text-decoration:none;
     color:black;
  }
  .fc-daygrid-day-number:hover {
   color:black;
}
.boardTd{
	border: 1px solid #eeeeee;
}
.boardTr{
	border: 1px solid #eeeeee;
}
.boardTh{
	border: 1px solid #eeeeee;
}
.boardTable{
	border-collapse: collapse;
	text-align: center;
}
.boardId{
	width: 100px;
}
.boardTitle{
	width: 400px;
}
.boardWriter{
	width: 200px;
}
.boardCount{
	width: 175px;
}
  </style>
  </head>
  <link href='/static/main.css' rel='stylesheet' />
<script src='/static/main.js'></script>
<!-- 추가 -->

 <link rel="stylesheet" href="/static/mainboard.css">
    <link rel="stylesheet" href="https://www.suu.kr/skin/latest/carway_online/style.css?ver=200723">
    <link rel="stylesheet" href="/static/carWay.css">
    <!--[if lte IE 8]>
    <script src="https://www.suu.kr/js/html5.js"></script>
    <![endif]-->
    <script src="https://www.googletagservices.com/activeview/js/current/osd.js"></script><script src="https://partner.googleadservices.com/gampad/cookie.js?domain=www.suu.kr&amp;callback=_gfp_s_&amp;client=ca-pub-5461327452522617"></script><script src="https://pagead2.googlesyndication.com/pagead/js/r20210712/r20190131/show_ads_impl_fy2019.js" id="google_shimpl"></script><script>
    // 자바스크립트에서 사용하는 전역변수 선언
    var g5_url       = "https://www.suu.kr";
    var g5_bbs_url   = "https://www.suu.kr/bbs";
    var g5_is_member = "";
    var g5_is_admin  = "";
    var g5_is_mobile = "";
    var g5_bo_table  = "";
    var g5_sca       = "";
    var g5_editor    = "";
    var g5_cookie_domain = "";
    </script>
    <script src="https://www.suu.kr/js/jquery.menu.js?ver=200723"></script>
    <script src="https://www.suu.kr/js/common.js?ver=200723"></script>
    <script src="https://www.suu.kr/js/rumi.js"></script>
    <script src="https://www.suu.kr/js/jquery.rumiTab.js"></script>
    
    <script src="https://www.suu.kr/js/wrest.js?ver=200723"></script>
    <script src="https://www.suu.kr/js/placeholders.min.js"></script>
    <link rel="stylesheet" href="https://www.suu.kr/js/font-awesome/css/font-awesome.min.css">
    
    <script data-ad-client="ca-pub-5461327452522617" async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js" data-checked-head="true"></script><!-- 구글 광고 -->
    
    <meta http-equiv="origin-trial" content="A88otRz1Fd3Nt567e2IYshC18LL3KGVXpVJW9oTCId4RYaygt23pbb4JqrbdIO/bwZPWEmRjBIRBu/bZbDR7Pg4AAABueyJvcmlnaW4iOiJodHRwczovL2ltYXNkay5nb29nbGVhcGlzLmNvbTo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MzQwODMxOTksImlzVGhpcmRQYXJ0eSI6dHJ1ZX0="><meta http-equiv="origin-trial" content="A0gCLbXCcL0R1Oc8tFPDs0G4Elz17w3zHp+Zst66+D17veE2o7fUcPsA114QtSTRqfVJLMeTSdeWOom0CcyCsgYAAAB7eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MzQwODMxOTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A9RQ+LxFazAousxUwSCzaihJjHLO1UyjQp0teZKHl7WdbVjPDfHSKMd6D/ZI5MTjqClFycbl70EFd7cBJWXqKQEAAACBeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MzQwODMxOTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A6WKeWsdn1Ct+ZPqS9NCxxaiBoQ7wdTkK2/gE69Yu0gfBKJfo1gOvgkGmf5/xaIajT/RUb9AbnF1FsSZ47cCcQcAAACBeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MzQwODMxOTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A04ZCu7yjrHgwQJK5ISHhH1DSg0qqowEay3n70KO6wV3D2Mj+OX3Kw20aSMitzgdG1xfrN7sOJV/dZIk+RvCzA4AAAB2eyJvcmlnaW4iOiJodHRwczovL2dvb2dsZS5jb206NDQzIiwiZmVhdHVyZSI6IlRydXN0VG9rZW5zIiwiZXhwaXJ5IjoxNjM0MDgzMTk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A3HucHUo1oW9s+9kIKz8mLkbcmdaj5lxt3eiIMp1Nh49dkkBlg1Fhg4Fd/r0vL69mRRA36YutI9P/lJUfL8csQoAAACFeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiQ29udmVyc2lvbk1lYXN1cmVtZW50IiwiZXhwaXJ5IjoxNjI2MjIwNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="A0OysezhLoCRYomumeYlubLurZTCmsjTb087OvtCy95jNM65cfEsbajrJnhaGwiTxhz38ZZbm+UhUwQuXfVPTg0AAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiQ29udmVyc2lvbk1lYXN1cmVtZW50IiwiZXhwaXJ5IjoxNjI2MjIwNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="AxoOxdZQmIoA1WeAPDixRAeWDdgs7ZtVFfH2y19ziTgD1iaHE5ZGz2UdSjubkWvob9C5PrjUfkWi4ZSLgWk3Xg8AAACLeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiQ29udmVyc2lvbk1lYXN1cmVtZW50IiwiZXhwaXJ5IjoxNjI2MjIwNzk5LCJpc1N1YmRvbWFpbiI6dHJ1ZSwiaXNUaGlyZFBhcnR5Ijp0cnVlfQ=="><meta http-equiv="origin-trial" content="AwfG8hAcHnPa/kJ1Co0EvG/K0F9l1s2JZGiDLt2mhC3QI5Fh4qmsmSwrWObZFbRC9ieDaSLU6lHRxhGUF/i9sgoAAACBeyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiSW50ZXJlc3RDb2hvcnRBUEkiLCJleHBpcnkiOjE2MjYyMjA3OTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="AwQ7dCmHkvR6FuOFxAuNnktYSQrGbL4dF+eBkrwNLALc69Wr//PnO1yzns3pjUoCaYbKHtVcnng2hU+8OUm0PAYAAACHeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXN5bmRpY2F0aW9uLmNvbTo0NDMiLCJmZWF0dXJlIjoiSW50ZXJlc3RDb2hvcnRBUEkiLCJleHBpcnkiOjE2MjYyMjA3OTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="AysVDPGQTLD/Scn78x4mLwB1tMfje5jwUpAAzGRpWsr1NzoN7MTFhT3ClmImi2svDZA7V6nWGIV8YTPsSRTe0wYAAACHeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZXRhZ3NlcnZpY2VzLmNvbTo0NDMiLCJmZWF0dXJlIjoiSW50ZXJlc3RDb2hvcnRBUEkiLCJleHBpcnkiOjE2MjYyMjA3OTksImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9"><link rel="preload" href="https://adservice.google.co.kr/adsid/integrator.js?domain=www.suu.kr" as="script"><script type="text/javascript" src="https://adservice.google.co.kr/adsid/integrator.js?domain=www.suu.kr"></script><link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=www.suu.kr" as="script"><script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=www.suu.kr"></script></head>
    <!-- 스크립트 추가끝 -->
<body class="body" onload="showImage()">
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
    <div class="img_div" style="height: 30%;">
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
    
    
     <!-- 변경 추가 -->
    <div class="main_box2 mb3">
     
         <script>
    $(function () {
        /* latest_tab(요소ID, 탭번호(열림), 자동탭[true-실행,false-정지], 시간[1000-1초]), 주의:자동탭은 1개만 사용하세요. 2개부터는 오류 발생. */
        latest_tab("TAB_A", 1, true, 3000);
        latest_tab("TAB_B", 3, false, 3000);
        latest_tab("TAB_C", 5, false, 3000);
        latest_tab("TAB_D", 1, false, 3000);
        latest_tab("TAB_E", 2, false, 3000);
    });
    
    // 자동탭의 시간을 담는 전역변수.
    var tabTimer;
    /*
    * @param id : 요소ID (탭ID)
    * @param s : 시작탭번호
    * @param t : 반복시간 (1000 = 1초)
    */
/*     function start_auto_tab(id, s, t) {
        var max_idx = $("#"+id+" ul.rumi_tabs li").length;
        tabTimer = setInterval(function() {
            
            $("#"+id+" ul.rumi_tabs li:nth-child("+s+")").trigger("click");
            //$("#"+id+" ul.rumi_tabs li").removeClass("active").removeClass("active").css("color", "#333");
            //$("#"+id+" ul.rumi_tabs li:nth-child("+s+")").addClass("active").css({"color":"#dd6666"});
            //$("#"+id+" .rumi_tab_content").hide();
            //$("#"+id+" .rumi_tab_content:nth-child("+s+")").fadeIn();
    
            if(s==max_idx) {
                    s=1; // 탭의 마지막이면 다시 1번부터 시작
            } else {
                s++;
            }
        },t);
    } */
    
    /**
    * 최신글 탭메뉴 (최신글로 사용)
    * @param id     : TAB ID
    * @param idx    : 초기 열릴 페이지
    * @param auto   : 탭 자동이동 (false=수동, true=자동)
    * @param t      : 탭 자동이동시 간견 (1000 = 1초)
    */
    function latest_tab(id, idx, auto, t) {
    
        $("#"+id+" .rumi_tab_content").hide();
        $("#"+id+" ul.rumi_tabs li:nth-child("+idx+")").addClass("active").css({"color":"#dd6666"});
        $("#"+id+" .rumi_tab_content:nth-child("+idx+")").show();
    
        $("#"+id+" ul.rumi_tabs li").click(function (event) {
            var target    = event.currentTarget||event.explicitOriginalTarget||event.srcElement||document.activeElement;
            $(target.parentElement.children).removeClass("active").css("color", "#333");
            $(target).addClass("active").css({"color":"#dd6666"});
            //$("#"+id+" ul.rumi_tabs li").removeClass("active").css("color", "#333");
            //$(this).addClass("active").css({"color":"#dd6666"});
            $("#"+id+" .rumi_tab_content").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn()
        });
    
        if(auto==true){
            
            var s = (idx+1); // 초기 열린 페이지부터 탭 자동 실행
            start_auto_tab(id, s, t);
    
            $("#"+id).mouseenter(function() {
                clearInterval(tabTimer);
                console.log("반복종료");
            });
    
            $("#"+id).mouseleave(function() {
                var re_total = $("#"+id+" ul.rumi_tabs li").index();
                var re_idx = $("#"+id+" ul.rumi_tabs li").index($("#"+id+" ul.rumi_tabs li").closest("li.active"));
                s = (re_idx + 2)
                if(s>(re_total+1)) { s=1; }
                start_auto_tab(id, s, t);
                console.log("반복시작");
            });
        }
    }
    
    </script>
        
        
           <!-- 콘텐츠 시작 { -->
        <div id="wrapper" style="height: auto !important; min-height: 0px !important;">
            <div class="container-23">
                <div style="width:100%; text-align:center;margin-bottom:20px; ">
                    <!-- SUU Top page -->
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
    <style>
    span.txt_line { display:inline-block; padding:15px 0px; font-size:14px; }
    
    ul.rumi_tabs { margin: 0; padding: 0; float: left; list-style: none; height: 40px; border-bottom: 1px solid #ccc; border-left: 1px solid #ccc; border-right: 0px solid #ccc; border-top: 0px solid #ccc; width: 100%; font-size:12px; }
    ul.rumi_tabs li { float: left; text-align:center; cursor: pointer; width:82px; height: 40px; line-height: 40px; border: 1px solid #ccc; border-left: none; font-weight: bold; background: #fafafa; overflow: hidden; position: relative; }/* 탭 - 메뉴 */
    ul.rumi_tabs li:hover { background:#eee; color:red} 
    ul.rumi_tabs li.active { background: #FFFFFF; color:#dd6666; border-top:3px solid #dd6666; border-bottom: 1px solid #FFFFFF; } /* 선택된 탭 스타일 */
    .rumi_tab_container { border: 1px solid #ccc; padding:12px 8px 8px 8px; border-top: none; clear: both; float: left; width: 100%; background: #FFFFFF; height:317px; }/* 탭 내용 박스 */
    .rumi_tab_content { padding: 5px; font-size: 12px; display: none; text-align:left; }
    .rumi_tab_container .rumi_tab_content ul { width:100%; margin:0px; padding:0px; }
    .rumi_tab_container .rumi_tab_content ul li { padding:5px; list-style:none }
    .rumi_tab_box { width: 100%;}/* 탭 전체 크기 */
    
    #TAB_A { min-height:270px; margin-bottom:30px; }
    #TAB_B { min-height:270px; margin-bottom:30px; }
    #TAB_C { min-height:270px; margin-bottom:30px; }
    #TAB_D { min-height:270px; margin-bottom:30px; }
    #TAB_E { min-height:270px; margin-bottom:30px; }
    
    #TAB_LR .tab_left { float:left; width:50%; text-align:left; padding-right:5px; }
    #TAB_LR .tab_right { float:right; width:50%; text-align:right; padding-left:5px; }
    
    </style>
     
    <div id="TAB_A" class="rumi_tab_box">
        <ul class="rumi_tabs">
            <li rel="A_tab1" class="" style="color: rgb(51, 51, 51);">공지사항</li>
            <li rel="A_tab2" class="" style="color: rgb(51, 51, 51);">건의 게시판</li>
            <li rel="A_tab3" class="" style="color: rgb(51, 51, 51);">익명 게시판</li>
          
         
        </ul>
        <div class="rumi_tab_container">
            <div id="A_tab1" class="rumi_tab_content" style="display: none;">
   			 	<div id="cw">
                	<table class="boardTable">
                		<tr class="boardTr"><th class="boardId boardTr">No.</th><th class="boardTitle boardTh">게시글</th><th class="boardWriter boardTh">작성자</th><th class="suggestionCount">조회수</th></tr>
                    		<c:forEach var="i" begin="0" end="9">
                        		<tr class="boardTr" onclick="location.href=('/noticeSearch?id=${notice[i].id }')"><td class="boardTd">${notice[i].id}</td><td class="boardTd"> ${notice[i].title }</td><td class="boardTd">${noticeWriter[i] }</td><td class="boardTd">${notice[i].count }</td></tr>
                    		</c:forEach>
                	</table>
   			 	</div>
    		</div>
            <div id="A_tab2" class="rumi_tab_content" style="display: none;">
                <table class="boardTable">
                	<tr class="boardTr"><th class="boardId boardTh">No.</th><th class="boardTitle boardTh">게시글</th><th class="boardWriter boardTh">작성자</th><th class="boardCount">조회수</th></tr>
                    <c:forEach var="i" begin="0" end="9">
                        <tr class="boardTr" onclick="location.href=('/suggestionSearch?id=${suggestion[i].id }')"><td class="boardTd">${suggestion[i].id}</td><td class="boardTd"> ${suggestion[i].title }</td><td class="boardTd">${suggestionWriter[i] }</td><td class="boardTd">${suggestion[i].count }</td></tr>
                    </c:forEach>
                </table>
            </div>

            <div id="A_tab3" class="rumi_tab_content" style="display: none;">
                <table class="boardTable">
                	<tr class="boardTr"><th class="boardId boardTh">No.</th><th class="boardTitle boardTh">게시글</th><th class="boardWriter boardTh">작성자</th><th class="boardCount">조회수</th></tr>
                    <c:forEach var="i" begin="0" end="9">
                        <tr class="boardTr" onclick="location.href=('/anonymousSearch?id=${anonymous[i].id }')"><td class="boardTd">${anonymous[i].id}</td><td class="boardTd"> ${anonymous[i].title }</td><td class="boardTd">${anonymous[i].nickName }</td><td class="boardTd">${anonymous[i].count }</td></tr>
                    </c:forEach>
                </table>
            </div>

            
        </div>
    </div>
    
 
    
       
          

    <div style="clear:both;"></div>
     <!-- 변경 끝 -->
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
      eventLimit:false,
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