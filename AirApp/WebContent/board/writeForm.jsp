<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<jsp:include page="../inc/bo_leftside.jsp" />


<article id="center">
<p>main content</p>

<h3> 게시판 글쓰기 (정보 입력)</h3>
	
	<fieldset>
	 <legend> 글쓰기 </legend>
	 <form action="writePro.jsp" method="post">
	 글쓴이 : <input type="text" name="name"> <br>
	 비밀번호 : <input type="password" name="pass"> <br>
	 제목 : <input type="text" name="subject"> <br>
	 내용 : <br> <textarea rows="10" cols="20" name="content"></textarea> <br>
	 
	 <input type = "submit" value = "글쓰기">
	 
	 </form>
	</fieldset>
	
</article>

<aside id="right">
 right - banner
</aside>

	
</body>
</html>