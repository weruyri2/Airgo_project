<%@page import="com.air.board.BoardBean"%>
<%@page import="com.air.board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		// 글목록 불러오기() (글이 있을떄만 가져오기)

		// 디비처리 객체
		BoardDAO bdao = new BoardDAO();
		
		// 디비에 저장되어있는 글의 개수를 계산하는 메서드
		int cnt = bdao.getBoardCount();
		
		//////////////////////////////
		//페이징 처리
		// 한페이지에서 보여줄 글의 개수를 설정
		int pageSize = 10;
		// 지금 위치하는 페이지의 정보를 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		// 시작 행 계산 1.... 11..... 21..... 31... (pageNum,pageSize)
		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage * pageSize;
		
		
		//////////////////////////////
		
		//ArrayList<BoardBean> boardList = bdao.getBoardList();
		List boardList = null;
		if( cnt !=0){
		//List boardList = bdao.getBoardListAll();
		boardList = bdao.getBoardList(startRow,pageSize);
		//최신글이 가장 위로 : re_ref 내림차순(desc), re_seq 오르차순(asc)
		//원하는 개수만큼씩 가져오기 : limit(시작행-1, 개수)
		
		
		}
	%>
	
<article id="center">
<p>main content</p>
<h3> 게시판 글 목록[ 전체 개수 : <%=cnt %> 개 ]</h3>
	
	<table border="1" id="customers">
	<tr>
	<td>글번호</td>
	<td>글제목</td>
	<td>글쓴이</td>
	<td>작성 날짜</td>
	<td>조회수</td>
	<td>IP</td>
	</tr>

	
	<%
// 		for(int i=0; i< boardList.size(); i++){
// 			BoardBean bb = (BoardBean)boardList.get(i);
	if(boardList != null) {
			for(int i=0; i<boardList.size(); i++){
				BoardBean bb = (BoardBean)boardList.get(i);
		
			

	%>
	
	<tr>
	<td><%=bb.getNum()%></td>
	
		
	<td>
	
	<%	//답글 들여쓰기 일반글 들여쓰기 X. 답글 level값에 따라서 들여쓰기 변경 
	
	int wid = 0;
	int k = bb.getRe_lev();
	
	if(k!=0){ 
		wid = 10*k;
		%>
		<img src="level.gif" height="15" width="<%=wid%>">
		<img src="re.gif">
		<%
	}
	%>
	
	<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<%=bb.getSubject() %></a>

	<td><%=bb.getName()%></td>	
	<td><%=bb.getDate() %></td>
	<td><%=bb.getReadcount() %></td>
	<td><%=bb.getIp() %></td>
	</tr>	
	
	<% 	}
		} %>
	
	</table>	

<div id="paging" align="center">	
	<%
	///////////////////////////////////////////////
	//페이징 처리
	// 이전, 1,2,3,.........10, 다음
	
	if(cnt != 0){
		// 전체 페이지수 계산
		// ex) 글 50개 / 페이지당 10씩 출력 => 5페이지
		// ex) 글 56개 / 페이지당 10씩 출력 => 6페이지
		int pageCount = cnt / pageSize + (cnt%pageSize == 0? 0:1);
		
		// 한 화면에 보여줄 페이지 번호 개수
		int pageBlock = 5;
		
		// 시작페이지 번호 계산 1~10 => 1, 11~20 => 11, 21~30=>21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
				
		// 끝 페이지 번호 계산
		int endPage = startPage + pageBlock-1;
		
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		if(startPage > 1) {
			%>
			<a href="boardList.jsp?pageNum=1">[처음으로]</a>
			<%
		}
		
		
		// 이전
		if(startPage > pageBlock) {
			%>
			<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>			
			<%
		}
		
		// 1.....10 11...20 21...30
		for(int i=startPage; i<=endPage; i++){
			%>
				<a href="boardList.jsp?pageNum=<%=i%>">[<%=i %>] </a>			
			<%
			
		}
		// 다음
		if(endPage < pageCount) {
			%>		
			<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음] </a>
			<%
		}
	}
	//////////////////////////////////////////////	
	%>
</div>	
	
</article>

<aside id="right">
 right - banner
</aside>
	
	
</body>
</html>