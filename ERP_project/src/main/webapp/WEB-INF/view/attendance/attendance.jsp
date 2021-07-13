<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <style>
		
            section {
                text-align: center;
                position: relative;
                top: 10%
            }


            .section_table {
                border-collapse: collapse;
                clear: both;
                margin: 0 auto;
                min-width: 850px;
            }

            td,
            th {
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
			.date_div{
			font-size: 150%;
			float:left;
			}
			
            .thLine_back_color {
                background-color: gainsboro;
            }
            .select_date{
            position:absolute; 
            width: auto;
            height:auto; 
            top:25%; 
            left:40% 
            }
            .arrow_img{
            margin: 6px 0;
            float: left;
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
        <section>
            <div class="select_date">
            <svg class="arrow_img" xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
			<path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/></svg>
			<div class="date_div"><%=LocalDate.now()%> 근태 리스트</div>
			<svg class="arrow_img" xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
  			<path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/></svg>
		</div>

            <table class="section_table">
                <tr>
                    <td colspan="4" class="border_none">
                        <div style="text-align: left;">
                            <h3>🚩근태리스트</h3>
                        </div>
                    </td>
                    <td colspan="5" class="border_none">
                        <div style="text-align: right;">🔴Not Perpect&nbsp;&nbsp;&nbsp;&nbsp;🟤Perpect</div>
                    </td>
                </tr>
                <tr class="thLine_back_color">
                    <th>처리상태</th>
                    <th>ID</th>
                    <th>이름</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>근로유형</th>
                    <th>근무시작시간</th>
                    <th>근무종료시간</th>
                    <th>소정근무시간</th>
                </tr>
                <tr>
                    <td>
                        <div class="attendance"></div>
                    </td>
                    <td>21100001</td>
                    <td>송만현</td>
                    <td>경영팀</td>
                    <td>회장</td>
                    <td>정규</td>
                    <td class="on_time">09:10</td>
                    <td>18:00</td>
                    <td>8 시간 50분</td>
                </tr>
                <tr>
                    <td>
                        <div class="attendance"></div>
                    </td>
                    <td>21100002</td>
                    <td>송문현</td>
                    <td>경영팀</td>
                    <td>사원</td>
                    <td>정규</td>
                    <td class="on_time">08:50</td>
                    <td>18:10</td>
                    <td>9 시간 20분</td>
                </tr>
            </table>
        </section>
    </body>
    <script>
        var attendance = $(".attendance");
        var on_timeList = $(".on_time");
        for (let i = 0; i < attendance.length; i++) {
            let this_date = on_timeList[i].innerHTML;
            let ontime = this_date.substring(this_date.indexOf(" ") + 1, 99);
            if (ontime > "09:00:00") {
                attendance[i].style.background = "red"
            } else {
                attendance[i].style.background = "green"
            }
        }
    </script>
</html>