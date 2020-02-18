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
		request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="mb" class="com.air.member.MemberBean" />
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	System.out.println("저장정보 : "+mb.toString());
	
	MemberDAO mdao = new MemberDAO();
	
	int check = mdao.insertMember(mb);

	
	if(check==1){
	%>
	 <script type="text/javascript">
	 	alert("회원가입 성공");
	 	location.href="loginForm.jsp";
	 </script>
	 <%}else{ %>
	 	 <script type="text/javascript">
	 	alert("회원가입 실패");
		history.back();
	 </script>
	 <%} %>
	 
	
</body>
</html>