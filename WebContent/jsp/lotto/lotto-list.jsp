<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.test.common.DBCon"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<body>
	
		<form method="get" action="/bdi-web/jsp/lotto/lotto-insert.jsp">
			<table border="1">
				<tr>
					<th>SEQ</th>
					<th>NUM1</th>
					<th>NUM2</th>
					<th>NUM3</th>
					<th>NUM4</th>
					<th>NUM5</th>
					<th>NUM6</th>
					<th>URL</th>
				</tr>
				
				<%
		Connection con = DBCon.getCon();
		String sql = "select * from lotto order by seq";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("seq")%></td>
		<td><%=rs.getString("num1")%></td>
		<td><%=rs.getString("num2")%></td>
		<td><%=rs.getString("num3")%></td>
		<td><%=rs.getString("num4")%></td>
		<td><%=rs.getString("num5")%></td>
		<td><%=rs.getString("num6")%></td>
		<td><%=request.getRequestURL() %></td>
   </tr>
		<%
			}
		%>
	
			</table>

			<button>LOTTO 값 입력</button>
		</form>
</body>
</html>