<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form method="get" action="/bdi-web/jsp/movie/movie_ok.jsp">
		<table border="1">
			<tr>
				<th>영화번호</th>
				<td><input type="number" name=num></td>
				</tr><tr>
				<th>영화제목</th>
				<td><input type="text" name="name"></td>
				</tr><tr>
				<th>티켓가격</th>
				<td><input type="number" name="price"></td>
				</tr><tr>
				<th>개봉일</th>
				<td><input type="date" name="date"></td>
				</tr><tr>
				<th>영화설명</th>
				<td><textarea name="text"></textarea></td>
				</tr><tr>
				<th>연령등급</th>
				<td><input type="number" name="age"></td>
				</tr><tr>
				<th>별점</th>
				<td><input type="number" name="star_rate"></td>
				</tr><tr>
				
			</tr>
		</table>
		<button>제출하기</button>
	</form>

</body>
</html>