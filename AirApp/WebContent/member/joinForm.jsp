<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/joinForm.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
</head>
<body>


<div id="lodiv" class="loclass">

	<form action="joinPro.jsp" method="post" name="fr" id="join">
	<fieldset class="fd">
	<legend>Sign Up</legend>
	<label>아이디</label>	<input type="text" name="id" onkeyup="winopen();"> <br>
<!-- 	<input type="button" name="btn" value="중복 확인" onclick="winopen();"> <br>  -->
	<label>패스워드</label> <input type="password" name="pass"> <br>
	<label>이름</label> <input type="text" name="name"> <br>
	<label>주민번호</label> <input type="text" name="jumin"> <br>
	<label>이메일</label> <input type="text" name="email"> <br>
	<label>전화번호</label> <input type="text" name="phone"> <br>
	<label>주소</label> <input type="text" name="address"> <br>
	

	<input type="submit" value="회원가입" id="submit"> <br><br>
	
	<div class="a">
	<a href="loginForm.jsp">로그인</a> / <a href="../main/mainForm.jsp">메인이동</a>
	</div>
	
	</fieldset>
	</form>
	
</div>



</body>

	<script type="text/javascript">
		function winopen() {
			if(document.fr.id.value == ""){
				alert("id정보를 입력하시오. ");
				document.fr.id.focus();
				return;
			}
			var formId = document.fr.id.value;
			
			window.open("joinIdCheck.jsp?userid="+formId,"","width=500,height=250");
			
		}
	</script>

</html>