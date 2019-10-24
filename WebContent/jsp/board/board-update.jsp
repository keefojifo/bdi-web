<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board-update</title>
</head>
<body>
	<%
		String biNum = request.getParameter("bi_num");
		String sql = "select * from board_info where bi_num=?";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,biNum);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {
			out.println(biNum + "에 해당하는 게시물은 존재 하지 않습니다.");
		} else {
	%>

	<form method="post" action="/bdi-web/jsp/board/board-update-ok.jsp">
		<table border='1'>
			<tr>
				<th>번호</th>
				<td><%=biNum%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="BI_TITLE"
					value="<%=rs.getString("BI_TITLE")%>"><br></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="BI_USER"
					value="<%=rs.getString("BI_USER")%>"><br></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="BI_CONTENT"
					value="<%=rs.getString("BI_CONTENT")%>"><br></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><input type="text" name="BI_CREDAT"
					value="<%=rs.getString("bi_credat")%>"><br></td>
			</tr>
			<tr>
				<th>등록시간</th>
				<td><input type="text" name="BI_CRETIM"
					value="<%=rs.getString("bi_cretim")%>"><br></td>

			</tr>
			<tr>
				<th>수정일자</th>
				<td><input type="text" name="BI_MODDAT"
					value="<%=rs.getString("bi_moddat")%>"><br></td>
			</tr>
			<tr>
				<th>수정시간</th>
				<td><input type="text" name="BI_MODTIM"
					value="<%=rs.getString("bi_modtim")%>"> <br></td>
			</tr>

			<tr>
				<th colspan="2"><button>게시판 정보 수정</button></th>
			</tr>
		</table>
		<!-- name으로 받는 값의 대소문자를 가린다. -->
		<input type="hidden" name="BI_NUM" value="<%=biNum%>">
	</form>

	<%
		}
	%>
</body>
</html>