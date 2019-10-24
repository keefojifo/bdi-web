<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Connection con = DBCon.getCon();
String biTitle = request.getParameter("BI_TITLE");
String biUser = request.getParameter("BI_USER");
String biContent = request.getParameter("BI_CONTENT");

String datesql = "SELECT to_char(sysdate,'YYYYMMDD') from dual";
String timesql = "SELECT to_char(sysdate,'HH24MISS') from dual";


out.println("입력한 BI_TITLE:" + biTitle +"입니다."+"<br>");
out.println("입력한 BI_USER:" + biUser +"입니다."+"<br>");
out.println("입력한 BI_CONTENT:" + biContent +"입니다."+"<br>");
//if(biTitle!=null){
String sql = "insert into board_info(bi_num,bi_title,bi_user,bi_content,bi_credat,bi_cretim,bi_moddat,bi_modtim)";
sql += " values(SEQ_bi_num.nextval,?,?,?,";
sql += "("+datesql+"),";
sql += "("+timesql+"),";
sql += "("+datesql+"),";
sql += "("+timesql+"))";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biTitle);
ps.setString(2,biUser);
ps.setString(3,biContent);

int result = ps.executeUpdate();

if(result ==1){
	out.println("정상적으로 게시판에 등록 되었습니다.");
	con.commit();
}else{
	out.println("정상적으로 등록이 안되었으니 다시 확인 부탁드립니다.");
}  
//}
%>