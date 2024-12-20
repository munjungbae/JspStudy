package com.kh.edu.board.action;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.edu.board.control.ActionForward;
import com.kh.edu.board.model.BoardDAO;
import com.kh.edu.board.model.BoardVO;

public class UpdateFormAction implements CommandAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

		try {
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			BoardVO vo = new BoardVO();
			vo.setNum(num);
			BoardDAO bdao = BoardDAO.getInstance();
			BoardVO article = bdao.selectBoardOneDB(vo);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("article", article);

			return new ActionForward("/board/updateForm.jsp", false);
		} catch (Exception e) {
			e.printStackTrace();
			return new ActionForward("/board/writeFrom.jsp", false);
		}

	}
}
