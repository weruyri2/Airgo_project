<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/joinForm.css" rel="stylesheet">
</head>
<body>


<div id="stylized" class="myform">
	<form action="joinPro.jsp" method="post" name="fr" id="join">
	<h1>회원가입</h1>
	<p>확인</p>
	<label>아이디</label>	<input type="text" name="id">
	<input type="button" name="btn" value="중복 확인" onclick="winopen();"><br> 
	<label>패스워드</label><input type="password" name="pass">
	<label>이름</label> <input type="text" name="name">
	<label>주민번호</label> <input type="text" name="jumin">
	<label>이메일</label> <input type="text" name="email">
	<label>전화번호</label> <input type="text" name="phone">
	<label>주소</label> <input type="text" name="address">
	

	<input type="submit" value="회원가입" id="submit">
	<input type="button" value="메인" onclick="location.href='../main/mainForm.jsp'">
	<div class="spacer"></div>
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