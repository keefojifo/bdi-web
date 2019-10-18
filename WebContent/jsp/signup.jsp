<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<body>


<form method="get" action="/bdi-web/jsp/signup_ok.jsp">
ID:<input type="text"name="id"><br>
Password:<input type="password" name ="pwd"><br>
Name:<input type="text" name ="name"><br>
Age:<input type="number" name ="age"><br>
Etc:<textarea name="etc"></textarea><br>
<!-- get 방식  나에게  button 옵션이 default로 submit--> 
<button>singup</button>

<!-- 
http://localhost:808/bdi-web/jsp/Signup.jsp
?
id=%EC%95%88%EB%85%95&
pwd=123123&
name=%EB%B0%98%EA%B0%80%EC%9B%8C&
age=123&
etc=%E3%85%87%E3%85%81%E3%84%B4%E3%85%87%E3%85%81%E3%84%B4%E3%85%80%E3%85%81%E3%84%B4%E3%84%B9
 -->
</form>
</body>
</html>