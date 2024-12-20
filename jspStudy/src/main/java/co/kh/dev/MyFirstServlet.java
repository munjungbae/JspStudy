package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet(name = "myFirstServlet", urlPatterns = { "/myFirstServlet" })
public class MyFirstServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	//디폴트 생성자
    public MyFirstServlet() {
        super();
        System.out.println("한번만 초기화");
    }

    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("서비스 RUNNING");
    	doGet(request, response);
    	//super.service(request, response);
//    	requestTest(request, response);

	}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	System.out.println("Request RUNNING");
    	//1. 사용자 정보를 request로 받아야 함. 없으니 생략
    	
    	//2. 데이터 베이스 연동 CURD진행
    	
    	//3-1. 서버에서 클라이언트한테 문자를 보내기 위한 문자셋 진행 (response)
    	response.setCharacterEncoding("UTF-8");
    	
    	//3-2. 브라우저에게 (text/html;charset=UTF-8)
    	response.setContentType("text/html;charset=UTF-8");
    	
    	//3-3 출력 스트림을 결정한다.
    	//response.getOutputStream(); 1byte
    	//response.getWriter(); 2byte
    	PrintWriter out = response.getWriter();
    	out.println("<html>");
    	out.println("<head>");
    	out.println("<meta charset=\"UTF-8\">");
    	out.println("<title>Insert title here</title>");
    	out.println("</head>");
    	out.println("<body>");
    	out.println("<h1>jsp study</h1>");
    	out.println(new java.util.Date());
    	out.println("</body>");
    	out.println("</html>");
    	out.flush();
		
	}
}
