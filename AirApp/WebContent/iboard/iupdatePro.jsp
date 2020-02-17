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
	// updateForm.jsp 페이지에서 전달된 정보를 DB에 저장
	// => 수정된 정보를 저장
	
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//파라미터 pageNUm 저장
	String pageNum = request.getParameter("PageNum");
	
	// 전달정보( 글번호(hidden), 글쓴이, 비밀번호, 제목, 내용 )=>액션태그 사용 저장
	%>
	<jsp:useBean id="bb" class="com.air.board.iBoardBean" />
	<jsp:setProperty property="*" name="bb"/>
	
	
	<jsp:useBean id="bdao" class="com.air.board.iBoardDAO"/>
	
	<%
	System.out.println("bb : " +bb);

	// BoardDAO 객체 생성 -> updateBoard(BoardBean객체) 사용
// 	BoardDAO bdao = new BoardDAO();
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