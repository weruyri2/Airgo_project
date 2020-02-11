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
	String airname = (String)request.getParameter("airname");

%>

<article id="center">
 <p>main content</p>
	<h2> 비행기 삭제 </h2>
	<fieldset>
	  <legend> 정보 입력 </legend>
	<form action="air_deletePro.jsp" method="post">
	     비행기명 : <input type="text" name="airname" value="<%=airname %>" ><br>
	     암호값 : <input type="password" name="pass"><br>
	     <input type="submit" value="삭제">
	  </form>	
	</fieldset>
</article>

</body>
</html>