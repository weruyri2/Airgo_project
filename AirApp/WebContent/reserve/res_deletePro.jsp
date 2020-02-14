<%@page import="com.air.reserve.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String) session.getAttribute("id");

	String resname = request.getParameter("resname");
	String pass = request.getParameter("pass");

%>

<jsp:useBean id="rb" class="com.air.reserve.ReserveBean" />
<jsp:setProperty property="*" name="rb"/>

<%
	System.out.println(id+resname+pass);

	System.out.println("삭제할 정보 : "+rb);

	ReserveDAO rdao = new ReserveDAO();
	
	int check = rdao.deleteReserve(resname, id, pass);
	
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("예약 삭제 완료");
		location.href="res_info.jsp"
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
	}else{
		System.out.println(" 파라미터값 오류 !");
		%>
		<script type="text/javascript">
		alert("예약 삭제 실패 !");
		history.back();
		</script>
		<%
	}


%>














</body>
</html>