<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/bdi-web/param-map.jsp">
게임명 <input type="text" name="gameName"><br>
장르 :<input type="checkbox" name="ganre" value="Action">액션
<input type="checkbox" name="ganre" value="RPG">RPG
<input type="checkbox" name="ganre" value="Simulation">시뮬레이션
<br>
출시년도 : <input type="date" name="credat">
<button>게임정보 입력</button>
</form>
</body>
</html>