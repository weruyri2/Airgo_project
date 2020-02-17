<%@page import="com.air.board.iBoardBean"%>
<%@page import="com.air.board.iBoardDAO"%>
<%@page import="com.air.board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.air.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/leftside.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
</head>

<body>

<div id="map">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<article>

<div class="img">
<img src="../images/main_img2.jpg" height=450 width=1100 >
</div>

<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<%
// 글목록 불러오기() (글이 있을떄만 가져오기)

// 디비처리 객체
	BoardDAO bdao = new BoardDAO();

	int cnt = bdao.getBoardCount();
	
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

	List boardList = null;
	if( cnt !=0){
		boardList = bdao.getBoardList(startRow,pageSize);
	}
%>

<div class="content">

	<div class="le">
	<p>여행 게시판</p>
	<table id="customers" class="bd">
	<tr class="one">
	<td class="sub">Subject</td>
	<td class="name">Name</td>
	</tr>

	
	<%
	
	if(boardList != null) {
			for(int i=0; i<boardList.size(); i++){
				BoardBean bb = (BoardBean)boardList.get(i);		

	%>
	
	<tr>	
	<td class="sub">
	
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
	
	<a href="../board/content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<%=bb.getSubject() %></a>
			
	</td>

	<td class="name"><%=bb.getName()%></td>	

	</tr>
	
	<% 	}
	} %>
	
	</table>
	</div>
	
	
<!-- 	사진 게시판 --!>
	<%

		iBoardDAO ibdao = new iBoardDAO();

		int icnt = ibdao.getBoardCount();

		int ipageSize = 4;
		// 지금 위치하는 페이지의 정보를 저장
		String ipageNum = request.getParameter("ipageNum");
		if(ipageNum == null) {
			ipageNum = "1";
		}
		
		// 시작 행 계산 1.... 11..... 21..... 31... (pageNum,pageSize)
		int icurrentPage = Integer.parseInt(pageNum);
		
		int istartRow = (currentPage-1)*pageSize+1;
		int iendRow = currentPage * pageSize;
		////////////////////////////////

		List iboardList = null;
		if( cnt !=0){
			iboardList = ibdao.getBoardList(istartRow,ipageSize);
		}
	%>
	
	<div class="ri">
	<p>사진 게시판</p>
		
	<%

	if(iboardList != null) {
			for(int i=0; i<iboardList.size(); i++){
				iBoardBean ibb = (iBoardBean)iboardList.get(i);
		
	String iconPath = request.getContextPath()+"/upload";
			
	System.out.println(iconPath);		
				
	String imgPath = iconPath+"\\"+ibb.getFile();		
	
	
	if(ibb.getFile()!=null){
		
	%>
	
	<table id="customers" class="bd<%=(i+1)%2%>" width=250 height=180>
	
	<tr>		
	<td class="sub" colspan="3">
		<a href="../iboard/icontent.jsp?num=<%=ibb.getNum()%>&pageNum=<%=pageNum%>">
	<img src="<%=imgPath%>" width=240 height=140></a>
	</td>
	</tr>
	
	<tr class="2r">
	<td colspan="3"><%=ibb.getSubject()%> <%=i+1%></td>
	</tr>	
	<tr class="3r">
	<td><%=ibb.getName()%></td>
	<td><%=ibb.getDate() %></td>
	<td><%=ibb.getReadcount() %></td>
	</tr>	
	</table>
	<% 	}
			}
		} %>
</div>

</article>


<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>