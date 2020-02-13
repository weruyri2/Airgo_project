<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/infoForm.css" rel="stylesheet">
<link href="../css/input.css" rel="stylesheet">
</head>
<body>

<%
	String id = (String)session.getAttribute("id");


%>

<jsp:include page="../inc/top.jsp"/>

<div class="main">

<jsp:include page="../inc/air_leftside.jsp" />

</div>


</body>
</html>