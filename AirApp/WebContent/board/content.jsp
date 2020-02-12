<%@page import="com.air.board.BoardBean"%>
<%@page import="com.air.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/table.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/bo_leftside.jsp" />


<%
//*페이지 이동시 전달되는 파라미터값 있을경우 항상 먼저 저장(처리)해야한다.
//~/content.jsp?num=5&pageNum=2
//파라미터값 저장 num(int), pageNum(String)

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

//DB 처리 객체 BoardDAO 생성
BoardDAO bdao = new BoardDAO();

//게시판 글의 조회수를 1증가
bdao.updateReadCount(num);

BoardBean bb = bdao.getBoard(num);
//num에 해당하는 글정보를 가져오는 메서드

%>

<article id="center">
<p>main content</p>

<h1>글 본문 내용 보기</h1>

	<table border="1" id="customers">
	<tr>
	  <td>글번호</td><td><%=bb.getNum() %></td>
	  <td>글 제목</td><td colspan="3"><%=bb.getSubject() %></td>
	</tr>
	<tr>
	  <td>글쓴이</td><td><%=bb.getName() %></td>
	  <td>작성일</td><td><%=bb.getDate() %></td>
	  <td>조회수</td><td><%=bb.getReadcount() %></td>
	</tr>	
	<tr>
	<td>첨부파일</td><td colspan="5"><%=bb.getFile() %></td>
	</tr>
	
	</table>
	
	<table border="1" id="customers">
	
	<tr>
	<td >내용</td><td colspan="5" align="char" height="auto" style="word-break:break-all;" valign="top" ><%=bb.getContent() %></td>
	</tr>
	
	</table>
	
	<table border="1" id="customers">
	
	<tr>
	<td colspan="6" align="right">
		<input type="button" value="수정하기" 
			onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';"
			>
		<input type="button" value="삭제하기"
			onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';"
			>
		<input type="button" value="답글쓰기"
			onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>&re_lev=<%=bb.getRe_lev()%>&re_ref=<%=bb.getRe_ref()%>&re_seq=<%=bb.getRe_seq()%>';"
		>
		<input type="button" value="목록보기" 
		onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';">
		</td>
	</tr>
	
</table>
	
</article>


	
</body>
</html>