<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
String uploadPath = request.getRealPath("upload"); // 1. upload 경로지정 
int size = 10 * 1024 * 1024; // 2. 파일 사이즈 조절 
String name = "";
String subject = "";
String filename1 = "";
String filename2 = "";
String origfilename1 = "";
String origfilename2 = "";
try {
	//3. MultipartRequest 객체 생성, 매개변수 (request, 업로드 위치, 최대 사이즈, 인코딩 방식, 이름 정책) 설정.
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy()); // new DefaultFileRenamePolicy() 정책사용

	name = multi.getParameter("name");
	subject = multi.getParameter("subject");
	//4. Enumeration files = multi.getFileNames();
	Enumeration files = multi.getFileNames();
	String file1 = (String) files.nextElement(); //String file1 = fileName2
	//5. 업로드된 서버에서 저장된 이름을 가져온다.
	filename1 = multi.getFilesystemName(file1); //(DefaultFileRenamePolicy정책으로 인해) 이름+번호++
	//6. 업로드된 사용자가 사용한 진짜 이름을 가져온다.
	origfilename1 = multi.getOriginalFileName(file1);

	String file2 = (String) files.nextElement(); //String file2 = fileName1
	filename2 = multi.getFilesystemName(file2);
	origfilename2 = multi.getOriginalFileName(file2);

	System.out.println(file1);
	System.out.println(file2);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<html>
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> <input
			type="hidden" name="subject" value="<%=subject%>"> <input
			type="hidden" name="filename1" value="<%=filename1%>"> <input
			type="hidden" name="filename2" value="<%=filename2%>"> <input
			type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드
		페이지 이동</a>
</body>
</html>