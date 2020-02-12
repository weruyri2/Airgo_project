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

<label>

	<form action="loginPro.jsp" method="post" name="loginform">
	<fieldset>
	<legend>로그인</legend>
	<div class="text">아이디</div>  <input type="text" name="id"> <br>
	<div class="text">패스워드</div>  <input type="password" name="pass"> <br>
	<div class="row">
	<input type="submit" value="로그인" id="submit">
	</div>
	<div class="row">
	<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
	<input type="button" value="메인" onclick="location.href='../main/mainForm.jsp'"> 
	</div>
	
	</fieldset>
	</form>	
		
</label>



</body>
</html>