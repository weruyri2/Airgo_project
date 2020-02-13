<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.LoginCheck(id,pass);
		
		if(check==1){
			session.setAttribute("id",id);
			%>
			<script type="text/javascript">
			alert("로그인 성공");
			location.href="../main/main.jsp";
			</script>
			<%
		}else if(check==0){
			%>
			<script type="text/javascript">
			alert("비밀번호 오류");
			history.back();
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
			alert("아이디가 없습니다.");
			history.back();
			</script>
			<%
		}
	
	
	
	
	
	
	%>
</body>
</html>