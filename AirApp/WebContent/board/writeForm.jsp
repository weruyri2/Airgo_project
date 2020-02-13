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

<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />

	<form action="writePro.jsp" method="post">
	<fieldset class="fu">
	 <label>닉네임</label> <input type="text" name="name" >  <br>
	 <label>비밀번호 </label> <input type="password" name="pass" > <br>
	 <label>제목</label> <input type="text" name="subject"> <br>
	 <label>내용</label> <textarea rows="10" cols="20" name="content" ></textarea> <br>
	 
	 <input type = "submit" value = "등록">
	 
	</fieldset>
	</form>
	
</div>

	
</body>
</html>