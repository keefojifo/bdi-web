<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Connection con = DBCon.getCon();
String sql = "update books_info set ";
sql += "bi_title = ?, ";
sql += "bi_type = ?, ";
sql += "bi_start = ?, ";
sql += "bi_credate = ?, ";
sql += "bi_image = '/imgs/img.jpg', ";
sql += "bi_desc = ? " ;
sql += "where bi_num =? ";

//out.println(sql);

PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,request.getParameter("bi_title"));
ps.setString(2,request.getParameter("bi_type"));
ps.setString(3,request.getParameter("bi_start"));
ps.setString(4,request.getParameter("bi_credate"));
ps.setString(5,request.getParameter("bi_desc"));
ps.setString(6,request.getParameter("bi_num"));

int rs = ps.executeUpdate();


if(rs ==1){
	%>
	<script>
	alert('정상적으로 수정 되었습니다.')
	</script>
<%	
	con.commit();
}else{
	out.println("정상수정이 안되었습니다.");
} 

%>