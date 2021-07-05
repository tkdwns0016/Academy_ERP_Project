<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
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
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open("/view/popup.jsp", "a", "width = 550, height = 550, top = 0, left = 200, location = no");
    }
 </script>

 <style> .bd-placeholder-img { font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; 
 -moz-user-select: none; user-select: none; } 
 
 @media (min-width: 768px) { .bd-placeholder-img-lg { font-size: 3.5rem; } } 
 </style> 
 
 
 <!-- Custom styles for this template --> 
 <link href="/static/bootstrap/sign-in/signin.css" rel="stylesheet"> </head> 
 <body class="text-center"> 
     <main class="form-signin"> 
         
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
