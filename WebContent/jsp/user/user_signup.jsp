<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<body>



	<form method="post" action="/bdi-web/jsp/user/user_insert.jsp">
		<table border='1'>
			<tr>
				<th>사용자 번호</th>
				<td>자동으로 입력 됩니다.</td>
			</tr>
			<tr>
				<th>사용자 아이디</th>
				<td>ID:<input type="text" name="UI_ID"><br></td>
			</tr>
			<tr>
				<th>사용자 비밀번호</th>
				<td>Password:<input type="password" name="UI_PWD"><br></td>
			</tr>
			<tr>
				<th>사용자 이름</th>
				<td>Name:<input type="text" name="UI_NAME"><br></td>
			</tr>
			<tr>
				<th>사용자 나이</th>
				<td>Age:<input type="number" name="UI_AGE"><br></td>
			</tr>
			<tr>
				<th>사용자 기타 사항</th>
				<td>Etc:<textarea name="UI_ETC"></textarea><br></td>
			</tr>
			<tr>
				<th>hobby</th>
				<td>
					<input type="checkbox" name="hobby" value="study">공부
					<input type="checkbox" name="hobby" value="game">게임
					<input type="checkbox" name="hobby" value="movie">영화 
					<input type="checkbox" name="hobby" value="music">음악	
				</td>

			</tr>

		</table>
		<button>singup</button>

	</form>
	<button>
		<a href="/bdi-web/jsp/user/user_signup.jsp">회원가입</a>
	</button>
	<button>
		<a href="/bdi-web/jsp/user/login.jsp">로그인</a>
	</button>
	<br>
	<button>
		<a href="/bdi-web/jsp/user/user_list.jsp">리스트</a>
	</button>
	<br>
</body>
</html>