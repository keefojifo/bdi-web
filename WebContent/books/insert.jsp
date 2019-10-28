<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/first.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
Connection con =DBCon.getCon();
String sql ="select * from books_type order by bt_num";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>



	<form method="post" action="<%=rootPath%>/books/insert-ok.jsp">
		<table border = "1">
		<tr>
		책 제목 : <input type="text" name="bi_title"> <br> 
		책종류 : <select name="bi_type">
			<%
				while(rs.next()){
				%>
				
			<option value="<%=rs.getString("bt_num") %>">.
				<%=rs.getString("bt_name") %>
			</option>
<%
}
%>

		</select>
<tr>
		<tr>
			<th>책 타입</th>
			<td><input type="text" name="bi_type"></td>
		</tr>
		<tr>
			<th>책 별점</th>
			<td><input type="text" name="bi_start"></td>
		</tr>
		<tr>
			<th>책 발간일</th>
			<td><input type="number" name="bi_credat"></td>
		</tr>
		<tr>
			<th>설명</th>
			<td><textarea name="bi_desc"></textarea></td>
		</tr>
		<tr>
			<td ><button>책 등록 하기</button></td>
		</tr>
		</table>



	</form>

</body>
</html>