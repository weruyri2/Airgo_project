<%@page import="com.air.board.iBoardBean"%>
<%@page import="com.air.board.iBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/write.css" rel="stylesheet">
</head>
<body>
<div id="map">
	<%
		// 글정보를 가져와서 페이지에 출력
		// BoardDAO 객체 생성
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		
		iBoardDAO bdao = new iBoardDAO();
		
		iBoardBean bb = bdao.getBoard(num);
		
		// 사용자 정보 변경
		// 변경된 정보를 DB에 저장 (pro페이지에서 처리)
	
	%>
	
<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />

<div class="content">

<p>게시글 수정</p>	
	
	 <form action="iupdatePro.jsp?pageNum=<%=pageNum%>" method="post">
	 <table class="tab"> 
	 <tr>
	 <td class="tc"> 글쓴이 </td>  <td><input type="text" name="name" value="<%=bb.getName()%>"> 	<input type="hidden" name="num" value="<%=num%>">	 </td>
	 	 </tr>
	 <tr>
	 <td class="tc">비밀번호 </td>   <td><input type="password" name="pass"> </td>
	 	 </tr>
	 <tr>
	 <td class="tc">제목 </td>   <td><input type="text" name="subject" value="<%=bb.getSubject() %>"> </td>
	 	 </tr>
	 <tr>
	 <td class="tc" colspan="2">내용 </td>
	</tr>
	<tr>
	<td colspan="2"> <textarea rows="10" cols="20" name="content" ><%=bb.getContent()%></textarea> <br>
	 </td>
	 <tr>
	 <td colspan="2"> <input type = "submit" value = "수정하기">
	</tr>
	
	 </table>
	 </form>

</div>

</div>
</div>	
</body>
</html>