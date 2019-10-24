<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board-list</title>
</head>
<body>
	<form>
		<select name="search">
		<!--  <option value="bi_title">제목</option>
			<option value="bi_user">작성자</option>
			<option value="bi_content">내용</option>
			<option value="bi_title and bi_content">제목 + 내용</option>
			<option value="bi_title and bi_user and bi_content">제목 + 내용 + 사용자</option>
			-->	
			<option value="1">제목</option>
			<option value="2">작성자</option>
			<option value="3">내용</option>
			<option value="4">제목 + 내용</option>
			<option value="5">제목 + 내용 + 사용자</option>
		</select>:<input type="text" name="searchStr">
		<button>검색</button>
	</form>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>등록일자</th>
			<th>등록시간</th>
			<th>수정일자</th>
			<th>수정시간</th>
			<th>삭제</th>
		</tr>
		<%
			String search = request.getParameter("search");
			String searchStr = request.getParameter("searchStr");
			String sql = "select * from board_info ";
			if (search != null) {
				if ("1".equals(search)) {
					sql += "where bi_title like ? ";
				} else if ("2".equals(search)) {
					sql += "where bi_user like ? ";
				} else if ("3".equals(search)) {
					sql += "where bi_content like ? ";
				} else if ("4".equals(search)) {
					sql += "where bi_title like ? or bi_user like ? ";
				} else if ("5".equals(search)) {
					sql += "where bi_title like ? or bi_user like ? or bi_content like ? ";
				}
			}
			sql += " ORDER BY bi_NUM DESC";
			Connection con = DBCon.getCon();
			PreparedStatement ps = con.prepareStatement(sql);
			
		
			if ("1".equals(search) || "2".equals(search) || "3".equals(search)){
			  ps.setString(1, "%" + searchStr + "%");
			}
			else if ("4".equals(search)) {
				ps.setString(1, "%" + searchStr + "%");
				ps.setString(2, "%" + searchStr + "%");
			}
			else if ("5".equals(search)) {
				ps.setString(1, "%" + searchStr + "%");
				ps.setString(2, "%" + searchStr + "%");
				ps.setString(3, "%" + searchStr + "%");
			}

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("bi_num")%></td>
			<td><%=rs.getString("bi_title")%></td>
			<td><a
				href="/bdi-web/jsp/board/board-update.jsp?bi_num=<%=rs.getString("bi_num")%>">
					<%=rs.getString("bi_user")%></a></td>
			<td><%=rs.getString("bi_content")%></td>
			<td><%=rs.getString("bi_credat")%></td>
			<td><%=rs.getString("bi_cretim")%></td>
			<td><%=rs.getString("bi_moddat")%></td>
			<td><%=rs.getString("bi_modtim")%></td>
			<td><a
				href="/bdi-web/jsp/board/board-delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button
						type="button">삭제</button></a></td>
		</tr>
		<%
			}
		%>
	</table>


</body>
</html>