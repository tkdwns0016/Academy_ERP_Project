<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		이름 : <input type="text" name="name" placeholder="이름"><br>
		성별 : <input id="men"  name="sex" value="남" type="radio" ><label for="men">남</label>
			<input id="women" name="sex" value="여" type="radio" ><label for="women">여</label><br>
		
		연락처: <input style="width: 200px" type="text" name="phone" pattern="[01]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화번호(01X-XXXX-XXXXX)"><br>
		email: <input type="text" name="email" placeholder="이메일 아이디 ">@<input class="em" type="text" placeholder="직접입력" pattern="[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}"/>
		<select name="email">
		 	<option value="">직접입력
		 	<option class="e1" value="naver.com">naver.com
		 	<option class="e1" value="hanmail.net">hanmail.net
		 	<option class="e1" value="google.com">google.com
		 	<option class="e1" value="yahoo.co.kr">yahoo.co.kr
		</select><br>
		우편번호:
		
	</form>
	 <script type="text/javascript">
		var select = document.querySelectorAll("select")[0];
		var input = document.querySelectorAll(".em")[0];
		
		select.onclick=function(){
			if(select.value==""){
				input.removeAttribute("readonly")				
			}else{
			input.value="";	
			input.setAttribute("readonly","readonly")
			}
		}
	
	</script>

</body>
</html>