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
    <form class="submit" action="/myInfo" method="post" enctype="multipart/form-data">
      <table id="table1">
          <h4><strong>개인 정보 수정</strong></h4><br>
      </table>    
      <table id="table2">
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">사원 ID</td>
              <td ><input type="text" readonly="readonly" name="userId" id="userId" value="${empl.userId }"/></td>
            <td></td><td></td>
              <td rowspan="5" style="text-align: center; width: 200px;" class="filebox">
                <img src="/image/${empl.imgName }?<%=new Date() %>" width="150px" name="imgName" class="img-circle" height="150px">
                    
                    <label for="ex_filename" class="filebox" style="margin-top: 5px;">업로드</label> <input type="file"
                        id="ex_filename" name="uploadFile" value=${empl.imgName } multiple="multiple"
                        class="upload-hidden file_input">
                </td>
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
          <input type="text" name="id" hidden="hidden" value="${empl.id }">
           <input type="text" name="manager" hidden="hidden" value="${empl.manager}">
           <input type="text" name="status" hidden="hidden" value="${empl.status}">
           <input type="text" name="hireDate" hidden="hidden" value="${empl.hireDate}">
          </tr>
          <tr height="7">
              <td colspan="7"><hr/></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">이 름</td>
              <td><input type="text" name="name" id="name" value="${empl.name }"/></td>
          </tr>
          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
          <tr class="register" height="30">
              <td width="5%" align="center">*</td>
              <td width="15%">성 별</td>
              <td>
              <c:if test="${empl.sex=='남성' }">
              
                  남 성<input type="radio" name="sex"  id="sex"  value="남성" checked="checked" />&nbsp;&nbsp;&nbsp;여 성<input type="radio" name="sex" id="sex" value="여성"/>
              </c:if>
               <c:if test="${empl.sex=='여성' }">
              
                  남 성<input type="radio" name="sex"  id="sex"  value="남성"  />&nbsp;&nbsp;&nbsp;여 성<input type="radio" name="sex" id="sex" value="여성" checked="checked"/>
              </c:if>
              </td>
          </tr>
          <tr height="7">
              <td colspan="7"><hr /></td>
          </tr>
            <tr class="register" height="30">
                <td width="5%" align="center">*</td>
                <td width="15%">주민등록번호</td>
                <td width="10%"> <input type="text" pattern="[0-9]{6}" name="birthDate1"
                 size=6 maxlength=6 
                id="exampleInputEmail3" value="${empl.birthDate.substring(0,6)}" placeholder="앞자리 6자리"
                style="width: 150px;">
			
			     ㅡ
			
                 <input type="password" 
                 name="birthDate2" pattern="[0-9]{7}"  size=7
                 id="exampleInputPassword3" maxlength=7 placeholder="뒷자리 7자리" value="${empl.birthDate.substring(6,13)}"
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
            <td width="15%">부 서</td>
            <td>
               <c:if test="${empl.departmentId==10 }">
                <select name="departmentId" id="root">
					<option value="10">경영팀</option>
				</select>
               </c:if>
               <c:if test="${empl.departmentId==20 }">
                <select name="departmentId" id="root">
					<option value="20">개발팀</option>
				</select>
               </c:if>
               <c:if test="${empl.departmentId==30 }">
                <select name="departmentId" id="root">
					<option value="30">인사팀</option>
				</select>
               </c:if>
               <c:if test="${empl.departmentId==40 }">
                <select  name="departmentId" id="root">
					<option value="40">영업팀</option>
				</select>
               </c:if>
               
            </td>
            
          <tr height="7">
            <td colspan="7"><hr /></td>
          </tr>

          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">직 급</td>
            <td>
               
              <c:if test="${empl.positionId==1 }">
                <select name="positionId">
					<option value="1">사원</option>
				</select>
              </c:if>
               <c:if test="${empl.positionId==2 }">
                <select name="positionId">
					<option value="2">대리</option>
				</select>
               </c:if>
              <c:if test="${empl.positionId==3 }">
                <select name="positionId">
					<option value="3">과장</option>
				</select>
               </c:if>
              <c:if test="${empl.positionId==4 }">
                <select name="positionId">
					<option value="4">차장</option>
				</select>
               </c:if>
             <c:if test="${empl.positionId==5 }">
                <select name="positionId">
               		<option value="5">팀장</option>
              	</select>
             </c:if>
                <c:if test="${empl.positionId==6 }">
                <select name="positionId">
               		<option value="6">부장</option>
              	</select>
             </c:if>
             <c:if test="${empl.positionId==7 }">
                <select name="positionId">
               		<option value="7">상무</option>
              	</select>
             </c:if>
             <c:if test="${empl.positionId==8 }">
                <select name="positionId">
               		<option value="8">회장</option>
              	</select>
             </c:if>
             <c:if test="${empl.positionId==9 }">
                <select name="positionId">
               		<option value="9">비정규직</option>
              	</select>
             </c:if>
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
                id=salary type="text" readonly="readonly"  name="salary"
                value="${empl.salary }">
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
</html>