<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
table {
	border-collapse: collapse;
	text-align: center;
	margin: 50px 50px 0 0;
	width: 50%;
}

.temp-box {
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	border: 1px solid #dee3eb;
}

.main-container {
	width: 1080px;
	margin: auto;
	grid-template-columns: repeat(3, 1fr);
	grid-template-rows: repeat(24, 40px);
}

button {
	background-color: gainsboro;
	border-radius: 5px;
	border: none;
}

button:hover {
	background-color:darkgray;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.0/content/tables/">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	type="text/javascript"></script>

<script src="/static/bootstrap/assets/dist/js/bootstrap.js"></script>
</head>
<body>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>
	<section style="float: right; width: 100%; height: 100%; top: 100px">
		<div style="width: 80%; margin: 40px auto;">
			<div style="text-align: center;">
				<H2>인사 정보 리스트</H2>
			</div>
			<div style="width: 100%;bottom: 10px">
			<form action="/emplList" method="post">
			<table>
			<tr>
			<th>성명</th><th><input type="text" name="name" ></th><th>사번</th><th><input type="text" name="userId" ></th>				 
					<th colspan="3"></th><th><input type="submit" value="검색"></th>
			</tr>
			</table>
			</form>
			</div>   
			<table class="table table-sm table-hover">
		
				<thead class="table-light">
			
					<tr>
						<th scope="col">사번</th>
						<th scope="col">이름</th>
						<th scope="col">주소</th>
						<th scope="col">주민등록번호</th>
						<th scope="col">부서</th>
						<th scope="col">직급</th>
						<th scope="col">상태</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="l" items="${emplList }">
						<tr onclick="location.href=('/emplInfo?id=${l.id }')">
							<td>${l.userId }</td>
							<td>${l.name }</td>
							<td>${l.address1 } ${l.address2 }</td>
							<td>${l.birthDate.substring(0,6) }-${l.birthDate.substring(7,8)}******</td>
							<td>${l.department.departmentName }</td>
							<td>${l.position.position }</td>
							<td>${l.status }</td>
						</tr>

					</c:forEach>


				</tbody>
			</table>

			<div class="border-dee3eb" style="text-align: center;">
				<c:if test="${list.totPage<list.lastPage }">
					<c:forEach var="link" begin="${list.firstPage }"
						end="${list.lastPage }">
						<a href="/notice?page=${link }">[${link }]</a>
					</c:forEach>
				</c:if>
				<c:forEach var="link" begin="${list.firstPage }"
					end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
				<c:if test="${list.firstPage>1 && list.lastPage<totPage }">
					<a href="/notice?page=${list.firstPage-1 }">[이전]</a>
					<c:forEach var="link" begin="${list.firstPage }"
						end="${list.lastPage }">
						<a href="/notice?page=${link }">[${link}]</a>
					</c:forEach>
					<a href="/notice?page=${list.lastPage+1 }">[다음]</a>
				</c:if>
				<c:if test="${ list.firstPage>1 && list.lastPage>=list.totPage }">
					<a href="/notice?page=${list.firstPage-1 }">[이전]</a>
					<c:forEach var="link" begin="${list.firstPage }"
						end="${list.totPage}">
						<a href="/notice?page=${link }">[${link}]</a>
					</c:forEach>

				</c:if>

			</div>
			<div class="temp-box" box-three></div>

		</div>
	</section>
	<script type="text/javascript">

	$(".click").click(()=>{
		var plus=$(".click").val()+1;
		$(".click").val()=plus;
	})
</script>
</body>
</html>