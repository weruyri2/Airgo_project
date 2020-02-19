<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
<link href="../css/infoForm.css" rel="stylesheet">
</head>
<body>

<div id="map">
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");

	if(id==null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요합니다.");
				location.href="../member/loginForm.jsp";
			</script>
		<%
	}	
	
	Date now = new Date(new java.util.Date().getTime());

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(now);
	
	response.sendRedirect("infoForm.jsp");
	
%>

<jsp:include page="../inc/top.jsp"/>


<div class="main">	

<jsp:include page="../inc/leftside.jsp" />

</div>

</div>
</body>
</html>