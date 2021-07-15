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
	width: 50%;
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
	background-color: darkgray;
}

.selectbox {
	position: absolute;
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
	type="text/javascript">

	</script>

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
				<H2>결제페이지</H2>
			</div>
			<div>
				<select class="sel" onchange="select()">
					<option value="결제 확인">결제 확인</option>
					<option value="결제">결제</option>
					<option value="반려">반려</option>
					<option value="결제대기">결제대기</option>
				</select>
				<button style="float: right; border-radius: 7px;"
					onclick="location.href=('/payment')">작성</button>
					<br>
			</div>
			<table class="table table-sm table-hover">

				<thead class="table-light">
					<tr>

					</tr>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">기안일자</th>
						<th scope="col">제목</th>
						<th scope="col">구분</th>
						<th scope="col">기안자</th>
						<th scope="col">결재자</th>
						<th scope="col">진행상태</th>
					</tr>
				</thead>

				<tbody class="selectTable">
					<c:forEach var="l" items="${list.tablelist }">
						<tr onclick="location.href=('/payment?id=${l.id }')">
							<td>${l.id }</td>
							<td>${l.paymentDate }</td>
							<td>${l.title }</td>
							<td>${l.division }</td>
							<td>${l.name }</td>
							<td>${l.paymentName }</td>
							<td>${l.progress }</td>
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
			
	</section>
	<script>
		console.log('${list.tablelist}');	
	</script>
</body>
</html>