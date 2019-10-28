<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

request.setCharacterEncoding("UTF-8");

Connection con = DBCon.getCon();

//String biImage = request.getParameter("bi_image");



String sql = "insert into books_info(bi_num,bi_image,bi_title,bi_type,bi_start,bi_credate,bi_desc) ";
sql += "values(SEQUENCE_books_bi_num.nextval,'/imgs/img.jpg',?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,request.getParameter("bi_title"));
ps.setString(2,request.getParameter("bi_type"));
ps.setString(3,request.getParameter("bi_start"));
ps.setString(4,request.getParameter("bi_credat"));
ps.setString(5,request.getParameter("bi_desc"));

int result = ps.executeUpdate();
if(result ==1){
	%>
	<script>
	alert('저장성공!');
	</script>
	<%
	
	con.commit();
}else{
	out.println("정상적으로 등록이 안되었으니 다시 확인 부탁드립니다.");
}  
%>

