<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
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
	<h1>WebContent/board/updatePro.jsp</h1>

	<%

	request.setCharacterEncoding("UTF-8");


	String pageNum = request.getParameter("PageNum");
	

	%>
	<jsp:useBean id="bb" class="com.air.board.BoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	
	
	<jsp:useBean id="bdao" class="com.air.board.BoardDAO"/>
	
	<%
	System.out.println("bb : " +bb);


 	int check = bdao.updateBoard(bb);

 
	 	if(check==1){
	 		%>
	 			<script type="text/javascript">
	 				alert("정보 수정 완료");
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
					alert("글 번호 없음");
					history.back();
				</script>
			<%
	 	}

 	
 	
	
	%>

	
</body>
</html>