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
<title>AIRGO</title>
<link href="../css/leftside.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
</head>

<body>

<div id="map">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->

<article>
<!-- 메인이미지 들어가는곳 -->
<div class="mainimg">
<img src="../images/main_img2.jpg" height=450 width=1100 >
</div>
<!-- 메인이미지 들어가는곳 -->

<%

	BoardDAO bdao = new BoardDAO();

	int cnt = bdao.getBoardCount();
	
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = currentPage * pageSize;

	List boardList = null;
	if( cnt !=0){
		boardList = bdao.getBoardList(startRow,pageSize);
	}
%>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="content">

	<div class="tripBo">
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
	<a href="../board/content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
			<%=bb.getSubject() %></a>			
	</td>
	<td class="name"><%=bb.getName()%></td>	
	</tr>
	
	<% 	}
	} %>
	
	</table>
	</div>
	
	<div class="imgBo">
	<p>사진 게시판</p>
	
	<ul class="ibul">	

	<%

		iBoardDAO ibdao = new iBoardDAO();

		int icnt = ibdao.getBoardCount();

		int ipageSize = 4;

		String ipageNum = request.getParameter("ipageNum");
		if(ipageNum == null) {
			ipageNum = "1";
		}

		int icurrentPage = Integer.parseInt(ipageNum);
		
		int istartRow = (icurrentPage-1)*ipageSize+1;
		int iendRow = icurrentPage * ipageSize;

		List iboardList = null;
		if( icnt !=0){
			iboardList = ibdao.getBoardList(istartRow,ipageSize);
		}

	if(iboardList != null) {
			for(int i=0; i<iboardList.size(); i++){
				iBoardBean ibb = (iBoardBean)iboardList.get(i);
		
	String iconPath = request.getContextPath()+"/upload";
			
	System.out.println(iconPath);		
				
	String imgPath = iconPath+"\\"+ibb.getFile();		
	
	%>
	
	<li class="ibli">
	 <div class="image">
	 	<a href="../iboard/icontent.jsp?num=<%=ibb.getNum()%>&pageNum=<%=pageNum%>" >
		<img src="<%=imgPath%>" width=260  height=130></a>
	 </div>
	 <div class="desc">
		<a href="../iboard/icontent.jsp?num=<%=ibb.getNum()%>&pageNum=<%=pageNum%>" >
		<%=ibb.getSubject()%>
		[<%=ibb.getReadcount() %>] </a>
	 </div>	
	</li>
	<% 	}
	}
	%>
	</ul>
	</div>
</div>
</article>


<!-- 아래 컨텐츠 들어가는 곳 -->
<div class="clear">
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>


</div>
</body>
</html>