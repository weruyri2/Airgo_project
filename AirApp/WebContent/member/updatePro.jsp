<%@page import="com.air.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>WebContent/member/updatePro.jsp</h1>
 
 <%
 	// 세션값 처리
 	String id =(String) session.getAttribute("id");
     if(id == null){
    	 response.sendRedirect("loginForm.jsp");
     }
 	//한굴처리
 	request.setCharacterEncoding("UTF-8");
 	//전달되는 파라미터를 저장(액션태그 사용 자바빈의 형태로 저장)
 	%>
 	<jsp:useBean id="mb" class="com.air.member.MemberBean" />
 	<jsp:setProperty property="*" name="mb"/>
 	<%
 	System.out.println("수정할 정보 : " + mb);
 	
 	//전달받은 정보를 DB에 가져가서 수정
 	//MemberDAO 객체 생성
 	MemberDAO mdao = new MemberDAO();
 	
 	int check = mdao.updateMember(mb);
 	
	System.out.println("check : " +check);
	
	if(check == 1){
		System.out.println("정보 수정 완료");
		%>
		<script type="text/javascript">
		alert("정보 수정 완료");
		location.href="../member/memain.jsp"
		</script>
		<%
	}else if(check == 0){
		System.out.println("비밀 번호 오류 !");
		%>
		<script type="text/javascript">
		alert("비밀 번호 오류 !");
		history.back();
		</script>
		<%
	}else {
		//check == -1
		System.out.println("수정 없음 !");
		%>
		<script type="text/javascript">
		alert("비밀번호 없음 !");
		history.back();
		</script>	
		<%	
	}
	
 	//UpdateMember(수정할 자바빈객체)
	
 	//정수형타입 결과 0, 1, -1
 	//1 : 수정완료 - main페이지이동
 	//0 : 비밀번호 오류 - 뒤로가기
 	//-1 : 아이디 없음 - 뒤로가기
 
	
	
	
	
	
			

	//a링크 사용 main페이지 이동
%>
</body>
</html>