<%@page import="com.air.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/joincheck.css" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("userid");
		String jumin = request.getParameter("userjumin");
		String email = request.getParameter("useremail");
	
		MemberDAO mdao = new MemberDAO();
		
		int check = mdao.joinIdCheck(id);
		int check2 = mdao.joinEmailCheck(email);
		int check3 = mdao.joinJuminCheck(jumin);
	
	%>
	
	<br>
	<fieldset>
		<legend>중복 확인</legend>
		<form action="joinIdCheck.jsp" method="post" name="idfr">
		<label> 아이디 </label> <input type="text" name="userid" value="<%=id %>" > <br>
		 	<input type="submit" value="중복체크">
		</form>
	</fieldset>
	
	<%
	
	if(check == 1){
		out.print("<h3> 사용중인 아이디입니다. </h3>");
	}else{
		out.print("<h3> 중복 아이디가 아닙니다. </h3>");
		%>
			<input type="button" value="아이디 사용하기 " onclick="setId();">
		<%
	}
	
	if(check2 == 1){
		out.print("<h3> 사용중인 이메일입니다. </h3>");
	}
	if(check3 == 1){
		out.print("<h3> 사용중인 주민번호입니다. </h3>");
	}
	
	
	
	%>
	
	

</body>

	<script type="text/javascript">
	function setId() {
		
		var formId2 = document.idfr.userid.value;
		
		if(formId2 == ""){
			alert("id정보를 입력하시오. ");
			document.fr.id.focus();
			return false;
		}else if( !(4<=formId2.length && formId2.length<=12) ){
			alert("아이디의 길이가 4~12이어야 합니다.");
			document.fr.id.focus();
		}
		
		
		opener.document.fr.id.value = document.idfr.userid.value;
		window.close();
	}
	</script>

</html>