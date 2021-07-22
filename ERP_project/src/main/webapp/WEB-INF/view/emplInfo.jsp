<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	type="text/javascript"></script>
<style>
@font-face {
	font-family: 'MaplestoryOTFLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'MaplestoryOTFLight';
	font-size: 13px;
	text-align: center;
}

.container-resultEmplSearch {
	width: 850px;
	height: 520px;
	box-shadow: 1px 1px 1px 1px gainsboro;
}

.searchPopup-td {
	background-color: ghostwhite;
}

table {
	position: relative;
	left: 3%;
	width: 800px;
	border-collapse: collapse;
}

.table-top {
	border-top: 2px solid gainsboro;
}

td {
	border-bottom: 1px solid gainsboro;
}

th {
	text-align: left;
	border: none;
}

.img1 {
	width: 30px;
}

.img2 {
	border: 1px solid black;
}

button {
	font-family: 'MaplestoryOTFLight';
	border: none;
	background-color: lavender;
	width: 60px;
	height: 25px;
	border-radius: 8px;
}

button:hover {
	background-color: gainsboro;
}

input[type=text] {
	text-align: center;
	font-family: 'MaplestoryOTFLight';
	border: none;
}

input[type=date] {
	text-align: center;
	font-family: 'MaplestoryOTFLight';
	border: none;
}

input[type=email] {
	text-align: center;
	font-family: 'MaplestoryOTFLight';
	border: none;
}

select {
	font-family: 'MaplestoryOTFLight';
	border: none;
}

input:focus {
	outline: none;
}
</style>
<body>
<c:if test="${not empty resultUpdate }">
	<c:if test="${resultUpdate }">
	<script>
		alert("인사 정보 수정이 완료 되었습니다.")
		window.close()
	</script>
	</c:if>
	
	<c:if test="${!resultUpdate }">
	<script>
		alert("데이터 수정에 실패하였습니다.")
		window.close();
	</script>
	</c:if>
</c:if>
	<form action="/emplInfo?id=${resultEmpl.id }" method="post">
		<div class="container-resultEmplSearch">
			<table>
				<th>
					<h3>
						<img class="img1" src="/image/basic.jpg" style="margin-bottom: -10px;">
						인사정보조회
					</h3> <span> <select name="manager" class="manager">
							<option value="권한">권한</option>
							<option value="비권한">비권한</option>
					</select>
				</span>
				</th>
				<tr>
					<td class="table-top" rowspan="5"><img class="img2"
						src="/image/${resultEmpl.imgName }" width="200px" height="200px"
						style="position: relative; top: 3px;"></td>
					<td width="1%"
						style="border: none; border-top: 2px solid gainsboro;"></td>
					<td class="searchPopup-td table-top" width="12%">사원번호</td>
					<td class="table-top"><input type="text" name="userId"
						value="${resultEmpl.userId }" size="15"></td>
					<td class="searchPopup-td table-top" width="10%">성명</td>
					<td class="table-top"><input type="text" name="name"
						value="${resultEmpl.name }" size="10"></td>
					<td class="searchPopup-td table-top" width="10%">영문이름</td>
					<td class="table-top"><input type="text" name="englishName"
						value="${resultEmpl.englishName }" size="12"></td>

				</tr>
				<tr>
					<td style="border: none;"></td>
					<td class="searchPopup-td">주민등록번호</td>
					<td><input class="jumin" type="text"
						value="" size="16"></td>
					<td class="searchPopup-td">생일</td>
					<c:if test="${not empty resultEmpl.birth}">
					<td><input type="text" name="birth" value="${resultEmpl.birth}" size="10">
					</td>
					</c:if>
					<c:if test="${empty resultEmpl.birth}">
					<td><input type="text" name="birth" value="${resultEmpl.birthDate.substring(2,4)}월${resultEmpl.birthDate.substring(4,6)}일" size="10">
					</td>
					</c:if>
					<td class="searchPopup-td">양/음력</td>
					<td><select name="lunarCalendar" class="lunarCalendar">
							<option value="">선택</option>
							<option value="양력">양력</option>
							<option value="음력">음력</option>
					</select></td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td class="searchPopup-td">결혼유무</td>
					<td><select name="marriage" class="marriage">
							<option value="">선택</option>
							<option value="미혼">미혼</option>
							<option value="기혼">기혼</option>
					</select></td>
					<td class="searchPopup-td">성별</td>
					<td><select name="sex" class="sex">
							<option value="남성">남성</option>
							<option value="여성">여성</option>
							<option value="기타">기타</option>
					</select></td>
					<td class="searchPopup-td">내외국인</td>
					<td><select name="koreanForeigner" class="koreanForeigner">
							<option value="">선택</option>
							<option value="내국인">내국인</option>
							<option value="외국인">외국인</option>
					</select></td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td class="searchPopup-td">연봉</td>
					<td width="14%"><input type="text" 
						name="salary" value="${resultEmpl.salary }" size="12"></td>
					<td class="searchPopup-td">회사전화</td>
					<td width="18%"><input type="text" name="companyPhone"
						value="${resultEmpl.companyPhone}" size="16"></td>
					<td class="searchPopup-td">핸드폰</td>
					<td><input type="text" name="phone" value="${resultEmpl.phone }"
						size="14"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="1" class="searchPopup-td">이메일</td>
					<td colspan="5"><input type="email" name="email"
						value="${resultEmpl.email }" size="50"></td>
				</tr>
				<tr>
					<td style="height: 2px;" colspan="8"></td>
				</tr>
			</table>
			<div style="height: 10px;"></div>
			<table>
				<tr>
					<td class="searchPopup-td table-top" height="25px">주소</td>
					<td class="table-top" colspan="5"><input type="text" name="address1"
						style="text-align: right;" value="${resultEmpl.address1 }" size="30"><input style="text-align: left;" type="text" name="address2" value="${resultEmpl.address2 }"></td>
				</tr>
				<tr>
					<td class="searchPopup-td" height="25px">사업장 주소</td>
					<td colspan="5"><input type="text" name="companyAddress"
						value="${resultEmpl.companyAddress }" size="90"></td>

				</tr>
				<tr>
					<td class="searchPopup-td" height="25px">부서</td>
					<td><select name="departmentId" class="department">
							<option value="10">경영팀</option>
							<option value="20">개발팀</option>
							<option value="30">인사팀</option>
							<option value="40">영업팀</option>
					</select></td>
					<td class="searchPopup-td">직급</td>
					<td><select name="positionId" class="position">
							<option value="1">사원</option>
							<option value="2">대리</option>
							<option value="3">과장</option>
							<option value="4">차장</option>
							<option value="5">팀장</option>
							<option value="6">부장</option>
							<option value="7">상무</option>
							<option value="8">이사</option>
							<option value="9">회장</option>
					</select></td>
					<td class="searchPopup-td">재직구분</td>
					<td><select name="status" class="status">
							<option value="재직">재직</option>
							<option value="퇴사">퇴사</option>
							<option value="휴가">휴가</option>
					</select></td>
				</tr>
				<tr>
					<td class="searchPopup-td" height="25px">급여지급기준</td>
					<td><select name="salaryPaymentStandards"
						class="salaryPaymentStandards">
							<option value="연봉제">연봉제</option>
							<option value="주급제">주급제</option>
							<option value="일급제">일급제</option>
					</select></td>
					<td class="searchPopup-td">입사일</td>
					<td><input name="hireDate" type="date"
						value="${resultEmpl.hireDate}"></td>
					<td class="searchPopup-td">근로형태</td>
					<td><select name="workType" class="workType">
							<option value="정규직">정규직</option>
							<option value="비정규직">비정규직</option>
					</select></td>
				</tr>
					
				<tr>
					<td class="searchPopup-td">비고</td>
					<td colspan="5" height="50px"><input type="text" name="remark"
						value="${resultEmpl.remark }" size="90"></td>
				</tr>
				
			</table>
			<div style="position: relative; top: 16px;">
				<button type="submit">수정</button>
				<button onclick="bye()">닫기</button>
				</a>
			</div>
		</div>
	</form>
	<script>
var frontJu=${resultEmpl.birthDate}+"";
var front=frontJu.substring(0, 6);
var end=frontJu.substring(6, 7);

$('.jumin').val(front+"-"+end+"******");


    function bye(){
        window.close();
    }
    
    var manager = "${resultEmpl.manager}"
    $(".manager").val(manager).prop("selected",true);
    
    <!-- selected 로직 -->
    var lunarCalendar="${resultEmpl.lunarCalendar}"; 
    $(".lunarCalendar").val(lunarCalendar).prop("selected", true);
    
    var koreanForeigner="${resultEmpl.koreanForeigner}";
    $(".koreanForeigner").val(koreanForeigner).prop("selected", true);
    
    var marriage="${resultEmpl.marriage}";
    $(".marriage").val(marriage).prop("selected", true);
    
    var status="${resultEmpl.status}";
    $(".status").val(status).prop("selected", true);
    
    var salaryPaymentStandards="${resultEmpl.salaryPaymentStandards}"
    $(".salaryPaymentStandards").val(salaryPaymentStandards).prop("selected", true);
    
    var sex = "${resultEmpl.sex}";
    $(".sex").val(sex).prop("selected", true);
    
    var department = "${resultEmpl.departmentId}"
    $(".department").val(department).prop("selected", true);

    var position= "${resultEmpl.positionId}"
    $(".position").val(position).prop("selected", true);
   
    if(position==9){
    var workType="비정규직";
    $(".workType").val(workType).prop("selected", true);
    	
    }else{
    	var workType="정규직";
    	$(".workType").val(workType).prop("selected", true);
    }
    
    
</script>
</body>
</html>