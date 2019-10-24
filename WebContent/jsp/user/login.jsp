<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginjsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){
	String sql = "select * from user_info where ui_id = ? and ui_pwd=?";
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,id);
	ps.setString(2,pwd);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		out.println(rs.getString("ui_name")+ "님 안녕하세요~");
	}else{
		out.println("아이디 와 비밀번호를 잘못 입력 하였습니다.");
	}
	
	out.println("니가 입력한 아이디 :" + id);
}
%>
<form method="post">
아이디 : <input type ="text" name="id"><br>
페스워드 : <input type="password" name = "pwd"><br>
<button>login</button>
</form>
<br>
<button><a href="/bdi-web/jsp/user/user_signup.jsp">회원가입</a></button>
<button><a href="/bdi-web/jsp/user/login.jsp">로그인</a></button><br>
<button><a href="/bdi-web/jsp/user/user_list.jsp">리스트</a></button><br>
</body>
</html>