<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 선언부 영역과 jsp 영역이 다른 영역이다. -->
<%!
public void test(JspWriter out)throws Exception{
	out.println("하하하하~");
}
/*주석 */
%>


<form method="post" action="/bdi-web/jsp/calc/calc_ok.jsp">
	숫자1: <input type='number'name='num1' value ="3"> <!-- 브라우저에서 서버로는 문자열로 보냄  초기값을 넣기 위해서는 value 입력 가능--> 
	<Select name="op">
	<option value="">선택</option>
	<option value="+">더하기</option>
	<option value="-">빼기</option>
	<option value="*">곱하기</option>
	<option value="/">나누기</option>
	</Select>
	숫자2: <input type='number'name='num2'> <!-- number로 받아도 String으로 받는다.-->
	
	<button> 계산 </button>
</form>

</body>
</html>