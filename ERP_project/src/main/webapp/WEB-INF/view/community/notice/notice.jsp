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
.table {
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
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.kr/docs/5.0/content/tables/">

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
	<section>
		<div style="width: 80%; margin: 40px auto;">
			<div style="text-align: center;">
				<H2>공지사항</H2>
			</div>
			<table class="table table-sm table-hover">
		
				<thead class="table-light">
						<tr>
				<th colspan="5" style="background: white; border: none">
						<c:if test="${empl.manager=='권한' }">
						<button style="float: right; border-radius: 7px;" onclick="location.href=('/noticeWriter')">작성</button>
						</c:if>
				</th>
				</tr>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="l" items="${list.tablelist}" varStatus="i">
						<tr onclick="location.href=('/noticeSearch?id=${l.id }')">
							<td>${l.id }</td>
							<td>${l.title }</td>
							<td>${writer.get(i.index) }</td>
							<td>${l.writeDate }</td>
							<td>${l.count }</td>
						</tr>

					</c:forEach>


				</tbody>
			</table>

			<div class="border-dee3eb" style="text-align: center;">
			<c:choose>
			
			<c:when test="${list.firstPage<=2 && list.totPage<=3 }">
				<c:forEach var="link" begin="1"
					end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:when test="${list.firstPage<2 && list.totPage>3 }">
				<c:forEach var="link" begin="1"
					end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
				<a href="/notice?page=${list.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${list.firstPage>=3&&list.firstPage<list.totPage-2}">
					<a href="/notice?page=${list.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${list.firstPage }"
					end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/notice?page=${list.firstPage+1 }">[다음]</a>
			</c:when>
			<c:when test="${list.firstPage>list.totPage-3}">
					<a href="/notice?page=${list.firstPage-1 }">[이전]</a>
						<c:forEach var="link" begin="${list.totPage-2 }"
						end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
					<a href="/notice?page=${list.firstPage-1 }">[이전]</a>
				<c:forEach var="link" begin="${list.firstPage }"
					end="${list.lastPage }">
					<a href="/notice?page=${link }">[${link }]</a>
				</c:forEach>
					<a href="/notice?page=${list.firstPage+1 }">[다음]</a>
	
			</c:otherwise>	
			</c:choose>
		
			</div>

		</div>
				<hr style ="color: #eeeeeee">
	</section>

</body>
</html>