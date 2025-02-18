package com.kh.dev.student.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dev.student.action.Action;

@WebServlet("*.do")
public class MemControlServlet extends HttpServlet {

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 정보를 가져온다, 사용자가 무엇을 요청하는지 파악 한다.
		// http://localhost:8080/jspStudy/index.do/name=mjb
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI(); // /jspStudy/index.do
		String cmd = uri.substring(uri.lastIndexOf("/"));
		System.out.println("cmd = " + cmd);

		if (cmd != null) {
			// 2. ActionFactory 관련된 Action 객체를 만들어 줄 것을 요청.
			ActionFactory factory = ActionFactory.getInsctance();
			Action action = factory.getAction(cmd);
			if (action != null) {
				ActionForward af = action.execute(request, response);
				// 3. 화면을 요청 (sendRedirect, forward 방식 중 요청)
				if (af.isRedirect() == true) {
					response.sendRedirect(af.getUrl());
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
					rd.forward(request, response);
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
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
