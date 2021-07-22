<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/8eb5905426.js"
	crossorigin="anonymous"></script>

<style>
.container-work {
	width: 75%;
	text-align: center;
	position: absolute;
	left: 10%;
	top: 15%;
	box-shadow: 1px 1px 1px 1px gainsboro;
}

tr:hover {
	background-color: gainsboro;
}

h2 {
	position: relative;
	top: 10px;
}

table td, table th {
	padding: .1rem;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}

input[type=search] {
	position: relative;
}
</style>

</head>
<body>
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
<c:if test="${not empty result }">
	<script>
		alert("검색 결과를 찾을수 없습니다.")
	</script>
</c:if>

	<form action="/emplList" method="post">
		<div class="container-work">
			<h2>인사 정보 리스트</h2>
			<div style="position: relative; left: 37%;">
				<select name="searchOption" required="required">
					<option value="position">직급</option>
					<option value="department">부서</option>
					<option value="name">이름</option>
					<option value="hire_date">입사일</option>
					<option value="user_id">사번</option>
				</select> <input type="search" name="search" size="15" placeholder="search..."> 
			
				<i	class="fas fa-search" style="position: absolute; left: 700px; top: 7px;"></i>

			</div>
			<table style="position: relative; width: 95%">
				<tr style="background-color: ghostwhite;">
					<th width="7%">부서명</th>
					<th width="5%">직급</th>
					<th width="8%">사원번호</th>
					<th width="9%">이름</th>
					<th width="14%">주민등록번호</th>
					<th width="20%">이메일</th>
					<th width="15%">전화번호</th>
					<th width="10%">입사일</th>
					<th width="10%">근무</th>
				</tr>
				<c:if test="${empty searchList}">
				<c:forEach var="emp" items="${emplList.tablelist}">
					<tr onclick="popup(${emp.userId})">
						<td>${emp.department.departmentName}</td>
						<td>${emp.position.position }</td>
						<td>${emp.userId }</td>
						<td>${emp.name}</td>
						<td>${emp.birthDate.substring(0,6)}-${emp.birthDate.substring(6,7)}******</td>
						<td>${emp.email}</td>
						<td>${emp.phone}</td>
						<td>${emp.hireDate}</td>
						<td>${emp.status}</td>
					</tr>
				</c:forEach>
				</c:if>
				<c:if test="${not empty searchList}">
				<c:forEach var="emp" items="${searchList.tablelist}">
					<tr onclick="popup(${emp.userId})">
						<td>${emp.department.departmentName}</td>
						<td>${emp.position.position }</td>
						<td>${emp.userId }</td>
						<td>${emp.name}</td>
						<td>${emp.birthDate.substring(0,6)}-${emp.birthDate.substring(6,7)}******</td>
						<td>${emp.email}</td>
						<td>${emp.phone}</td>
						<td>${emp.hireDate}</td>
						<td>${emp.status}</td>
					</tr>
				</c:forEach>
				</c:if>
			</table>
			<div>
			<c:if test="${empty searchList  }">
				<c:choose>
			
			<c:when test="${emplList.firstPage<=2 && emplList.totPage<=3 }">
				<c:forEach var="link" begin="1"
					end="${emplList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:when test="${emplList.firstPage<2 && emplList.totPage>3 }">
				<c:forEach var="link" begin="1"
					end="${emplList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
				<a href="/emplList?page=${emplList.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${emplList.firstPage>=3&&emplList.firstPage<emplList.totPage-2}">
					<a href="/emplList?page=${emplList.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${emplList.firstPage }"
					end="${emplList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/emplList?page=${emplList.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${emplList.firstPage>emplList.totPage-3}">
					<a href="/emplList?page=${emplList.firstPage-1 }">[이전]</a>
						<c:forEach var="link" begin="${emplList.totPage-2 }"
						end="${emplList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<a href="/emplList?page=${emplList.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${emplList.firstPage }"
					end="${emplList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/emplList?page=${emplList.firstPage+1 }">[다음]</a>
	
			</c:otherwise>	
			</c:choose>

				</c:if>
				<c:if test="${not empty searchList  }">
					<c:choose>
			
			<c:when test="${searchList.firstPage<=2 && searchList.totPage<=3 }">
				<c:forEach var="link" begin="1"
					end="${searchList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:when test="${searchList.firstPage<2 && searchList.totPage>3 }">
				<c:forEach var="link" begin="1"
					end="${searchList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
				<a href="/emplList?page=${searchList.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${searchList.firstPage>=3&&searchList.firstPage<searchList.totPage-2}">
					<a href="/emplList?page=${searchList.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${searchList.firstPage }"
					end="${searchList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/emplList?page=${searchList.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${searchList.firstPage>searchList.totPage-3}">
					<a href="/emplList?page=${searchList.firstPage-1 }">[이전]</a>
						<c:forEach var="link" begin="${searchList.totPage-2 }"
						end="${searchList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<a href="/emplList?page=${searchList.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${searchList.firstPage }"
					end="${searchList.lastPage }">
					<a href="/emplList?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/emplList?page=${searchList.firstPage+1 }">[다음]</a>
	
			</c:otherwise>	
			</c:choose>
				</c:if>	
			</div>
		</div>
	</form>
</body>
<script>
    function popup(e){
        var url = "/emplInfo?userId="+e;
        var name = "test";
        var option = "width = 780, height = 480, top = 100, left = 200, scrollbars=no";
        window.open(url, name, option);
    }
 </script>
</html>