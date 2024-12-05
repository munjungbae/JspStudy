package co.kh.dev;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/destination.do")
public class DestinationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// SendRedirect 요청을 받았기 때문에 (1. 요청정보확인 2. 데이터베이스 3. 화면출력)
		String name = (String) request.getAttribute("name");
		// 3. 화면출력
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Destination</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1> Destination Servlet 입니다</h1>");
			out.println("<p> name = " + name +"</p>");
			out.println("</body>");
			out.println("</html>");
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
