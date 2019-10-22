<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String num = request.getParameter("num");
String name = request.getParameter("name");
String price = request.getParameter("price");
String date = request.getParameter("date");
date=date.replace("-","");
String desc = request.getParameter("desc");
String age = request.getParameter("age");
String star_rate = request.getParameter("star_rate");

if(num!=null){
	out.println("니가 입력한 num:" + num +"<br>");
	out.println("니가 입력한 name:" + name +"<br>");
	out.println("니가 입력한 price:" + price +"<br>");
	out.println("니가 입력한 date:" + date +"<br>");
	out.println("니가 입력한 desc:" + desc +"<br>");
	out.println("니가 입력한 age:" + age +"<br>");
	out.println("니가 입력한 star_rate:" + star_rate +"<br>");
	
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql ="insert into movie_info(mi_num,mi_name,mi_price,mi_date,mi_desc,mi_age,mi_star_rate)";
	sql += " values('" + num + "','" + name +"','" + price +"','" + date +"','"+ desc+ "','"+ age +"','"+ star_rate+ "')";
	int result = stmt.executeUpdate(sql);
	//out.println(sql);
	
	if(result ==1){
		out.println("정상적으로 등록 되었습니다.");
	}
	//전화기 끊는것 
	con.commit();
}
%>

<a href="/bdi-web/jsp/movie/movie-list.jsp">돌아가기</a>
