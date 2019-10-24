<%@page import="java.sql.PreparedStatement"%>
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
삭제할 게시판 번호를 입력하시오 :
	<!--  <%=request.getParameter("bi_num")%>-->
	<%
		Connection con = DBCon.getCon();
	   
		String a = request.getParameter("bi_num");
		out.println(a);

		String sql = "delete from board_info where bi_num =" +a;
		 PreparedStatement ps = con.prepareStatement(sql);
		int result = ps.executeUpdate(sql);
		
		out.println(sql);
		if (result == 1) {
			out.println("정상적으로 삭제 되었습니다.");
			//전화기 끊는것 
			con.commit();
		}
	%>
	<a href="/bdi-web/jsp/board/board-list.jsp">돌아가기</a>
</body>
</html>