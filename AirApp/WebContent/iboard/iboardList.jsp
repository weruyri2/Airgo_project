<%@page import="com.air.board.iBoardBean"%>
<%@page import="com.air.board.iBoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/iboard.css" rel="stylesheet">
</head>
<body>

<div id="map">
	<%
		// 글목록 불러오기() (글이 있을떄만 가져오기)

		// 디비처리 객체
		iBoardDAO ibdao = new iBoardDAO();
		
		// 디비에 저장되어있는 글의 개수를 계산하는 메서드
		int cnt = ibdao.getBoardCount();
		
		//////////////////////////////
		//페이징 처리
		// 한페이지에서 보여줄 글의 개수를 설정
		int pageSize = 6;
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
		List iboardList = null;
		if( cnt !=0){
		//List boardList = bdao.getBoardListAll();
		iboardList = ibdao.getBoardList(startRow,pageSize);
		//최신글이 가장 위로 : re_ref 내림차순(desc), re_seq 오르차순(asc)
		//원하는 개수만큼씩 가져오기 : limit(시작행-1, 개수)
		
		
		}
		
	%>
	
		
<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />

<div class="content">
<h3>사진 게시판</h3>
		
	<%
// 		for(int i=0; i< boardList.size(); i++){
// 			BoardBean bb = (BoardBean)boardList.get(i);
	if(iboardList != null) {
			for(int i=0; i<iboardList.size(); i++){
				iBoardBean bb = (iBoardBean)iboardList.get(i);
		
	String conPath = request.getContextPath()+"/upload";
			
	System.out.println(conPath);		
				
	String imgPath = conPath+"\\"+bb.getFile();		
	
	
	if(bb.getFile()!=null){
		
	%>
	
	<table id="customers" class="bd<%=(i+1)%2%>">
	
	<tr>		
	<td class="sub" colspan="3">
		<a href="icontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
	<img src="<%=imgPath%>" width=400 height=300></a>
	</td>
	</tr>
	
	<tr class="2r">
	<td class="2td" colspan="3" height=52><a href="icontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
	<p><%=bb.getSubject()%><p></a></td>
	</tr>
		
	<tr class="3r">
	<td><%=bb.getName()%></td>
	<td><%=bb.getDate() %></td>
	<td><%=bb.getReadcount() %></td>
	</tr>	
	</table>
	<% 	}
			}
		} %>
		
	<table class="end">
	<tr>
	<td colspan="6">
		<div class="paging">	
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
				<a href="iboardList.jsp?pageNum=1">[처음으로]</a>
				<%
			}
			
			
			// 이전
			if(startPage > pageBlock) {
				%>
				<a href="iboardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>			
				<%
			}
			
			// 1.....10 11...20 21...30
			for(int i=startPage; i<=endPage; i++){
				%>
					<a href="iboardList.jsp?pageNum=<%=i%>">|<%=i %>| </a>			
				<%
				
			}
			// 다음
			if(endPage < pageCount) {
				%>		
				<a href="iboardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음] </a>
				<%
			}
		}
		//////////////////////////////////////////////	
		%>
		
		</div>	
	</td>
	</tr>
	
	<tr>
		<td colspan="6">
		<input type="button" value="글쓰기" 
			onclick="location.href='iwriteForm.jsp'">
		</td>
	</tr>	
	</table>
	
</div>	
</div>
	
</div>	
</body>
</html>