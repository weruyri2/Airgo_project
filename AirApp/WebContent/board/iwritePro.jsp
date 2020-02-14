<%@page import="com.air.board.BoardDAO"%>
<%@page import="com.air.board.BoardBean"%>
<%@page import="java.util.Enumeration"%>
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

	<%


		String fileName = "";
		String OFileName = "";
		String imgName = "";
	
		String up = "/upload";
		
		// 파일을 업로드할 폴더 (물리적 위치)
		// => "upload"폴더를 사용해서 가상경로로 사용
		String realPath = request.getRealPath("/upload");
		String conPath = request.getContextPath()+"/upload";
		//게시판글 저장
		System.out.println("물리적 경로 : " + realPath);
		
		//파일 최대크기
		int maxSize = 100*1024*1024; // 100MB
		
		// 파일 업로드 처리객체 생성
		MultipartRequest multi = new MultipartRequest(
					request,
					realPath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);		
			
		// 게시판글 저장
		// 글쓴이, 비밀번호, 제목, 내용, 첨부파일 => 전달받아서 DB로 전달
		
		// 자바빈 객체 생성
		BoardBean bb = new BoardBean();
		
		bb.setName(multi.getParameter("name"));
		bb.setPass(multi.getParameter("pass"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		//bb.setFile(multi.getParameter("file"));
		// upload 폴더에 올라가있는 파일의 이름
		bb.setFile(multi.getFilesystemName("imgfile"));
				
		fileName = multi.getParameter("fileName");
		
		imgName = multi.getParameter("imgName");
		
		// 다수의 파일 업로드시
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();
		fileName = multi.getFilesystemName(file1);
		OFileName = multi.getOriginalFileName(file1);
//		파일이 여러개일 경우 추가해야함.
//			String file2 = (String)files.nextElement();
//			fileName = multi.getFilesystemName(file2);
//			OFileName = multi.getOriginalFileName(file2);
		
		System.out.println("파일 이름 : " + fileName);		
		System.out.println("파일 이름 원본 : " + OFileName);		
		
		
		
		
		
		System.out.println("파일 업로드 중 정보 확인 : " + bb.toString());
		System.out.println("upload에 저장된 파일이름 : " + multi.getFilesystemName("file"));
		System.out.println("사용자 올린 원본 이름 파일: " + multi.getOriginalFileName("file"));
		
		bb.setIp(request.getRemoteAddr());
		///////////////////////////////////////
		//디비 처리객체 생성
		
		BoardDAO bdao = new BoardDAO();
		// 메서드 호출 : insertBoard(bb);
		bdao.insertBoard(bb);
		
		// 페이지 이동
		String imgPath = conPath+"\\"+fileName;
	%>
		<img src="<%=imgPath%>">
	
	<%=imgPath %>
</body>
</html>