<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anonymousContent</title>
</head>
<body>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />
	</c:if>
	
<section style="float: right; width: 100%; height: 100%; top:100px">
	<div style="width: 80%; margin:40px auto;">
	<div style="text-align: center;">
   		<H2>익명게시판</H2>
	</div>
	<table class="table table-sm table-hover"  >
    <thead class="table-light">
        <tr>
        
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">날짜</th>
            <th scope="col">조회수</th>
      
        </tr>
    </thead>
    
    <tbody>
   
    	<tr>
       	 	<td>${an.id }</td>
      		<td>${an.title }</td>
        	<td>${an.writer }</td>
        	<td>${an.writeDate }</td>
        	<td>${an.count }</td>
   		</tr>
   		<tr>
   			<td colspan="5" style="height: 500px"> ${an.content }</td>
   		</tr>
   
	</tbody>
</table>
</div>
</section>
</body>
</html>
