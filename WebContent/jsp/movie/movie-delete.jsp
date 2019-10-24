<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie-delete</title>
</head>
<body>
	삭제할 영화 번호 :
	<!--  <%=request.getParameter("mi_num")%>-->
	<%
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();

		String sql = "delete from movie_info where mi_num =" + request.getParameter("mi_num");
		int result = stmt.executeUpdate(sql);
		out.println(sql);
		if (result == 1) {
			out.println("정상적으로 등록 되었습니다.");
			//전화기 끊는것 
			con.commit();
		}
	%>
	<a href="/bdi-web/jsp/movie/movie-list.jsp">돌아가기</a>
</body>
</html>