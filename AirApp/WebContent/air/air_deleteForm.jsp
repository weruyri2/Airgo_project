<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/input.css" rel="stylesheet">
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>

<%
	String airname = (String)request.getParameter("airname");

%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/air_leftside.jsp" />

<div id="updiv" class="upclass">
	<form action="air_deletePro.jsp" method="post">
	<fieldset class="fd">
	   <label>비행기 </label> <input type="text" name="airname" value="<%=airname %>" ><br>
	   <label> 암호값 </label> <input type="password" name="pass"><br>
	     <input type="submit" value="삭제"> 
	</fieldset>
	
	</form>
	</div>

  
</div>
</body>
</html>