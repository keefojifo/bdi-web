<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/common/first.jsp"%>
<!DOCTYPE html>
<%
		String biNum = request.getParameter("bi_num");
		String sql = "select * from books_info where bi_num=?";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,biNum);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {
			out.println(biNum + "에 해당하는 게시물은 존재 하지 않습니다.");
		} else {
	%>

	<form method="post" action="<%=rootPath%>/books/update-ok.jsp">
		<table border='1'>
			<tr>
				<th>번호</th>
				<td><%=biNum%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="bi_title"
					value="<%=rs.getString("bi_title")%>"><br></td>
			</tr>
			<tr>
				<th>타입</th>
				<td><input type="text" name="bi_type"
					value="<%=rs.getString("bi_type")%>"><br></td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="text" name="bi_start"
					value="<%=rs.getString("bi_start")%>"><br></td>
			</tr>
			<tr>
				<th>발행일</th>
				<td><input type="text" name="bi_credate"
					value="<%=rs.getString("bi_credate")%>"><br></td>

			</tr>
			<tr>
				<th>기타설명</th>
				<td><input type="text" name="bi_desc"
					value="<%=rs.getString("bi_desc")%>"><br></td>
			</tr>
			<tr>
				<th colspan="2"><button>책 등록정보 수정</button></th>
			</tr>
		</table>
		<!-- name으로 받는 값의 대소문자를 가린다. -->
		<input type="hidden" name="bi_num" value="<%=biNum%>">
	</form>

	<%
		}
	%>