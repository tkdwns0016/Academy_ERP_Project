<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <link rel="stylesheet" type="text/css" href="/static/join/join.css">
<script type="text/javascript" src="/static/join/joinscript.js"></script>
 <link href="/static/bootstrap/assets/dist/css/bootstrap.min.css" rel="stylesheet">



  <style>
     .list_none {
      text-decoration: none;
      list-style: none;
    }
    a{
    text-decoration: none;
    color : black;
    }





    
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	
    <div id="divContainer" >
    
  <div class="input-form-backgroud row"></div>
		<div class="input-form row-nw d-flex flex-wrap">
    <form action="/join" method="post" enctype="multipart/form-data">
      <table id="table1">
          <h4><strong>인사 등록</strong></h4><br>
      </table>    
      <table id="table2">
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">이 름</td>
              <td ><input type="text"  name="name" id="userId"  placeholder="이름" required="required"/></td>
            <td></td><td></td>
              <td rowspan="5" style="text-align: center; width: 200px;" class="filebox">
                <img src="/image/normalImg.jpg" width="150px" class="img-circle" height="150px">
                    
                    <label for="ex_filename" class="filebox" style="margin-top: 5px;">업로드</label> <input type="file"
                        id="ex_filename"  value="normalImg.jpg" name="imgName"
                        class="upload-hidden file_input" multiple="multiple">
                </td>
          </tr>
          <tr height="7">
              <td colspan="3" style="height: 5px;"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">영문이름</td>
              <td><input type="text"  name="englishName" id="phone" placeholder="영문이름"  pattern="^[a-zA-Z]+$" required="required" />&nbsp;&nbsp; </td>
          </tr>
          <tr height="7">
              <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">휴대전화</td>
              <td><input  type="tel"  name="phone" id="phone" placeholder="010-0000-0000"  pattern="[01]{3}-[0-9]{4}-[0-9]{4}" required="required"/>&nbsp;&nbsp;<span id="same"></span></td>
          </tr>
          <tr height="7">
              <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">이메일</td>
              <td><input type="text"   id="email"
                name="email"
                placeholder="abcd1234@example.com"  required="required"/>&nbsp;&nbsp;<span id="same"></span></td>
          </tr>
          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
            <tr class="register" height="30">
                <td width="5%" align="center">*</td>
                <td width="15%">주민등록번호</td>
                <td width="10%"> <input type="text" pattern="[0-9]{6}" name="birthDate1"
                 size=6 maxlength=6 
                id="birthDate1" placeholder="앞자리 6자리"
                style="width: 150px;" required="required">
			
			     ㅡ
			
                 <input type="password" 
                 name="birthDate2" pattern="[0-9]{7}"  size=7
                 id="birthDate2" maxlength=7 placeholder="뒷자리 7자리"
                 style="width: 150px;">
            </td>
            </tr>
             <tr height="7">
              <td colspan="7"><hr/></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">내/외국인</td>
              <td>
                  내국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner"  id="koreanForeigner"  value="내국인" checked="checked"/>&nbsp;&nbsp;&nbsp;외국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner" id="koreanForeigner" value="외국인"/>
              </td>
              </tr>
          <tr height="7">
              <td colspan="7"><hr/></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">양력/음력</td>
              <td>
                  양력&nbsp;&nbsp;<input type="radio" name="lunarCalendar"  id="lunarCalendar"  value="양력" checked="checked" />&nbsp;&nbsp;&nbsp;음력&nbsp;&nbsp;<input type="radio" name="lunarCalendar" id="lunarCalendar" value="음력"/>
              </td>
              </tr>
          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">성 별</td>
              <td>
                  남성&nbsp;&nbsp;<input type="radio" name="sex"  id="sex"  value="남성" checked="checked" />&nbsp;&nbsp;&nbsp;여성&nbsp;&nbsp;<input type="radio" name="sex" id="sex" value="여성"/>
              </td>
          </tr>
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">결혼유무</td>
               <td>
                <select name="marriage" id="root">
					<option value="">선택</option>
					<option value="미혼">미혼</option>
					<option value="기혼">기혼</option>
				</select>
               </td>
          </tr>
         

         
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>


          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">근무형태</td>
              <td>
                <select name="workType" id="root">
					<option value="">선택</option>
					<option value="정규직">정규직</option>
					<option value="비정규직">비정규직</option>
				</select>
            </td>
          </tr>

          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>


          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">급여지급기준</td>
            <td>
                <select name="salaryPaymentStandards" id="root">
					<option value="">선택</option>
					<option value="연봉제">연봉제</option>
					<option value="주급제">주급제</option>
					<option value="일급제">일급제</option>
				</select>
            </td>
         
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>


          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">부 서</td>
            <td>
                <select name="departmentId" id="root">
					<option value="">선택</option>
					<option value="10">경영팀</option>
					<option value="20">개발팀</option>
					<option value="30">인사팀</option>
					<option value="40">영업팀</option>
				</select>
            </td>
            
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>

          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">직 급</td>
            <td>
                <select 
								name="positionId" id="root">
								<option value="">선택</option>
								<option value="1">사원</option>
								<option value="2">대리</option>
								<option value="3">과장</option>
								<option value="4">차장</option>
								<option value="5">팀장</option>
								<option value="6">부장</option>
								<option value="7">상무</option>
								<option value="8">이사</option>
								<option value="9">회장</option>
							</select>
            </td>
          </tr>

          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>

          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">연 봉</td>
            <td>
                <input 
                id="sample6_postcode" type="text"  name="salary"
                placeholder="연봉을 입력하세요">
            </td>
          </tr>

          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>

          <tr>
              <td width="5%" align="center">*</td>
              <td width="15%">주 소</td>
              <td>

                <!-- 우편번호-->
                <input type="text"   name="addressId" id="sample6_postcode" placeholder="우편번호"  > 
                
                <!-- 우편번호 찾기 버튼-->
                <input type="button" id="sample6_execDaumPostcode" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                
                <!-- 주소-->
                <input type="text" name="address1"  style="margin-top: 10px"  id="sample6_address" placeholder="주소">
                <!-- 상세주소입력-->
                <input type="text" name="address2" style="margin-top: 5px;"  id="sample6_detailAddress" placeholder="상세주소">
                <!-- 구주소-->
                <input type="text"  id="sample6_extraAddress" readonly="readonly" placeholder="구 주소(자동입력)">

              </td>
          </tr>
          <tr height="7">
            <td colspan="7"><hr /></td>
        </tr>
      </table>
      <br />
      <table>
          <tr height="40">
              <td><input class="button" type="submit" value="전송"/>&nbsp;</td>
          </tr>
      </table>
  </form>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>

</body>
</html>