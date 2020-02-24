<%@page import="com.air.airplane.AirplaneDAO"%>
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

	String airname = request.getParameter("airname");

%>

<jsp:useBean id="ab" class="com.air.airplane.AirplaneBean" />
<jsp:setProperty property="*" name="ab"/>

<%
	System.out.println("삭제할 정보 : "+ab);

	AirplaneDAO adao = new AirplaneDAO();
	
	int check = adao.deleteAirplane(airname);
	
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("비행기 삭제 완료");
		location.href="air_info.jsp"
		</script>
		<%
	}else{
		System.out.println("참조 값 확인 !");
		%>
		<script type="text/javascript">
		alert("비행기 삭제 실패 !");
		history.back();
		</script>
		<%
	}


%>

</body>
</html>