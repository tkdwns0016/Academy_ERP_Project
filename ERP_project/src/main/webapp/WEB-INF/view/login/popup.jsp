<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en"> 
<head> 
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <meta name="description" content=""> 
 <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors"> 
 <meta name="generator" content="Hugo 0.79.0"> 
 <title>비밀번호 찾기</title> 
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script> 
 <!-- Bootstrap core CSS --> 
 <link href="/static/bootstrap/assets/dist/css/bootstrap.min.css" rel="stylesheet"> 

 
 <!-- Custom styles for this template --> 
 <link href="/static/bootstrap/sign-in/signin.css" rel="stylesheet"> </head> 
 <body class="text-center"> 
     <main class="form-signin"> 
     <c:if test="${not empty result}">
     	<c:if test="${result }">
     	<script type="text/javascript">
     		alert("메일로 비밀번호 내용이 전송되었습니다.")
     	</script>
     		</c:if>
     	<c:if test="${!result }">
     	<script type="text/javascript">
     		alert("정보가 일치하지 않습니다. 다시 입력해주세요")
     	</script>
     	</c:if>
     
     </c:if>
         
         <form action="/email/password" method="POST" >
            <div style="border: 3px solid darkgray;  padding: 50px; width: 500px; margin-left: -100px;">
                 
                 <h1 class="h3 mb-5 fw-bold">비밀번호 찾기</h1>
                 <div> 비밀번호는 아이디, 이름, 주민등록번호를 통하여<br> 찾으실 수 있습니다.</div><br>
        
                 <input type="text" id="email_id" name="userId" class="form-control" placeholder="아이디을 입력해주세요" required autofocus> 
                 <br>
                 <input type="text" name="name" id="inputPassword" class="form-control" placeholder="이름을 입력해주세요" required> 
                 <input type="password" name="birthDate" id="inputPassword" class="form-control" placeholder="주민등록번호를 입력해주세요" required> 
                 <br>
                
                 <button class="w-100 btn btn-lg btn-primary" type="submit">찾기</button> 
                 
                </div>
        </form> 
    </main> 
</body> 
</html>
