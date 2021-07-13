<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link href="/static/community/notice/noticeWriter.css" rel="stylesheet">
</head>
<body>

	<h2>글 수정</h2>
	<br>
	<form method="post" action="/noitceModify1?id=${notice.id}">
			<input type="hidden" name="password" value="${notice.password}">
		<table class="noticeTable">
			<tr>
				<td class="fchild ntd">작성자</td>
				<td class="ntd" style="width: 60%;">&nbsp;<input type="text" id="writer"
					name="writer" style="width: 90%;" readonly
					value="${notice.writer}" /><br></td>
			</tr>
			<tr>
				<td class="fchild ntd">제목</td>
				<td class="ntd" colspan="3">&nbsp;<input type="text" id="title"
					name="title" style="width: 90%;" placeholder="제목"
					value="${notice.title }" /></td>
			</tr>
			<tr>
				<td class="fchild ntd">내용</td>
				<td colspan="3" class="ntd">
					<textarea id="summernote" name="content">${notice.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td class="fchild ntd" colspan="3" style="height: auto;">&nbsp;<input type="file"
					id="fileUpload" multiple="multiple" name="filename" enctype="">
					<span id="fileList"></span>
				</td>
			</tr>
		</table>


		<input id="subBtn" type="submit" value="수정"> <input
			id="subBtn" type="button" value="취소" onclick="history.go(-1);" />
	</form>




</body>
<script src="/static/community/notice/noticeWriter.js"></script>

</html>


