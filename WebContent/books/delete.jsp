<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Connection con = DBCon.getCon();

String sql = "delete from books_info where ";
sql += "bi_num = ? ";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,request.getParameter("bi_num"));
int rs = ps.executeUpdate();
if(rs ==1){
	%>
	<script>
	alert('삭제 성공!');
	</script>
	<%
	
	con.commit();
}else{
	out.println("정상적으로 삭제가 안되었으니 다시 확인 부탁드립니다.");
}  
%>