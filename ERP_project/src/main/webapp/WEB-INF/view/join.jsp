<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertEmployee</title>
<SCRIPT
	src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></SCRIPT>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/static/empcss.css">
<script type="text/javascript" src="/static/empscript.js"></script>
 <link href="/static/bootstrap/assets/dist/css/bootstrap.min.css" rel="stylesheet">



  <!-- Custom styles for this template --> 
  <link href="/static/bootstrap/sidebars/sidebars.css" rel="stylesheet">
  <style>
    .list_none {
      text-decoration: none;
      list-style: none;
    }
    a{
    text-decoration: none;
    color : black;
    }
    html{
    background-color: skyblue;
    }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<tiles:insertAttribute name="side"/>
	<div class="container" style="top:100px; width: 80%; float: right;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-5 mx-auto">
				<h4 class="mb-3">인사 등록</h4>
				<form action="/join" method="post" class="validation-form"
					novalidate>
					<div class="row">


						<div class="" style="text-align: center; margin-left: 20px;">
							사원정보 <br> <img src="/image/mung.png" width="150px"
								height="170px" class="img-circle"
								style="margin-bottom: 5px; border-radius: 15%;"><br>
							<div class="filebox">
								<label for="ex_filename">업로드</label> <input type="file"
									id="ex_filename" required="required" name="imgName"
									class="upload-hidden file_input" multiple="multiple">
							</div>


						</div>



						<div class="col-xs-12 col-md-6 mb-3" style="margin-left: 30px;">
							<label for="name">이름</label> <input type="text" name="name"
								required="required" class="form-control" id="name"
								placeholder="이름을 입력하세요" style="width: 200px;"> <label
								for="name" style="margin-top: 5px;">성별</label> <br> <select
								name="sex" required="required" class="form-control"
								style="width: 200px;">
								<option selected="selected" value="">선택
								<option value="남자">남자</option>
								<option value="여자">여자</option>
								<!-- <option>기타</option> -->
							</select> <label for="phone" style="margin-top: 5px;">연락처</label> <input
								type="text" required="required" class="form-control" id="phone"
								name="phone" pattern="[01]{3}-[0-9]{4}-[0-9]{4}"
								placeholder="01X-XXXX-XXXX" style="width: 200px;"> <br>

						</div>

					</div>
					<br>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							required="required" class="form-control" name="email" id="email"
							placeholder="you@example.com">
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<table style="position: relative;">
						<tr>
							<td align="center">주민번호 입력</td>
						<tr>
							<td><input type="text" pattern="[0-9]{6}" name="birthDate1"
								class="form-control" size=6 maxlength=6 required="required"
								id="exampleInputEmail3" placeholder="앞자리 6자리"
								style="width: 150px; position: relative; top: 0px; left: 0px;">
							</td>
							<td style="position: relative; top: 0px; left: 10px;">-</td>
							<td><input type="password" required="required"
								name="birthDate2" pattern="[0-9]{7}" class="form-control" size=7
								id="exampleInputPassword3" maxlength=7 placeholder="뒷자리 7자리"
								style="width: 150px; position: relative; top: 0px; left: 20px;">
							</td>
						</tr>
					</table>

					<div class="mb-3">
						<label for="address2">주소<span class="text-muted">&nbsp;</span></label><br>
						<input type="text" class="form-control" required="required"
							name="addressId" id="sample6_postcode" placeholder="우편번호"
							style="width: 200px; position: absolute"> <input
							type="button" class="btn btn-primary"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
							style="margin-left: 220px;"> <input type="text"
							name="address" required="required" style="margin-top: 10px"
							class="form-control" id="sample6_address" placeholder="주소">
						<input type="text" name="address2" class="form-control"
							id="sample6_detailAddress" placeholder="상세주소"><br> <input
							type="text" class="form-control" id="sample6_extraAddress"
							readonly="readonly" placeholder="구 주소(자동입력)">
					</div>

					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">부서</label> <select required="required"
								name="departmentId" class="custom-select d-block w-100"
								id="root">
								<option value="">부서선택</option>
								<option value="10">경영팀</option>
								<option value="20">개발팀</option>
								<option value="30">인사팀</option>
								<option value="40">영업팀</option>
							</select>
						</div>
						<div class="col-md-8 mb-3">
							<label for="root">직급</label> <select required="required"
								name="positionId" class="custom-select d-block w-100" id="root">
								<option value="">직급선택</option>
								<option value="1">사원</option>
								<option value="2">대리</option>
								<option value="3">과장</option>
								<option value="4">차장</option>
								<option value="5">팀장</option>
								<option value="6">부장</option>
								<option value="7">상무</option>
								<option value="8">회장</option>
								<option value="9">비정규직</option>
							</select>
						</div>
						<div class="col-md-8 mb-3">
							<label for="salary">연봉</label> <input required="required"
								id=salary type="text" class="form-control" name="salary"
								placeholder="연봉을 입력하세요">
						</div>

					</div>
					<hr class="mb-4">

					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 YD</p>
		</footer>
	</div>
</body>
</html>