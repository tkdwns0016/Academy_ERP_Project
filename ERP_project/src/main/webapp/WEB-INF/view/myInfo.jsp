<%@page import="java.util.Date"%>
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
<script type="text/javascript" src="/static/join/joinscript.js?id=1"></script>
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
	<c:if test="${not empty result }">
	<c:if test="${result }">
		<script>
			alert("수정이 정상적으로 처리되었습니다.")
		</script>
	</c:if>
	<c:if test="${!result }">
		<script>
			alert("수정이 처리되지 않았습니다.")
		</script>
	</c:if>
	</c:if>
	
    <div id="divContainer" >
    
  <div class="input-form-backgroud row"></div>
		<div class="input-form row-nw d-flex flex-wrap">
    <form class="submit" action="/myInfo?userId=${empl.userId }" method="post" enctype="multipart/form-data">
      <table id="table1">
          <h4><strong>개인 정보 수정</strong></h4><br>
      </table>    
      <table id="table2">
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">이 름</td>
              <td ><input type="text" name="name" id="name" value="${empl.name }"/></td>
            <td></td><td></td>
              <td rowspan="5" style="text-align: center; width: 200px;" class="filebox">
                <img src="/image/${empl.imgName }" width="150px" name="imgName" class="img-circle myInfoImg" height="150px">
                    
                    <label for="ex_filename" class="filebox" style="margin-top: 5px;">업로드</label> <input type="file"
                        id="ex_filename" name="uploadFile" value=${empl.imgName } multiple="multiple"
                        class="upload-hidden file_input"><label class="filebox" for="cancel" style="margin-top: 5px;">취소</label><input id="cancel" onclick="imgChange()" hidden="hidden" type="button">
                <input type="text" name="fileName" hidden="hidden" class="cancelVal">
                </td>
          </tr>
          <tr height="7">
              <td colspan="3" ><hr/></td>
          </tr>
          
          <tr class="register" height="10">
              <td width="5%" align="center">*</td>
              <td width="15%">영문이름</td>
              <td><input type="text" name="englishName" id="name" value="${empl.englishName}"/></td>
          </tr>
          <tr height="7">
              <td colspan="3" style="height: 5px;"><hr /></td>
          </tr>
          
          <tr class="register" height="10">
              <td width="5%" align="center">*</td>
              <td width="15%">비밀번호</td>
              <td><input type="password" name="password" id="pw" value="${empl.password}" onchange="isSame()" /></td>
          </tr>
          <tr height="7">
              <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">비밀번호 확인</td>
              <td><input type="password" name="password2" id="pwCheck" value="${empl.password }" onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
       
          </tr>
                    <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
            <tr class="register" height="30">
                <td width="5%" align="center">*</td>
                <td width="15%">주민등록번호</td>
                <td width="10%"> <input type="text" pattern="[0-9]{6}" name="birthDate1"
                 size=6 maxlength=6 
                id="birthDate1" value="${empl.birthDate.substring(0,6)}" placeholder="앞자리 6자리"
                style="width: 150px;">
			
			     ㅡ
			
                 <input type="password" 
                 name="birthDate2" pattern="[0-9]{7}"  size=7
                 id="birthDate2" maxlength=7 placeholder="뒷자리 7자리" value="${empl.birthDate.substring(6,13)}"
                 style="width: 150px;">
            </td>
            </tr>
                      <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>


          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">휴대전화</td>
              <td><input type="tel"  name="phone" id="phone" value="${empl.phone }"  pattern="[01]{3}-[0-9]{4}-[0-9]{4}" >
              </td>
          </tr>
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">이메일</td>
              <td> 
       
                <input 
                type="text"   id="email"
                name="email" value="${empl.email }"
                placeholder="abcd1234@example.com" 
                >
        
            </td>
          </tr>
            
          
              <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">내/외국인</td>
              <td>
              <c:if test="${empl.koreanForeigner=='내국인' }">
              
                  내국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner"  id="koreanForeigner"  value="내국인" checked="checked" />&nbsp;&nbsp;&nbsp;외국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner" id="koreanForeigner" value="외국인"/>
              </c:if>
               <c:if test="${empl.koreanForeigner=='외국인' }">
              
                  내국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner"  id="koreanForeigner"  value="내국인"  />&nbsp;&nbsp;&nbsp;외국인&nbsp;&nbsp;<input type="radio" name="koreanForeigner" id="koreanForeigner" value="외국인" checked="checked"/>
              </c:if>
              </td>
                <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>


          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">생일</td>
              <td><input type="text"  name="birth" id="phone" value="${empl.birth }">
              </td>
          </tr>
          </tr>
                <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">양력/음력</td>
              <td>
              <c:if test="${empl.lunarCalendar=='양력' }">
              
                  양력&nbsp;&nbsp;<input type="radio" name="lunarCalendar"  id="lunarCalendar"  value="양력" checked="checked" />&nbsp;&nbsp;&nbsp;음력&nbsp;&nbsp;<input type="radio" name="lunarCalendar" id="lunarCalendar" value="음력"/>
              </c:if>
               <c:if test="${empl.lunarCalendar=='음력' }">
              
                  양력&nbsp;&nbsp;<input type="radio" name="lunarCalendar"  id="lunarCalendar"  value="양력"  />&nbsp;&nbsp;&nbsp;음력&nbsp;&nbsp;<input type="radio" name="lunarCalendar" id="lunarCalendar" value="음력" checked="checked"/>
              </c:if>
              </td>
          </tr>
          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">성 별</td>
              <td>
              <c:if test="${empl.sex=='남성' }">
              
                  남성&nbsp;&nbsp;<input type="radio" name="sex"  id="sex"  value="남성" checked="checked" />&nbsp;&nbsp;&nbsp;여성&nbsp;&nbsp;<input type="radio" name="sex" id="sex" value="여성"/>
              </c:if>
               <c:if test="${empl.sex=='여성' }">
              
                  남성&nbsp;&nbsp;<input type="radio" name="sex"  id="sex"  value="남성"  />&nbsp;&nbsp;&nbsp;여성&nbsp;&nbsp;<input type="radio" name="sex" id="sex" value="여성" checked="checked"/>
              </c:if>
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
               <c:if test="${empl.marriage=='미혼' }">
					<option value="미혼" selected="selected">미혼</option>
					<option value="기혼">기혼</option>
               </c:if>
               <c:if test="${empl.marriage=='기혼' }">
               		<option value="미혼">미혼</option>
					<option value="기혼"selected="selected">기혼</option>
               </c:if>
				</select>
            </td>
            
  

          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>

          <tr>
              <td width="5%" align="center">*</td>
              <td width="15%">주 소</td>
              <td>

                <!-- 우편번호-->
                <input type="text"   name="addressId" id="sample6_postcode" value="${empl.addressId }"  > 
                
                <!-- 우편번호 찾기 버튼-->
                <input type="button" id="sample6_execDaumPostcode" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                
                <!-- 주소-->
                <input type="text" name="address1"  style="margin-top: 10px"  id="sample6_address" value="${empl.address1 }">
                <!-- 상세주소입력-->
                <input type="text" name="address2" style="margin-top: 5px;"  id="sample6_detailAddress" value="${empl.address2 }">
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
              <td><input class="button" type="submit" value="수정하기"/>&nbsp;<a href="index.php"></a></td>
          </tr>
      </table>
  </form>
</div>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>


</body>
<script>
function imgChange(){
	$(".cancelVal").val("normalImg.jpg")
	$(".myInfoImg").prop("src","/image/normalImg.jpg");
	
	}
</script>
</html>