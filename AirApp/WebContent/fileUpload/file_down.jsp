<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/file_down.jsp</h1>

	<%
		// 전달된 파라미터 값 저장
		
		String filename = request.getParameter("file_name");
	
		// 서버에 업로드 했던 위치 (가상 폴더명)
	
		String savePath = "upload";
		
		ServletContext context = getServletContext();
		String DownloadPath = context.getRealPath(savePath);
		// 가상의 폴더(upload) 실제 서버에 위치하고 있는 물리적 경로를 가져오기
		
		System.out.println(" 다운로드(업) 경로 : " +DownloadPath);
		
		// 다운로드 처리할 파일의 전체 경로
		String FilePath = DownloadPath+"\\"+filename;
		
		// 파일을 한번에 읽고 쓰기 할 수 있는 배열
		byte[] b = new byte[4096];
		
		//파일 읽어오는 처리 (파일처리를 위한 통로 개설)		
		FileInputStream fis = new FileInputStream(FilePath);
		
		//MIME타입정보를 불러오기
		String MimeType = getServletContext().getMimeType(FilePath);
		//MIME타입 : 클라이언트에게 전송된 문서으 ㅣ다양성을 알려주기 위한 매커니즘.
		// 웹에서는 파일 확장자의 의미가 거의 없음. 각 페이지에서 처리할때 올바른 타입으로 
		// 사용될수 있도록 지정(MIME)
		
		if(MimeType == null) {
			MimeType = "application/octect-stream";
		}
		//MimeType 값이 없을 경우 "application/octect-stream" 값으로 기본값 설정
		// https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types
		
		System.out.println(" MimeType : " + MimeType);
		
		response.setContentType(MimeType);
		// => 응답할 데이터의 Mime타입을 다운로드할 파일의 Mime 타입으로 설정
				
		// 사용자의 브라우저따라서 처리를 구분
		// Internet Explorer 인지 판단
		
		String agent = request.getHeader("User-Agent");
		
		boolean ieBrowser = 
		(agent.indexOf("MSIE") > -1 || (agent.indexOf("Trident") > -1));
		
		if(ieBrowser){ //IE
			filename = URLEncoder.encode(filename,"UTF-8").replaceAll("\\+","%20");
			//IE의 경우 다운로드시 한글파일 꺠짐.
			//공백문자가 "+"로 변경됨 -> 다시 공백문자("%20")=스페이스 로 변경
		}else { // IE 아닌경우
			filename
			= new String(filename.getBytes("UTF-8"), "iso-8859-1");
		}
		
		
		// 브라우저에서도 지금 처리한 파일의 형태가 다운로드의 형태로 처리되도록 준비
		response.setHeader("Content-Disposition", "attachment; filename="+filename);
		// =>항상 다운로드 처리 "Content-Disposition" 속성의 값이 attachment일떄
				
		// 바이트 기반의 출력 스트림 생성
		ServletOutputStream out2 = response.getOutputStream();
		
		//파일 출력
		int numRead=0;
		
		while( (numRead = fis.read(b, 0, b.length)) != -1 ){
			out2.write(b, 0, numRead);
		}
		
		out2.flush(); // 버퍼의 빈칸을 채워서 전달
		out2.close();
		fis.close();
		
		
		
	%>



</body>
</html>