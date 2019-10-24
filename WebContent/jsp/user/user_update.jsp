<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
public String checkStr(String str,String targetStr){
	String[] strs =str.split(",");
	for(String s:strs){
		if(s.equals(targetStr)){
			return "checked";
		}
	}
	return "";
}
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_update</title>
</head>
<body>
	<%
		String uiNum = request.getParameter("ui_num");
		String sql = "select * from user_info where ui_num=?";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,uiNum);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {
			out.println(uiNum + "에 해당하는 게시물은 존재 하지 않습니다.");
		} else {
	%>

	<form method="post" action="/bdi-web/jsp/user/user_update_ok.jsp">
		<table border='1'>
			<tr>
				<th>사용자 번호</th>
				<td><%=uiNum%></td>
			</tr>
			<tr>
				<th>사용자 아이디</th>
				<td><input type="text" name="UI_ID"
					value="<%=rs.getString("UI_ID")%>"><br></td>
			</tr>
			<tr>
				<th>사용자 비밀번호</th>
				<td><input type="password" name="UI_PWD"
					value="<%=rs.getString("UI_PWD")%>"><br></td>
			</tr>
			<tr>
				<th>사용자 이름</th>
				<td><input type="text" name="UI_NAME"
					value="<%=rs.getString("UI_NAME")%>"><br></td>
			</tr>
			<tr>
				<th>사용자 나이</th>
				<td><input type="number" name="UI_AGE"
					value="<%=rs.getString("UI_AGE")%>"><br></td>
			</tr>
			<tr>
				<th>사용자 기타 사항</th>
				<td><textarea name="UI_ETC"><%=rs.getString("UI_ETC")%></textarea><br></td>
			</tr>
			<tr>
			<th>hobby</th>
				<td>
					<input type="checkbox" name="hobby" value="study"<%=checkStr(rs.getString("hobby"),"study") %>>공부
					<input type="checkbox" name="hobby" value="game"<%=checkStr(rs.getString("hobby"),"game") %>>게임
					<input type="checkbox" name="hobby" value="movie"<%=checkStr(rs.getString("hobby"),"movie") %>>영화 
					<input type="checkbox" name="hobby" value="music"<%=checkStr(rs.getString("hobby"),"music") %>>음악	
				</td>
				</tr>
				<tr>
				<th colspan="2"><button>회원 정보 수정</button></th>
			</tr>
		</table>
		<!-- name으로 받는 값의 대소문자를 가린다. -->
		<input type="hidden" name="UI_NUM" value="<%=uiNum%>">
	</form>

	<%
		}
	%>
	<button>
		<a href="/bdi-web/jsp/user/user_signup.jsp">회원가입</a>
	</button>
	<button>
		<a href="/bdi-web/jsp/user/login.jsp">로그인</a>
	</button>
	<br>
	<button>
		<a href="/bdi-web/jsp/user/user_list.jsp">리스트</a>
	</button>
	<br>
</body>
</html>