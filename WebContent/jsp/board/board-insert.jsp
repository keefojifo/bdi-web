<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board-insert</title>
</head>
<body>
	<form method="get" action="/bdi-web/jsp/board/board-insert-ok.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>자동으로 입력 됩니다.</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="BI_TITLE"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="BI_USER"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="BI_CONTENT"></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td>자동입력</td>
			</tr>
			<tr>
				<th>등록시간</th>
				<td>자동입력</td>
			</tr>
			<tr>
				<th>수정일자</th>
				<td>자동입력</td>
			</tr>
			<tr>
				<th>수정시간</th>
				<td>자동입력</td>
			</tr>
			<tr>
				<td colsapn="2"><button>게시물을 등록</button></td>
			</tr>
			</table>
			</form>
</body>
</html>