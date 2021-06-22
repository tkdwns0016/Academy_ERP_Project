<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertEmployee</title>
<SCRIPT src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></SCRIPT>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    .filebox label { display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; } 
    .filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }

  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-5 mx-auto">
        <h4 class="mb-3">인사 등록</h4>
        <form action="/join" method="post" class="validation-form" novalidate>
          <div class="row" >


            <div class="" style="text-align: center; margin-left: 20px;">
             사원정보
              <br>
              <img src="/image/mung.png" name="imgName" width="150px" height="170px" class="img-circle" style="margin-bottom: 5px; border-radius: 15%;" ><br>
              <div class="filebox"> 
              <label for="ex_filename">업로드</label> 
              <input type="file" id="ex_filename" class="upload-hidden" multiple="multiple"> </div>

     
            </div>


            
            <div class="col-xs-12 col-md-6 mb-3" style="margin-left:30px;">
              <label for="name">이름</label>
              <input type="text" name="name" class="form-control" id="name" placeholder="이름을 입력하세요" style="width: 200px;">
              <label for="name" style="margin-top: 5px;">성별</label>
              <br>
                <select name="sex" class="form-control" style="width: 200px;">
                  <option selected="selected" value="">선택
                  <option value="남자">남자</option>
                  <option value="여자">여자</option>
                  <!-- <option>기타</option> -->
                </select>
              
              <label for="phone" style="margin-top: 5px;">연락처</label>
              <input type="text" class="form-control" id="phone" name="phone" pattern="[01]{3}-[0-9]{4}-[0-9]{4}" placeholder="01X-XXXX-XXXX" style="width: 200px;">
              <br>
             
            </div>
        
          </div>
          <br>
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com">
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
  <table style="position: relative;">
           <tr>
              <td align="center">주민번호 입력</td>
               	<tr>
             		<td><input type="text" pattern="[0-9]{6}" class="form-control" size=6
                        maxlength=6 name="birthDate1" id="exampleInputEmail3" placeholder="앞자리 6자리" style="width: 150px; position: relative; top:0px; left: 0px;">
                    </td>
              		<td style="position: relative; top:0px; left: 10px;">-</td>
                     	<td>
                          	<input type="password" pattern="[0-9]{7}" name="birthDate2" class="form-control" size=7
                                id="exampleInputPassword3" maxlength=7
                                placeholder="뒷자리 7자리" style="width: 150px; position: relative; top:0px; left: 20px;">
                        </td>
                </tr>
  </table>

          <div class="mb-3">
            <label for="address2">주소<span class="text-muted">&nbsp;</span></label><br>
            <input type="text" class="form-control" name="addressId" id="sample6_postcode" placeholder="우편번호" style="width: 200px; position: absolute ">
            <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-left: 220px;">
            <input type="text" name="address" style="margin-top: 10px" class="form-control" id="sample6_address" placeholder="주소">
            <input type="text"   class="form-control" id="sample6_detailAddress" placeholder="상세주소"><br>
            <input type="text"  class="form-control" id="sample6_extraAddress" placeholder="참고항목">
          </div>

          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root">부서</label>
              <select name="departmentId" class="custom-select d-block w-100" id="root">
                <option value="">부서선택</option>
                <option value="10">경영팀</option>
                <option value="20">개발팀</option>
                <option value="30">인사팀</option>
                <option value="40">영업팀</option>
              </select>
            </div>
            <div class="col-md-8 mb-3">
              <label for="root">직급</label>
              <select name="positionId"  class="custom-select d-block w-100" id="root">
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
 				 <label for="salary">연봉</label>
 				<input id=salary type="text" class="form-control" name="salary" placeholder="연봉을 입력하세요">          
            </div>
           
          </div>
          <hr class="mb-4">
    
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
    </footer>
  </div>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  
    </script>

    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

  </script>
</body>
</html>