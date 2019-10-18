
<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");

String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");

	out.println("니가 입력한 아이디:" + id +"<br>");
	out.println("니가 입력한 pwd:" + pwd +"<br>");
	out.println("니가 입력한 name:" + name +"<br>");
	out.println("니가 입력한 age:" + age +"<br>");
	out.println("니가 입력한 etc:" + etc +"<br>");
	if(id!=null){
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql ="insert into user_info(ui_id,ui_pwd,ui_name,ui_age,ui_etc)";
	sql += " values('" + id + "','" + pwd +"','" + name +"','" + age +"','"+ etc + "')";
	
	
	int result = stmt.executeUpdate(sql);
	if(result ==1){
		out.println("회원가입완료");
	}
	//전화기 끊는것 
	con.commit();
}
%>

<form>
ID:<input type="text"name="id"><br>
Password:<input type="password" name ="pwd"><br>
Name:<input type="text" name ="name"><br>
Age:<input type="number" name ="age"><br>
Etc:<textarea name="etc"></textarea><br>
<button>Singup</button>
<!-- get 방식  나에게  button 옵션이 default로 submit--> 
<!-- 
http://localhost:808/bdi-web/jsp/Signup.jsp
?
id=%EC%95%88%EB%85%95&
pwd=123123&
name=%EB%B0%98%EA%B0%80%EC%9B%8C&
age=123&
etc=%E3%85%87%E3%85%81%E3%84%B4%E3%85%87%E3%85%81%E3%84%B4%E3%85%80%E3%85%81%E3%84%B4%E3%84%B9
 -->
</form>
</body>
</html>