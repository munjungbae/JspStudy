package co.kh.dev;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendPageServlet.do")
public class SendPageServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	//1. 페이지 이동방식 (redirect, forward) 방식 중 redirect방식
//    	System.out.println("SendPageServlet 요청 처리 시작");
//    	response.sendRedirect("destination.do");
    	
    	//2. 페이지 이동방식 (redirect, forward) 방식 중 forward방식
    	RequestDispatcher rd = request.getRequestDispatcher("destination.do");
    	request.setAttribute("name", "kdj");
    	rd.forward(request, response);
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}


}
