package com.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dev.student.control.ActionForward;
import com.kh.dev.student.model.StudentDAO;
import com.kh.dev.student.model.StudentVO;

public class LoginProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		StudentDAO dao = StudentDAO.getInstance();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		StudentVO svo = new StudentVO();
		svo.setId(id);
		svo.setPass(pass);
		int check = dao.selectLoginCheck(svo);
		if (check == 1) {//로그인 성공
		HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		request.setAttribute("check", check);
		return new ActionForward("/mvcmem/loginProc.jsp", false);
	}

}
