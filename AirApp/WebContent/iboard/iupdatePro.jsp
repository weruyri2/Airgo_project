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

	String pageNum = request.getParameter("PageNum");

	%>
	<jsp:useBean id="bb" class="com.air.board.iBoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	
	
	<jsp:useBean id="bdao" class="com.air.board.iBoardDAO"/>
	
	<%
	System.out.println("bb : " +bb);


 	int check = bdao.updateBoard(bb);
 	//check : 1	=>"정보 수정 완료", boardList.jsp 이동(+pageNum)
 	//check : 0	=>"비밀번호 오류", 뒤로가기
 	//check : -1	="글번호 없음", 뒤로가기
 	

 		
	 	if(check==1){
	 		%>
	 			<script type="text/javascript">
	 				alert("정보 수정 완료");
	 				location.href="iboardList.jsp?pageNym=<%=pageNum%>";
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