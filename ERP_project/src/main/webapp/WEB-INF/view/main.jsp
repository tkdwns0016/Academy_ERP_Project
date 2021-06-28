<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<style>
section {
	top: 10%;

	width: 100%;
	float: right;
}
li {
	list-style: none;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<c:if test="${empl.manager=='권한' }">

		<tiles:insertAttribute name="root_side" />
	</c:if>
	<c:if test="${empl.manager=='비권한' }">
		<tiles:insertAttribute name="empl_side" />

	</c:if>
  <section>
    <div class="img_div">
      <img class="img" id="show" src="/image/1.jpg">
    </div>
    <div>
</div>
</section>
</body>
</html>