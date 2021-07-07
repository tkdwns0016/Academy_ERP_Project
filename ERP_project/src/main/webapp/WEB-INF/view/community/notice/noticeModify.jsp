<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="/path/to/js/summernote-ext-ajaxfileupload.js"></script>

<link href="/static/community/notice/noticeWriter.css" rel="stylesheet">
<script src="/static/community/notice/noticeWriter.js"></script>
</head>
<body>


	<h2>글 수정</h2>
	<br>
	<form method="post" action="/noitceModify1">
		<table>
			<input type="hidden" name="id" value="${notice.id}">
			<input type="hidden" name="password" value="${notice.password}">
			<tr>
				<td>작성자</td>
				<td style="width: 60%;">&nbsp;<input type="text" id="writer"
					name="writer" style="width: 90%;" readonly
					value="${notice.writer}" /><br></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">&nbsp;<input type="text" id="title"
					name="title" style="width: 90%;" placeholder="제목"
					value="${notice.title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea id="summernote" name="content">${notice.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="3" style="height: auto;">&nbsp;<input type="file"
					id="fileUpload" multiple="multiple" name="filename" enctype="">
					<span id="fileList"></span>
				</td>
			</tr>
		</table>


		<input id="subBtn" type="submit" value="수정"> <input
			id="subBtn" type="button" value="취소" onclick="history.go(-1);" />
	</form>




</body>

</html>


