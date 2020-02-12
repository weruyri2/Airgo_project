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
		// writeForm.jsp 페이지에서 전달된 정보를 받아서 글쓰기 (DB 저장)
		
		//한글 처리
		request.setCharacterEncoding("utf-8");
	
		//전달되는 정보를 파라미터를 사용해서 저장
		// 액션태그 - 자바빈으로 저장
		
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
		// IP 정보를 추가적으로 자바빈 객체에 저장
// 		System.out.println("IP : "+request.getRemoteAddr());
		bb.setIp(request.getRemoteAddr());
		System.out.println("bb객체에 저장된 정보 : "+bb.toString());
		// BoardDAO 객체
		BoardDAO bdao = new BoardDAO();
		// 글쓰기 동작 - insertBoard(bb)
		bdao.insertBoard(bb); 
		
		// 페이지 이동 - list.jsp
		response.sendRedirect("boardList.jsp");
		
		}
	
	
	%>
	
</body>
</html>