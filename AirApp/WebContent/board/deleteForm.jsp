<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/input.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/bo_leftside.jsp" />
	
<h3> 게시판 글삭제 </h3>
	
	<%
		//파라미터값 저장 (num,pageNum)
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");	
	%>
	
<article id="center">
<p>main content</p>	
	
	<fieldset>
		<legend> 글삭제 </legend>
		<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<div class="text">비밀번호</div>  <input type="password" name="pass"><br>
		<input type="submit" value="삭제하기">
		</form>
	</fieldset>
	
</article>


<aside id="right">
 right - banner
</aside>

</body>
</html>