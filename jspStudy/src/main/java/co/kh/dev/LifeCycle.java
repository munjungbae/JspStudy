package co.kh.dev;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle.do")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//디폴트 생성자
	public LifeCycle() {
		super();
		System.out.println("LifeCycle 디폴트 생성자.");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("LifeCycle init()호출.");
	}

	public void destroy() {
		System.out.println("LifeCycle destroy() 호출");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LifeCycle Service() 호출.");
		doPost(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LifeCycle doGet()호출.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LifeCycle doPost()호출.");
		doGet(request, response);
	}

}
