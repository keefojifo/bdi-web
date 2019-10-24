<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");

			String uiId = request.getParameter("UI_ID");
			String uiPwd = request.getParameter("UI_PWD");
			String uiName = request.getParameter("UI_NAME");
			String uiAge = request.getParameter("UI_AGE");
			String uiEtc = request.getParameter("UI_ETC");
			String uiNum = request.getParameter("UI_NUM");
			String[] hobbies = request.getParameterValues("hobby");
			String hobby ="";
			for(int i=0 ; i<hobbies.length;i++){
				hobby += hobbies[i]+",";
			}
			hobby=hobby.substring(0,hobby.length()-1);
			
			String sql = " UPDATE user_info ";
			sql += " set UI_ID=?, ";
			sql += " UI_PWD=?, ";
			sql += " UI_NAME=?, ";
			sql += " UI_AGE=?, ";
			sql += " UI_ETC=?, ";
			sql += " hobby =? ";
			sql += " where UI_NUM=? ";
			//out.println(sql);
			//set (UI_ID,UI_PWD,UI_NAME,UI_AGE,UI_ETC,UI_NUM) = (?,?,?,?,?,?)";
			
		    Connection con = DBCon.getCon();
		    PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,uiId);
			ps.setString(2,uiPwd);
			ps.setString(3,uiName);
			ps.setString(4,uiAge);
			ps.setString(5,uiEtc);
			ps.setString(6,hobby);
			ps.setString(7,uiNum);
			
			int result = ps.executeUpdate();

			if(result ==1){
				out.println("정상적으로 등록 되었습니다.");
				con.commit();
			}else{
				out.println("정상등록이 안되었습니다.");
			}
		//out.println(sql);
		/* 	int result = ps.executeUpdate();

			if (result == 1) {
				out.println("회원 수정 완료");
				con.commit();
			} else {
				out.println("정상등록이 안되었습니다.");
			}   */
	%>
