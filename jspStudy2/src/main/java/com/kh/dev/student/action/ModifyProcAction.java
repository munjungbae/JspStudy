package com.kh.dev.student.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dev.student.control.ActionForward;
import com.kh.dev.student.model.StudentDAO;
import com.kh.dev.student.model.StudentVO;

public class ModifyProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		StudentDAO dao = StudentDAO.getInstance();
		StudentVO svo = new StudentVO(id, request.getParameter("pass"), request.getParameter("name"),
				request.getParameter("phone1"), request.getParameter("phone2"), request.getParameter("phone3"),
				request.getParameter("email"), request.getParameter("zipcode"), request.getParameter("address1"),
				request.getParameter("address2"));

		boolean flag = dao.updateDB(svo);
		if (flag == true) {
			request.setAttribute("flag", flag);
			request.setAttribute("pass", request.getParameter("pass"));
		}
		return new ActionForward("/mvcmem/modifyProc.jsp", false);
	}

}
