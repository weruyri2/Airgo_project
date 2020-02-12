<%@page import="java.util.Enumeration"%>
<%@page import="com.air.board.BoardDAO"%>
<%@page import="com.air.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/fileUploadPro.jsp</h1>
	
	<!-- 가상경로 upload 폴더 사용해서 파일 업로드 처리 -->
		
	<%
	
	
	String name = "";
	String subject = "";
	String fileName = "";
	String OFileName = "";

	try{
		
	String realPath = request.getRealPath("/upload");
	//게시판글 저장
	System.out.println("물리적 경로 : " + realPath);
	
	//파일 최대크기
	int maxSize = 10*1024*1024; // 10MB
	
	// 파일 업로드 처리객체 생성
	MultipartRequest multi = new MultipartRequest(
				request,
				realPath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);		
		
	// 파일 업로드 끝
	////////////////////////////////////////////

	// 전달된 정보 (이름, 제목, 파일)
	name = multi.getParameter("name");
	subject = multi.getParameter("subject");
	fileName = multi.getParameter("fileName");
	
	// 다수의 파일 업로드시
	Enumeration files = multi.getFileNames();
	
	String file1 = (String)files.nextElement();
	fileName = multi.getFilesystemName(file1);
	OFileName = multi.getOriginalFileName(file1);
//	파일이 여러개일 경우 추가해야함.
//		String file2 = (String)files.nextElement();
//		fileName = multi.getFilesystemName(file2);
//		OFileName = multi.getOriginalFileName(file2);
	
	System.out.println("파일 이름 : " + fileName);		
	System.out.println("파일 이름 원본 : " + OFileName);		
	System.out.println("이름 : " + name);		
	System.out.println("제목 : " + subject);	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	%>
	
	<h1> 업로드 성공! </h1>
		<form action="fileCheck.jsp" method="post" name="fm">
			<input type="hidden" name="name" value="<%=name%>">
			<input type="hidden" name="subject" value="<%=subject%>">
			<input type="hidden" name="fileName" value="<%=fileName%>">
			<input type="hidden" name="OFileName" value="<%=OFileName%>">
		</form>
	
	<h2>
		<a href="#" onclick="javascript:fm.submit();"> 업로드 성공확인 & 다운로드 페이지 이동</a>
		<!-- # 자기자신 페이지 호출 -->
	</h2>
	
	
	
</body>
</html>