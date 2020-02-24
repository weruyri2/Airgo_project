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

	<%

		request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String pass = request.getParameter("pass");
		
		BoardDAO bdao = new BoardDAO();

		int check = bdao.deleteBoard(num, pass);
		
		if(check==1) {
			%>
			<script type="text/javascript">
				alert("삭제 완료");
				location.href="boardList.jsp?pageNym=<%=pageNum%>";
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
				alert("글이 없습니다.");
				history.back();
			</script>
			
			<%
		}
	
	
	%>
</body>
</html>