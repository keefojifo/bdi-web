<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");


request.setCharacterEncoding("UTF-8");
String uiId = request.getParameter("UI_ID");
String uiPwd = request.getParameter("UI_PWD");
String uiName = request.getParameter("UI_NAME");
String uiAge = request.getParameter("UI_AGE");
String uiEtc = request.getParameter("UI_ETC");
String[] hobbies = request.getParameterValues("hobby");
String hobby ="";
for(int i=0;i<hobbies.length;i++){
	hobby += hobbies[i]+",";
}
 hobby =hobby.substring(0,hobby.length()-1);

if(uiId!=null)
out.println("입력한 UI_ID:" + uiId +"입니다."+"<br>");
out.println("입력한 UI_PWD:" + uiPwd +"입니다."+"<br>");
out.println("입력한 UI_NAME:" + uiName +"입니다."+"<br>");
out.println("입력한 UI_AGE:" + uiAge +"입니다."+"<br>");
out.println("입력한 UI_ETC:" + uiEtc +"입니다."+"<br>");
out.println("입력한 값이 정확한지 확인 바랍니다.");

Connection con =DBCon.getCon();
String sql ="INSERT into USER_info(UI_NUM,UI_ID,UI_PWD,UI_NAME,UI_AGE,UI_ETC,hobby)";
sql +="values(seq_ui_num.nextval,?,?,?,?,?,?)";
out.println(sql);
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,uiId);
ps.setString(2,uiPwd);
ps.setString(3,uiName);
ps.setString(4,uiAge);
ps.setString(5,uiEtc);
ps.setString(6,hobby);

int result = ps.executeUpdate();

if(result ==1){
	out.println("정상적으로 등록 되었습니다.");
	con.commit();
}else{
	out.println("정상등록이 안되었습니다.");
}
%>
<br>
<button><a href="/bdi-web/jsp/user/user_signup.jsp">회원가입</a></button>
<button><a href="/bdi-web/jsp/user/login.jsp">로그인</a></button><br>
<button><a href="/bdi-web/jsp/user/user_list.jsp">리스트</a></button><br>
