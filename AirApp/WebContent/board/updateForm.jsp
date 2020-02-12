
<%@page import="com.air.board.BoardBean"%>
<%@page import="com.air.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정하기</title>
</head>
<body>
	<h1>webContent/board/updateFrom.jsp</h1>
	<h1> 게시판 수정하기 (정보 변경)</h1>
	
	<%
		// 글정보를 가져와서 페이지에 출력
		// BoardDAO 객체 생성
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		
		BoardDAO bdao = new BoardDAO();
		
		BoardBean bb = bdao.getBoard(num);
		
		// 사용자 정보 변경
		// 변경된 정보를 DB에 저장 (pro페이지에서 처리)
	
	%>
	
	
	<fieldset>
	 <legend> 글 수정하기 </legend>
	 <!-- pageNum get방식 -->
	 <form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
	 <!-- num form태그 방식-->
	 <input type="hidden" name="num" value="<%=num%>">	 
	 글쓴이 : <input type="text" name="name" value="<%=bb.getName()%>"> <br>
	 비밀번호 : <input type="password" name="pass"> <br>
	 제목 : <input type="text" name="subject" value="<%=bb.getSubject() %>"> <br>
	 내용 : <br> <textarea rows="10" cols="20" name="content" ><%=bb.getContent()%></textarea> <br>
	 
	 <input type = "submit" value = "수정하기">
	 
	 </form>
	</fieldset>
</body>
</html>