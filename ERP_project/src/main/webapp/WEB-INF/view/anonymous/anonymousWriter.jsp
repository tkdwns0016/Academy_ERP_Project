<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link href="/static/community/notice/noticeWriter.css" rel="stylesheet">
   
    </head>
  <body>
<section>

    <form style="width:65%" method="post" action="/anonymousWriter?writer=${empl.userId }" enctype="multipart/form-data" >  
      <table  class="notiTable" >
   		 <tr><td style="font-size: 2em" colspan="3">글 작성</td></tr>
        <tr><td colspan="3">&nbsp;</td></tr>
        <tr>
          <td class="fchild ntd">닉네임</td>
          <td class="ntd" style="width: 60%;">&nbsp;<input type="text" id="writer"  name="nickName" style="width: 90%; " placeholder="닉네임" required="required"/><br></td>
          <td class="fchild ntd">비밀번호</td>
          <td class="ntd"><input type="password" name="password" maxlength="4" size="30" required="required"></td>
        </tr>
        <tr>
          <td class="fchild ntd">제목</td>
          <td class="ntd" colspan="3">&nbsp;<input type="text"  id="title" name="title"  style="width: 90%;" placeholder="제목" required="required"/></td>
        </tr>
        <tr>	
          <td class="fchild ntd">
            내용
          </td>
          <td colspan="3" class="ntd">
            <textarea id="summernote" name="content" required="required"></textarea> 
          </td>
     
          </tr>
          <tr>
            <td class="fchild ntd">파일첨부</td>
             <td class="ntd" colspan="3" style="height: auto;">&nbsp;<input type="file" id="fileUpload" multiple="multiple" name="filename" >
              <span id="fileList"></span>
              
             </td>
              
             </tr>
     
           
          </table>
          
          
          <input id="subBtn" type="submit" value="작성" />
          <input id="subBtn" type="button" value="취소"  onclick="history.go(-1);"/>
        </form>
          
       


</section>

  </body>
    <script src="/static/community/notice/noticeWriter.js"></script>
</html>

