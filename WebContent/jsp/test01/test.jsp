<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 선언부를 안쓰고 클레스로 대신한다 -->
<%!
public void test(){
}
%>

<%
test();
request.getParameter("abc");
response.addCookie(null);
List<String> strList = new ArrayList<String>();
%>

</body>
</html>