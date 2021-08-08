<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<c:if test="${not empty result}">
		<script>
		if(${result}){
			alert("1개의 게시물이 정상적으로 ${button} 되었습니다.");
			location.href=('/educationBoard?departmentId=${departmentId}');
		}
		if(${!result}){
			alert("정상적으로 처리되지 않았습니다.");
			location.href=('/educationBoard?departmentId=${departmentId}');
		}
		</script>

	</c:if>
</html>