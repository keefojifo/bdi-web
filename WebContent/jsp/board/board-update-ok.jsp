<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");

			String biTitle = request.getParameter("BI_TITLE");
			String biUser = request.getParameter("BI_USER");
			String biContent = request.getParameter("BI_CONTENT");
			String biCredat = request.getParameter("BI_CREDAT");
			String biCretim = request.getParameter("BI_CRETIM");
			String biNum = request.getParameter("BI_NUM");
			
			String datesql = "SELECT to_char(sysdate,'YYYYMMDD') from dual";
			String timesql = "SELECT to_char(sysdate,'HH24MISS') from dual";

			String sql = " UPDATE board_info ";
			sql += " set BI_TITLE=?, ";
			sql += " BI_USER=?, ";
			sql += " BI_CONTENT=?, ";
			sql += " BI_CREDAT=?, ";
			sql += " BI_CRETIM=?, ";
			sql += " BI_MODDAT = ";
			sql +=	"("+datesql+"),";  
			sql += " BI_MODTIM = ";
			sql += "("+timesql+")";
			sql += " where BI_NUM=? ";
			//out.println(sql);
			//set (UI_ID,UI_PWD,UI_NAME,UI_AGE,UI_ETC,UI_NUM) = (?,?,?,?,?,?)";
			
		    Connection con = DBCon.getCon();
		    PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,biTitle);
			ps.setString(2,biUser);
			ps.setString(3,biContent);
			ps.setString(4,biCredat);
			ps.setString(5,biCretim);
			
			ps.setString(6,biNum);
			
			 int result = ps.executeUpdate();

			if(result ==1){
				out.println("정상적으로 등록 되었습니다.");
				con.commit();
			}else{
				out.println("정상등록이 안되었습니다.");
			} 
	%>
	
	<button>
		<a href="/bdi-web/jsp/board/board-list.jsp">리스트로 돌아가기</a>
	</button>