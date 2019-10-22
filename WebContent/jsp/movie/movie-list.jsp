<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = DBCon.getCon();
		String sql = "select * from movie_info";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	%>
	<table border='2'>
		<tr>
			<th>번호</th>
			<th>영화제목</th>
			<th>티켓가격</th>
			<th>개봉일</th>
			<th>영화설명</th>
			<th>연령등급</th>
			<th>별점</th>
			<th>삭제</th>
		</tr>

		<%
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("mi_num") + "</td>");
				out.println("<td>" + rs.getString("mi_name") + "</td>");
				out.println("<td>" + rs.getString("mi_price") + "</td>");
				out.println("<td>" + rs.getString("mi_date") + "</td>");
				out.println("<td>" + rs.getString("mi_desc") + "</td>");
				out.println("<td>" + rs.getString("mi_age") + "</td>");
				out.println("<td>" + rs.getString("mi_star_rate") + "</td>");
				out.println("<td>");
				out.println("<a href=/bdi-web/jsp/movie/movie-delete.jsp?mi_num="+rs.getString("mi_num")+">"); 
				out.println("<button>삭제</button></td>");
				out.println("</tr>");
			}
		%>
	</table>
	<a href="/bdi-web/jsp/movie/movie-insert.jsp"><button>글쓰기</button></a>
</body>
</html>