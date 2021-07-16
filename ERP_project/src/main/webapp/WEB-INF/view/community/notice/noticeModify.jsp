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
<style>
	.delete{
		list-style: none;
		text-decoration: none;
		color: black;
	}
	
</style>
</head>
<body>

	<h2>글 수정</h2>
	<br>
	<form method="post" action="/noitceModify1?id=${notice.id}" enctype="multipart/form-data">
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
				<td rowspan="2" class="fchild ntd">파일첨부</td>
				<td colspan="5" class="borderS-td-padding">
				<ul>
						<c:if test="${empty file}">
							<li class="delete">저장된 파일이 없습니다.</li>
						</c:if>
						
						<c:if test="${!empty file}">
							<c:forEach var="file" items="${file }" varStatus="i">
								<li class="file-li delete delete${i.index }">
								<input style="width: 250px" type="text" name="filename" readonly="readonly" value="${file }" >
								<button onclick="del1(${i.index})" type="button">삭제</button> 
								</li>
							</c:forEach>
						</c:if>
					</ul>
					</td>
			</tr>
			<tr><td class="ntd" colspan="3" style="height: auto;">&nbsp;<input onchange="del()" type="file" id="fileUpload" multiple="multiple" name="filename1">
              <span id="fileList"></span>
              
             </td>
			</tr>
		</table>
<br>

		<input id="subBtn" type="submit" value="수정"> <input
			id="subBtn" type="button" value="취소" onclick="history.go(-1);" />
	</form>




</body>
<script src="/static/community/notice/noticeWriter.js"></script>
<script>
	function del() {
		$(".delete").remove();
	}
	function del1(e){
		if(confirm("삭제하시겠습니까?")){
			$(".delete"+e).remove();
		}
	}
</script>
</html>


