<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <meta name="description" content=""> 
 <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors"> 
 <meta name="generator" content="Hugo 0.79.0"> 
 <title>Signin Template · Bootstrap v5.0</title> 
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script> 
 <!-- Bootstrap core CSS --> 
 <link href="/static/bootstrap/assets/dist/css/bootstrap.min.css" rel="stylesheet"> 

 <!-- 팝업 소스-->
 <script>
    function popup(){
        var url = "/popup";
        var name = "popup test";
        var option = "width = 540, height = 570, top = 100, left = 200, location = no";
        window.open(url, name, option);
    }
 </script>

 <style> .bd-placeholder-img { font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; 
 -moz-user-select: none; user-select: none; } 
 
 @media (min-width: 768px) { .bd-placeholder-img-lg { font-size: 3.5rem; } } 
 </style> 
 
 
 <!-- Custom styles for this template --> 
 <link href="/static/bootstrap/sign-in/signin.css" rel="stylesheet"> </head> 
 <body class="text-center"> 
 <c:if test="${result }">
 	<script type="text/javascript">
 		
 			alert("정보가 일치하지 않습니다. 다시 입력해주세요")
 		
 	</script>
 </c:if>
     <main class="form-signin"> 
         
         <form action="/login" method="post">
            <div style=" border: 1px solid darkgray;  border-top: 2px; border-left: 2px; border-radius: 3%; box-shadow: 2px 2px 2px 2px slategrey; padding: 50px; width: 500px; margin-left: -100px;">
                 <img class="mb-4" src="/image/logo.png" alt="" width="150" height="150"> 
                 <h1 class="h3 mb-3 fw-normal">오주원상사 ERP</h1> <label for="inputEmail" class="visually-hidden">Email address</label> 
                 <input type="text" id="email_id" name="userId" class="form-control" placeholder="pressure of business" required autofocus style="margin-bottom: 5px;"> 
                 <label for="inputPassword" class="visually-hidden">Password</label> 
                 <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required> 
                 <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button> 
                 <p class="mt-5 mb-3 text-muted">&copy; 2021-06-18 ~ 2021-07-21</p> 
                 <hr>
                 <div>비밀번호를 잊어버리셨나요? <a href="javascript:popup()" style="text-decoration: none;">비밀번호찾기</a></div>
                </div>
        </form> 
    </main> 
</body> 
</html>
