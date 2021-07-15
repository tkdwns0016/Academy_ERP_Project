<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/static/community/notice/noticeSearch.css" rel="stylesheet">
<style>
@font-face {
    font-family: 'MaplestoryOTFLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
button{
    background-color: gainsboro; 
    border-radius: 5px;
    border: none;
}


input[type=button]{
	background-color: gainsboro; 
    border-radius: 5px;
    border: none;
    width: auto;
    height: 23px;
    padding: 0 3px;
}
.modal-table{
	font-family: MaplestoryOTFLight;
}

</style>

</head>
<body>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>
	
	<div class="container2">

		<table class="table-border" style="border-collapse: collapse;">
			<th colspan="6" style="text-align: left; border: none;">
				<h2>
					<img src="image/community/notice/borderIcon.png" width="20px">&nbsp;게시글
					상세조회
				</h2>
			</th>
			<tr id="id1">
				<td style="width: 10%; height: 50px;" class="borderS-td-color">제목</td>
				<td colspan="5" class="borderS-td-padding">${result.title }</td>

			</tr>

			<tr style="height: 50px;">
				<td class="borderS-td-color">등록자</td>
				<td class="borderS-td-padding">${writer }</td>
				<td class="borderS-td-color" style="width: 10%;">등록일</td>
				<td class="borderS-td-padding">${result.writeDate }</td>
				<td class="borderS-td-color" style="width: 10%;">조회수</td>
				<td style="text-align: center; width: 10%;">4</td>
			</tr>
			<tr>
				<td class="borderS-td-color">내용</td>
				<td colspan="5" style="height: 300px;">
					<div class="content"
						style="max-height: 100%; width: 98.5%; margin: 5px;" >${result.content }</div>
				</td>
			</tr>
			<tr style="height: auto;">
				<td class="borderS-td-color" style="height: 50px;">첨부파일</td>
				<td colspan="5" class="borderS-td-padding"><ul>
					<c:if test="${empty file }">
						저장된 파일이 없습니다.
					</c:if>
					<c:if test="${not empty file }">
					<c:forEach var="file" items="${file }" >
						 <li class="file-li"><a class="file-link" href="/anonymousfileDownload?id=${result.id }&filename=${file}">${file}</a></li>
					</c:forEach>
					</c:if>
					</ul></td>
			</tr>
			<tr style="height: 10px;">

			</tr>
			<tr>
				<td colspan="6"
					style="text-align: right; border-left: hidden; border-right: hidden; border-bottom: hidden;">
					<c:if test="${beforeIndex ne result.id }">
					<button onclick="location.href=('/anonymousSearch?id=${beforeIndex}')" style="float: left; width: 60px; height: 30px">이전</button>&nbsp;
					</c:if>
					<c:if test="${nextIndex ne result.id }">
					<button onclick="location.href=('/anonymousSearch?id=${nextIndex}')" style="float:left; width: 60px; height: 30px; margin-left: 5px">다음</button>
					</c:if>
					<button onclick="modifyOn()" style="width: 60px; height: 30px;">수정</button>
					<button onclick="deleteOn()" style="width: 60px; height: 30px;">삭제</button>
					<button class="listButton" style="width: 60px; height: 30px;"
						onclick="history.go(-1); return false;">목록</button>
				</td>
			</tr>
		</table>
		<div style="width: 800px; margin-top: auto;">
			댓글 0개
			<hr>
		</div>
		<div>

			<table style="border-bottom: 1px solid gainsboro;">
				<tr>

					<td style="width: 15%;" class="borderS-td-color">댓글내용</td>
					<td style="width: 60%; padding: 10px; border-bottom: none;"><textarea
							style="resize: none;" cols="60" rows="6"></textarea></td>
					<td style="width: 12%; text-align: center; border-bottom: none;"><button
							style="width: 100px; height: 100px;">댓글등록</button></td>

				</tr>
			</table>

		</div>

	</div>


	<!--  수정 모달폼  -->
	<div class="full_modal1 hidden">
	<div class="modal-div">
		<form action="/noticeModify" method="post" class="modyForm">
			<input type="hidden" name="id" value="${result.id}">
			<table class="modal-table">
				<tr height="20%">
					<td rowspan="5" style="width: 20%;"><img
						src="image/community/notice/delete.png"></td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><font size="6"><font color="blue">비밀번호</font>확인</font></td>
				</tr>
				<tr height="20%">

					<td id="modal_td">작성할 때 입력하신 비밀번호를 입력해주세요</td>
				</tr>
				<tr height="10%">
					<td id="modal_td">
					<input type="password" id="modifyPassword" name="modifyPassword" maxlength="4"> &nbsp;
					<input type="button" onclick="modifyCheck()" value="확인"></td>
				</tr>
				<tr>
					<td id="modal_td"><input type="button" onclick="modal_out()" value="취소하기"></td>
				</tr>
			</table>
		</form>
	</div>

</div>
	<!-- 삭제 모달 폼 -->
	<div class="full_modal2 hidden">
	<div id="modal-div2">
	<form action="/deleteNotice" method="post" class="deleForm">
			<input type="hidden" name="id" value="${result.id}">
			<table class="modal-table">
				<tr height="20%">
					<td rowspan="5" style="width: 20%;"><img
						src="image/community/notice/delete.png"></td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><font size="6"><font color="blue">비밀번호</font>확인</font></td>
				</tr>
				<tr height="20%">
					<td id="modal_td">작성할 때 입력하신 비밀번호를 입력해주세요</td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><input type="password" id="deletePassword"
						name="deletePassword" maxlength="4"> &nbsp;
						<input type="button" onclick="deleteCheck()" value="확인"></td>
				</tr>
				<tr>
					<td id="modal_td"><input type="button" onclick="modal_out2()" value="취소하기"></td>
				</tr>
			</table>
		</form>
			
	</div>

</div>


</body>
<script type="text/javascript">
	$(".content").html("${result.content}");
	
	function modifyOn(){ 
		$(".full_modal1")[0].classList.remove("hidden");
	}
	function modal_out(){
		$(".full_modal1")[0].classList.add("hidden");
	}
	
	function deleteOn(){
		$(".full_modal2")[0].classList.remove("hidden");

	}
	function modal_out2(){
		$(".full_modal2")[0].classList.add("hidden");
	}
	
	function deleteCheck(){
		if($("#deletePassword").val()==${result.password}){
			confirm("삭제하시겠습니까?")
			if(confirm("삭제하시겠습니까?")){
				$(".deleForm").submit();
			}else{
				$(".full_modal2")[0].classList.add("hidden");		
			}
		}else{
			$("#deletePassword").val("");
			alert("비밀번호가 틀립니다.");
		}
	}
	
	function modifyCheck(){
		if($("#modifyPassword").val()==${result.password}){
			$(".modyForm").submit();
		}else{
			document.getElementById("modifyPassword").value="";
			alert("비밀번호가 틀립니다.");
		}
	}
</script>
</html>