<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<title>without bootstrap</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="/static/community/community.css">
<script src="/static/community/community.js"></script>
</head>
<body>

	<h2>글 작성</h2>
	<br>

	<form method="post" action="/upload" enctype="multipart/form-data">
		<table>
			<input type="hidden" name="seq" value="${empl.userId}">
			<tr>
				<td>작성자</td>
				<td style="width: 60%;">&nbsp;<input type="text" id="writer"
					name="writer" style="width: 90%;" placeholder="작성자" readonly
					value="[${dep}]${empl.name}" /><br></td>
				<td>비밀번호</td>
				<td><input type="password" name="password" maxlength="4" size="30"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">&nbsp;<input type="text" id="title"
					name="title" style="width: 90%;" placeholder="제목" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea id="summernote" name="content"></textarea>
				</td>

			</tr>
			<tr>
				<td>파일첨부</td>
				<td colspan="3" style="height: auto;">&nbsp;
				<input type="file" id="fileUpload" multiple="multiple" name="fileName"> 
				<span id="fileList"></span>

				</td>

			</tr>


		</table>


		<input id="subBtn" type="submit" value="글 작성" /> <input id="subBtn"
			type="button" value="취소" onclick="location.href='/main'" />
	</form>

</body>
</html>
