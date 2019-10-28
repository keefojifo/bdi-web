<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%	
	List<Integer> li = new ArrayList<Integer>();
	Random ran = new Random();
	
	for (int i = 0; i < 6 ; i++) {
	int rNum = ran.nextInt(45)+1;
	if(li.indexOf(rNum)==-1) {
		li.add(rNum);
	}else {
		i--;
	}
	
	}
	for(int i =0; i<li.size();i++){
		for(int j =i+1 ;j<li.size();j++){
			if(li.get(i)>li.get(j)){
				int tmpInt = li.get(i);
				li.set(i,li.get(j));
				li.set(j,tmpInt);
			}
		}
	}
	
	/* 
	중복 for 문으로 정렬하는 방법 말고 함수를 사용해서 하는 방법
	Collections.sort(li);
	return  li;
	 */
	
	Connection con = DBCon.getCon();
	
	String sql = "insert into lotto(seq,num1,num2,num3,num4,num5,num6) values(SEQ_seq.nextval,?,?,?,?,?,?)";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setInt(1,li.get(0));
	ps.setInt(2,li.get(1));
	ps.setInt(3,li.get(2));
	ps.setInt(4,li.get(3));
	ps.setInt(5,li.get(4));
	ps.setInt(6,li.get(5));
	
	int result = ps.executeUpdate();

	if(result ==1){
		%>
		<script>
		alert("로또 회차 생성");
		location.href="/bdi-web/jsp/lotto/lotto-list.jsp";
		</script>
		<%
		con.commit();
	}else{
		out.println("정상적으로 등록이 안되었으니 다시 확인 부탁드립니다.");
	} 
	%>	
	