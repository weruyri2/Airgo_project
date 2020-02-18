<%@page import="com.air.board.CometDAO"%>
<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="com.air.board.CometBean"%>
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

		request.setCharacterEncoding("utf-8");
		
		String id = (String)session.getAttribute("id");	
		int board_num = Integer.parseInt(request.getParameter("board_num"));	
		String content = request.getParameter("content");
		
		
		if(id==null){
			id="익명이";
		}
		
		
		
		CometBean cb = new CometBean();
		
		cb.setContent(content);
		cb.setId(id);
		cb.setBoard_num(board_num);
		
		System.out.println("cb객체에 저장된 정보 : "+cb.toString());

		CometDAO cdao = new CometDAO();
		// 글쓰기 동작 - insertBoard(bb)
		cdao.insertComet(cb); 
		
		// 페이지 이동 - list.jsp
		response.sendRedirect("../board/boardList.jsp");
		%>
	
</body>
</html>