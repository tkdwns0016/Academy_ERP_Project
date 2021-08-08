<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/static/community/noticeSearch.css?id=2" rel="stylesheet">

</head>
<body>

	
	<div class="container">

		<table class="table-border" style="border-collapse: collapse;">
			<th colspan="6" style="text-align: left; border: none;">
				<h2>
					&nbsp;게시글
					상세조회
				</h2>
			</th>
			<tr id="id1">
				<td style="width: 10%; height: 50px;" class="borderS-td-color">제목</td>
				<td colspan="5" class="borderS-td-padding">${result.title }</td>

			</tr>

			<tr style="height: 50px;">
				<td class="borderS-td-color">등록자</td>
				<td class="borderS-td-padding">${result.writer }</td>
				<td class="borderS-td-color" style="width: 10%;">등록일</td>
				<td class="borderS-td-padding">${result.writeDate }</td>
				<td class="borderS-td-color" style="width: 10%;">조회수</td>
				<td style="text-align: center; width: 10%;">4</td>
			</tr>
			<tr>
				<td class="borderS-td-color">내용</td>
				<td colspan="5" style="height: 300px;">
					<div class="content"
						style="max-height: 100%; width: 98.5%; margin: 5px;" readonly></div>
				</td>
			</tr>
			<tr style="height: auto;">
				<td class="borderS-td-color" style="height: 50px;">첨부파일</td>
				<td colspan="5" class="borderS-td-padding">${result.filename}</td>
			</tr>
			<tr style="height: 10px;">

			</tr>
			<tr>
				<td colspan="6"
					style="text-align: right; border-left: hidden; border-right: hidden; border-bottom: hidden;">
					<button  class="update" onclick="modifyOn()" style="width: 60px; height: 30px;">수정</button>
					<button  class="delete" onclick="deleteOn()" style="width: 60px; height: 30px;">삭제</button>
					<button  class="listButton" style="width: 60px; height: 30px;"
						onclick="history.go(-1); return false;">목록</button>
				</td>
			</tr>
		</table>
		<div style="width: 1200px; margin-top: auto;">
			댓글 0개
			<hr>
		</div>
		<div>

			<table style="border-bottom: 1px solid gainsboro;">
				<tr>

					<td style="width: 15%;" class="borderS-td-color">댓글내용</td>
					<td style="width: 80%; padding: 10px; border-bottom: none;"><textarea
							name="" id="" cols="130" rows="6"></textarea></td>
					<td style="width: 20%; text-align: center; border-bottom: none;"><button
						 style="width: 100px; height: 100px;">댓글등록</button></td>

				</tr>
			</table>

		</div>

	</div>


	<!--  수정 모달폼  -->
	<div class="full_modal1 hidden">
	<div class="modal-div">
		<form action="/modifyNotice" method="post">
			<input type="hidden" name=id value="${result.id}">
			<table class="modal-table">
				<tr height="20%">
					<td rowspan="5" style="width: 20%;"><img
						src="image/delete.png"></td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><font size="6"><font color="blue">비밀번호</font>확인</font></td>
				</tr>
				<tr height="20%">

					<td id="modal_td">작성할 때 입력하신 비밀번호를 입력해주세요</td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><input type="password" id="deletePassword"
						name="deletePassword"> &nbsp;<input type="submit" 
						onsubmit="deleteCheck()" value="확인"></td>
				</tr>
				<tr>
					<td id="modal_td"><button  type="button" onclick="modal_out()">취소하기</button></td>
				</tr>
			</table>
		</form>
	</div>

</div>
	<!-- 삭제 모달 폼 -->
	<div class="full_modal2 hidden">
	<div id="modal-div2">
		<form action="/deleteNotice" method="post">
			<input type="hidden" name=id value="${result.id}">
			<table class="modal-table">
				<tr height="20%">
					<td rowspan="5" style="width: 20%;"><img
						src="image/delete.png"></td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><font size="6"><font color="blue">비밀번호</font>확인</font></td>
				</tr>
				<tr height="20%">

					<td id="modal_td">작성할 때 입력하신 비밀번호를 입력해주세요</td>
				</tr>
				<tr height="10%">
					<td id="modal_td"><input type="password" id="deletePassword"
						name="deletePassword"> &nbsp;<input type="submit" class="checkbo"
						onsubmit="deleteCheck()" value="확인"></td>
				</tr>
				<tr>
					<td id="modal_td"><button class="button" type="button" onclick="modal_out2()">취소하기</button></td>
				</tr>
			</table>
		</form>
	</div>

</div>
</body>
<script>
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
	
	/* function deleteCheck(){
		if($("#deletePassword").val()==${result.password}){
			return true;
		}else{
			alert("비밀번호가 틀립니다.")
			return false;
		}
	} */
</script>
</html>