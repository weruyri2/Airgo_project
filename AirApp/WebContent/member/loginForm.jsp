<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/loginForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
</head>
<body>

<div id="lodiv" class="loclass">

	<form action="loginPro.jsp" method="post" name="loginform">
	<fieldset class="fd">
	<legend>LOGIN</legend>
	<label>ID </label> <br> <input type="text" placeholder="Userid" name="id"> <br><br>
	<label>PASSWORD </label> <br> <input type="password" placeholder="Password" name="pass"> <br><br>

	<input type="submit" value="LOGIN" id="submit"> <br><br>
	
	<div class="a">
	<a href="joinForm.jsp">회원가입</a> / <a href="../main/mainForm.jsp">메인이동</a>
	</div>
	
	</fieldset>
	</form>	
		
</div>



</body>
</html>