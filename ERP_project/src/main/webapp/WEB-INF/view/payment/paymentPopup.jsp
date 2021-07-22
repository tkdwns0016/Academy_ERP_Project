<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.payment-OrganizationChart{
 overflow-y:auto; 
}
</style>
<body>
    <div style="width: 550px; height: 300px; border: 1px solid #000000; background-color: whitesmoke;">
        <div style="width: 200px; border: 1px solid black; float: left; margin-right: 10px; margin-left: 20px; margin-top: 20px; height: 250px; background-color: white;">
           <details style="margin-left: 10px;">
                <summary>조직도</summary>
          <c:forEach var= "o" items="${Operation}">
        	
          </c:forEach>
        
                    <ul>
                        <li onclick="Operation()">경영팀</li>
                        <li onclick="Development()">개발팀</li>
                        <li onclick="HumanResources()">인사팀</li>
                        <li onclick="research()">영업팀</li>
                    </ul>

            </details>
        </div>
        <div class="payment-OrganizationChart" style="width: 300px; border: 1px solid black; float: left; margin-top: 20px; height: 250px; background-color: white;">
    	
    	
        </div>
    </div>
	
    <script>
   
    function Operation(){
    	 var innerHTML="";
         innerHTML+='<table  style= " border-collapse: collapse; width: 300px; text-align: center; " class="paymentPouup-table">';
         innerHTML+='<tr>';
         innerHTML+='<th style="background-color: ghostwhite;">부서</th>';
         innerHTML+='<th style="background-color: ghostwhite;">직급</th>';
         innerHTML+='<th style="background-color: ghostwhite;">이름</th>';
         innerHTML+='</tr>';
         innerHTML+= '<c:forEach var="op" items="${Operation}">';
         innerHTML+='<tr class="checkTr">';
         innerHTML+="<td onclick=";
         innerHTML+="sendChildValue('${op.name}')>경영팀</td>";
         innerHTML+="<td onclick=";
         innerHTML+='sendChildValue("${op.name}")>';
         innerHTML+='<c:if test="${op.positionId==1 }">사원</c:if>';
         innerHTML+='<c:if test="${op.positionId==2 }">대리</c:if>';
         innerHTML+='<c:if test="${op.positionId==3 }">과장</c:if>';
         innerHTML+='<c:if test="${op.positionId==4 }">차장</c:if>';
         innerHTML+='<c:if test="${op.positionId==5 }">부장</c:if>';
         innerHTML+='<c:if test="${op.positionId==6 }">상무</c:if>';
         innerHTML+='<c:if test="${op.positionId==7 }">이사</c:if>';
         innerHTML+='</td>';
         innerHTML+="<td onclick=";
         innerHTML+="sendChildValue('${op.name}')>${op.name}</td>";
         innerHTML+='</tr>';
         innerHTML+='</c:forEach>';
         innerHTML+='</table>';

        $(".payment-OrganizationChart").html(innerHTML);
    }
    
    function Development(){
        var innerHTML="";
        innerHTML+='<table  style= " border-collapse: collapse; width: 300px; text-align: center; " class="paymentPouup-table">';
        innerHTML+='<tr>';
        innerHTML+='<th style="background-color: ghostwhite;">부서</th>';
        innerHTML+='<th style="background-color: ghostwhite;">직급</th>';
        innerHTML+='<th style="background-color: ghostwhite;">이름</th>';
        innerHTML+='</tr>';
        innerHTML+= '<c:forEach var="dev" items="${Development}">';
        innerHTML+='<tr class="checkTr">';
        innerHTML+="<td onclick=";
        innerHTML+="sendChildValue('${dev.name}')>개발팀</td>";
        innerHTML+="<td onclick=";
        innerHTML+='sendChildValue("${dev.name}")>';
        innerHTML+='<c:if test="${dev.positionId==1 }">사원</c:if>';
        innerHTML+='<c:if test="${dev.positionId==2 }">대리</c:if>';
        innerHTML+='<c:if test="${dev.positionId==3 }">과장</c:if>';
        innerHTML+='<c:if test="${dev.positionId==4 }">차장</c:if>';
        innerHTML+='<c:if test="${dev.positionId==5 }">부장</c:if>';
        innerHTML+='<c:if test="${dev.positionId==6 }">상무</c:if>';
        innerHTML+='<c:if test="${dev.positionId==7 }">이사</c:if>';
        innerHTML+='</td>';
        innerHTML+="<td onclick=";
        innerHTML+="sendChildValue('${dev.name}')>${dev.name}</td>";
        innerHTML+='</tr>';
        innerHTML+='</c:forEach>';
        innerHTML+='</table>';

        $(".payment-OrganizationChart").html(innerHTML);
    }
    
    function HumanResources(){
    	var innerHTML="";
        innerHTML+='<table  style= " border-collapse: collapse; width: 300px; text-align: center; " class="paymentPouup-table">';
        innerHTML+='<tr>';
        innerHTML+='<th style="background-color: ghostwhite;">부서</th>';
        innerHTML+='<th style="background-color: ghostwhite;">직급</th>';
        innerHTML+='<th style="background-color: ghostwhite;">이름</th>';
        innerHTML+='</tr>';
        innerHTML+= '<c:forEach var="hr" items="${HumanResources}">';
        innerHTML+='<tr class="checkTr">';
        innerHTML+="<td onclick=";
        innerHTML+="sendChildValue('${hr.name}')>인사팀</td>";
        innerHTML+="<td onclick=";
        innerHTML+='sendChildValue("${hr.name}")>';
        innerHTML+='<c:if test="${hr.positionId==1 }">사원</c:if>';
        innerHTML+='<c:if test="${hr.positionId==2 }">대리</c:if>';
        innerHTML+='<c:if test="${hr.positionId==3 }">과장</c:if>';
        innerHTML+='<c:if test="${hr.positionId==4 }">차장</c:if>';
        innerHTML+='<c:if test="${hr.positionId==5 }">부장</c:if>';
        innerHTML+='<c:if test="${hr.positionId==6 }">상무</c:if>';
        innerHTML+='<c:if test="${hr.positionId==7 }">이사</c:if>';
        innerHTML+='</td>';
        innerHTML+="<td onclick=";
        innerHTML+="sendChildValue('${hr.name}')>${hr.name}</td>";
        innerHTML+='</tr>';
        innerHTML+='</c:forEach>';
        innerHTML+='</table>';

        $(".payment-OrganizationChart").html(innerHTML);
    }
    
    
    
    
        function research(){
        	var innerHTML="";
            innerHTML+='<table  style= " border-collapse: collapse; width: 300px; text-align: center; " class="paymentPouup-table">';
            innerHTML+='<tr>';
            innerHTML+='<th style="background-color: ghostwhite;">부서</th>';
            innerHTML+='<th style="background-color: ghostwhite;">직급</th>';
            innerHTML+='<th style="background-color: ghostwhite;">이름</th>';
            innerHTML+='</tr>';
            innerHTML+= '<c:forEach var="rs" items="${research}">';
            innerHTML+='<tr class="checkTr">';
            innerHTML+="<td onclick=";
            innerHTML+="sendChildValue('${rs.name}')>영업팀</td>";
            innerHTML+="<td onclick=";
            innerHTML+='sendChildValue("${rs.name}")>';
            innerHTML+='<c:if test="${rs.positionId==1 }">사원</c:if>';
            innerHTML+='<c:if test="${rs.positionId==2 }">대리</c:if>';
            innerHTML+='<c:if test="${rs.positionId==3 }">과장</c:if>';
            innerHTML+='<c:if test="${rs.positionId==4 }">차장</c:if>';
            innerHTML+='<c:if test="${rs.positionId==5 }">부장</c:if>';
            innerHTML+='<c:if test="${rs.positionId==6 }">상무</c:if>';
            innerHTML+='<c:if test="${rs.positionId==7 }">이사</c:if>';
            innerHTML+='</td>';
            innerHTML+="<td onclick=";
            innerHTML+="sendChildValue('${rs.name}')>${rs.name}</td>";
            innerHTML+='</tr>';
            innerHTML+='</c:forEach>';
            innerHTML+='</table>';

            $(".payment-OrganizationChart").html(innerHTML);
        }
        
        	
        	function sendChildValue(name){
				
        		opener.setPaymentLineValue(name);

        		window.close();
        	}
    </script>
 
</body>
</html>