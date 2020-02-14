<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/write.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../inc/top.jsp"/>

<div class="main">	

<jsp:include page="../inc/bo_leftside.jsp" />
	

	
	<%
		//파라미터값 저장 (num,pageNum)
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");	
	%>
	
<div class="content">
	<p>게시글 삭제</p>
		<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
		 <table class="tab">
    	 <tr>
		<td> <input type="hidden" name="num" value="<%=num%>"> </td>
		</tr>
		<tr>
		<td>비밀번호</td> <td> <input type="password" name="pass"></td>
		</tr>
		<tr>
			<td colspan="2">  <input type="submit" value="삭제"> </td>
		</tr>

	</table>
    </form>	

	</div>

</div>


</body>
</html>