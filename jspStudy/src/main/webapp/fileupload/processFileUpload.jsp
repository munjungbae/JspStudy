<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//1.사용자가 전송할때 form에 enctype="multipart/form-data" 점검
request.setCharacterEncoding("UTF-8");
if (FileUpload.isMultipartContent(request)) {
	//2. 임시파일지정 
	String temporaryDir = "D:\temp";
	//3. MultipartRequest(request, 경로, 사이즈, 인코딩, 정책) 와 같은 기능
	DiskFileUpload fileUpload = new DiskFileUpload();
	//3-1. 경로
	fileUpload.setRepositoryPath(temporaryDir);
	//3-2. 사이즈
	fileUpload.setSizeMax(1024 * 1024);
	//3-3. 내부메모리에 둘어올 사이즈 한번에 100k 까지는 메모리에 저장
	fileUpload.setSizeThreshold(1024 * 100);
	/* FileItem의 리스트 */
	//4. Enumeration files = multi.getFileNames();
	//4. (String) files.nextElement();
	java.util.List fileItemList = fileUpload.parseRequest(request);
	for (int i = 0; i < fileItemList.size(); i++) {
		//4-1. 해당되는 파일 정보 가져오기
		FileItem fileItem = (FileItem) fileItemList.get(i);
		//4-2 fileItem이 폼파라미터에서 보내온 <input type="file" ... > 이 아닌것만 찾음
		if (fileItem.isFormField()) {// 파일 이외의 파라미터
	out.println("폼 파라미터:");
	out.println(fileItem.getFieldName() + " = " + fileItem.getString() + "<br>");
	//4-3 fileItem이 <input type="file" ... > 일 경우
		} else {
	out.println("파일:");
	out.println(
			fileItem.getFieldName() + " = " + fileItem.getString() + "(" + fileItem.getSize() + "bytes) <br>");
	//5. 메모리에 저장되어있는지 확인, 아닐 시 디스크에 저장되어있음.
	if (fileItem.isInMemory()) {
		out.println("메모리에 저장 <br>");
	} else {
		out.println("디스크에 저장 <br>");
	}
	// upload 의 위치를 알려준다.
	String filepath = application.getRealPath("upload");
	// 업로드한 파일이 사이즈가 있는 파일인 경우
	if (fileItem.getSize() > 0) {
		// D:\\temp\\orange.png ( 없다면 위치는 -1 )
		int idx = fileItem.getName().lastIndexOf("\\");
		if (idx == -1) {
			// D:/temp/orange.png ( 없다면 위치는 -1 )
			idx = fileItem.getName().lastIndexOf("/");
		}
		//subString() 지정위치만큼 잘라내기
		String fileName = fileItem.getName().substring(idx + 1);
		try {
			//filePath = String filepath = application.getRealPath("upload");
			//new file(upload/orange.png);
			File uploadedFile = new File(filepath, fileName);
			// D://temp/orange.png => /jspStudy/upload/orange.png 
			fileItem.write(uploadedFile);
		} catch (IOException ex) {
			// 예외 처리
		}
	} // 업로드한 파일이 존재하는 경우
		} // 파일인 경우
	} //end of for
} else { //1.사용자가 전송할때 form에 enctype="multipart/form-data"
	out.println("인코딩 타입이 multipart/form-data가 아님.");
}
%>