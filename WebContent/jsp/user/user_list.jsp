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
<title>Insert title here</title>
</head>
<body>

	<form>
		<select name="search">
			<option value="ui_name">이름</option>
			<option value="ui_id">아이디</option>
			<option value="ui_age">나이</option>
		</select>:<input type="text" name="searchStr">
		<button>검색</button>
	</form>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비번</th>
			<th>나이</th>
			<th>비고</th>
			<th>취미</th>
		</tr>
		<%
			String search = request.getParameter("search");
			String searchStr = request.getParameter("searchStr");
	
			String sql = "select * from user_info ";

			if (search != null) {
				//sql += "where ui_id=? ";

				if ("ui_name".equals(search)) {
					sql += "where ui_name like ?";
				} else if ("ui_id".equals(search)) {
					sql += "where ui_id like ?";
				} else if ("ui_age".equals(search)) {
					sql += "where ui_age like ?";
				}
			}
			sql += " ORDER BY UI_NUM DESC";

			Connection con = DBCon.getCon();
			PreparedStatement ps = con.prepareStatement(sql);

			if (search != null) {
				if ("ui_name".equals(search) || "ui_id".equals(search) || "ui_age".equals(search))
					;
				//ps.setString(1,uild);
				ps.setString(1, "%" + searchStr + "%");
			}
			//out.println(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("ui_num")%></td>
			<td><%=rs.getString("ui_name")%></td>
			<td><a href="/bdi-web/jsp/user/user_update.jsp?ui_num=<%=rs.getString("ui_num")%>">
					<%=rs.getString("ui_id")%></a></td>
			<td><%=rs.getString("ui_pwd")%></td>
			<td><%=rs.getString("ui_age")%></td>
			<td><%=rs.getString("ui_etc")%></td>
			<td><%=rs.getString("hobby")%></td>
		</tr>
		<%
			}
		%>
		<button>
			<a href="/bdi-web/jsp/user/user_signup.jsp">회원가입</a>
		</button>
		<br>
		<button>
			<a href="/bdi-web/jsp/user/login.jsp">로그인</a>
		</button>
		<br>
		<button>
			<a href="/bdi-web/jsp/user/user_list.jsp">리스트</a>
		</button>
		<br>

	</table>
</body>
</html>