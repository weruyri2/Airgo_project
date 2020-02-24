<%@page import="com.air.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/writePro.jsp</h1>
	
	<%

		request.setCharacterEncoding("utf-8");	

		String pass = request.getParameter("pass");
		
		if(pass==null){
			%>
			<script type="text/javascript">
				alert("비밀번호를 입력하세요22");
				history.back();
			</script>
			<%
		}
		
		%>
		<!-- HTML -->
		<jsp:useBean id="bb" class="com.air.board.BoardBean" />
		<jsp:setProperty property="*" name="bb"/>
		<% 
		if(bb.getPass()==null){
			%>
			<script type="text/javascript">
				alert("비밀번호를 입력하세요");
				history.back();
			</script>
			<%
		}else{
		
		System.out.println("bb객체에 저장된 정보 : "+bb.toString());

		bb.setIp(request.getRemoteAddr());
		System.out.println("bb객체에 저장된 정보 : "+bb.toString());

		BoardDAO bdao = new BoardDAO();

		bdao.insertBoard(bb); 
		

		response.sendRedirect("boardList.jsp");
		
		}
	
	
	%>
	
</body>
</html>