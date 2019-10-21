<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String op = request.getParameter("op");
		out.println("원하는 연산자는" + op);
	
		String num1 = request.getParameter("num1");

		int n1 = Integer.parseInt(num1);

		String num2 = request.getParameter("num2");

		int n2 = Integer.parseInt(num2);
		
//String 비교할때는 먼저 스트링먼저 쓰고 .equals()를 쓴다.
		if (op== null){
			out.println("연산자는 null 일 수 없습니다.");		
		}
		else if ("+".equals(op)) {
			out.println(n1 + n2);
		} else if ("-".equals(op)) {
			out.println(n1 - n2);
		} else if ("*".equals(op)) {
			out.println(n1 * n2);
		} else if ("/".equals(op)) {
			out.println(n1 / n2);
		}else{
			out.println("잘못된 연산자 입니다");
		}

	%>

</body>
</html>