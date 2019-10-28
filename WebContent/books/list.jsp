<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/first.jsp"%>

<!DOCTYPE html>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>제목</th>
			<th>타입</th>
			<th>별점</th>
			<th>발행일</th>
			<th>기타설명</th>
			<th>삭제</th>
	<th>수정</th>
		</tr>

		<%
			Connection con = DBCon.getCon();
			String sql = "select bi.BI_NUM,bi.BI_IMAGE,bi.BI_TITLE,bi.BI_START,bi.BI_CREDATE,bi.BI_DESC,(select bt.bt_name from BOOKS_TYPE bt where bt.bt_num =bi.Bi_type) bi_type from books_info bi";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("bi_num")%></td>
			<td><img src="<%=rootPath + rs.getString("bi_image")%>"></td>
			<td><%=rs.getString("bi_title")%></td>
			<td><%=rs.getString("bi_type")%></td>
			<td><%=rs.getString("bi_start")%></td>
			<td><%=rs.getString("bi_credate")%></td>
			<td><%=rs.getString("bi_desc")%></td>
			<td><a
				href="<%=rootPath%>/books/delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button
						type="button">삭제</button></a></td>
						<td><a
				href="<%=rootPath%>/books/update.jsp?bi_num=<%=rs.getString("bi_num")%>"><button
						type="button">수정</button></a></td>
		</tr>
<%
}
%>
	</table>
