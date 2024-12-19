package com.kh.edu.board.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.edu.board.action.CommandAction;

@WebServlet("*.do")
public class ControllerServlet extends HttpServlet {
	// 1. key : ~~~.do, value : 컨트롤 객체, 서비스 객체, DAO객체 를넣는다.
	// map <key, value>
	// 부르는 최종 값 /board/list.do=com.kh.edu.board.action.ListAction
	// 키 값 : "board/list.do", 객체 : Class.Load(com.kh.edu.board.action.ListAction);
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	// CommandPro.properties 키 값과 value값을 가져와서 미리 객체를 만들고 commandMap에 저장한다.(Pre
	// Loading)
	public void init(ServletConfig config) throws ServletException {
		// 2. props = config.getInitParameter("propertyConfig");
		// web.xmp에 있는 param-name이 propertyConfig이므로
		// <param-value>CommandPro.properties</param-value> 이 호출
		String props = config.getInitParameter("propertyConfig");
		// 3. CommandPro.properties 파일을 가져오기 위한 경로 설정
		Properties pr = new Properties();
		FileInputStream f = null;
		String path = config.getServletContext().getRealPath("/WEB-INF");
		try {
			// Command.properties파일의 내용을 읽어옴
			f = new FileInputStream(new File(path, props));
			// Command.properties파일의 정보를 Properties객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		// /board/list.do=com.kh.edu.board.action.ListAction 키 값에 "board/list.do" Set 등록
		Iterator<Object> keyIter = pr.keySet().iterator();
		while (keyIter.hasNext()) {
			// key 값 "board/list.do"
			String command = (String) keyIter.next();
			// value 값 com.kh.edu.board.action.ListAction
			String className = pr.getProperty(command);
			try {
				// com.kh.edu.board.action.ListAction 해당 문자열 클래스를 가져온다
				Class commandClass = Class.forName(className);
				// com.kh.edu.board.action.ListAction 객체를 만듦
				Object commandInstance = commandClass.newInstance();// 해당클래스의 객체를 생성
				// Map객체인 commandMap에 객체 저장
				commandMap.put(command, commandInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		ActionForward af = null;
		CommandAction com = null;
		try {
			// http://localhost:8080/jspStudy3/board/index.do?name=kdj
			// command = "jspStudy3/board/index.do"
			String command = request.getRequestURI();
			// request.getContextPath() == "/jspStudy3"
			if (command.indexOf(request.getContextPath()) == 0) {
				// command = "/board/index.do"
				command = command.substring(request.getContextPath().length());
			}

			com = (CommandAction) commandMap.get(command);
			af = com.execute(request, response);
			if (af.isRedirect() == true) {
				response.sendRedirect(af.getUrl());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
			}
		} catch (Throwable e) {
			throw new ServletException(e);
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