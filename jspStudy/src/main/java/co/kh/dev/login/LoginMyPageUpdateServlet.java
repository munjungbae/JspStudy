package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.model.UsersDAO;
import co.kh.dev.model.UsersVO;

@WebServlet("/loginMyPageUpdateServlet.do")
public class LoginMyPageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

		
		HttpSession sessionValue = request.getSession();
		String idValue = (String) sessionValue.getAttribute("id");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		boolean returnFlag = false;

		HttpSession session = request.getSession(false);
		if (session != null) {
			try {
				UsersDAO uDao = new UsersDAO();
				UsersVO uVo = new UsersVO(id, pass, name, idValue);
				returnFlag = uDao.updateDB(uVo);
				

//				Connection con = null;
//				PreparedStatement pstmt = null;
//				String USERS_UPDATE = "UPDATE USERS SET ID = ?, PASS = ?, NAME = ? WHERE ID = ?";
//				con = DBUtility.dbCon();
//				pstmt = con.prepareStatement(USERS_UPDATE);
//				pstmt.setString(1, id);
//				pstmt.setString(2, pass);
//				pstmt.setString(3, name);
//				pstmt.setString(4, idValue);
//
//				int count = pstmt.executeUpdate();
//
//				returnFlag = (count != 0) ? (true) : (false);
//
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			if (returnFlag == true) {
				out.println("<table align=center width=700 border=1>");
				out.println("<th colspan='6'> 정보 수정이 완료 되었습니다</th>");
				out.println("<tr>");
				out.println("<th width=300 height=50>아이디</th>");
				out.println("<td width=400 align=center>" + id + "</td>");
				out.println("<th width=300 height=50>비밀번호</th>");
				out.println("<td width=400 align=center>" + pass + "</td>");
				out.println("<th width=300 height=50>이름</th>");
				out.println("<td width=400 align=center>" + name + "</td>");
				out.println("</tr>");
				out.println("<td align='center' colspan='6' height=50>");
				out.println(
						"<a href='/jspStudy/loginMyPageServlet.do'><input type='button' value='로그인' align='center'></a>");
				out.println("</td>");
				out.println("</table>");
				out.println("<p>");
				sessionValue.setAttribute("id", id);
				sessionValue.setAttribute("pass", pass);
				sessionValue.setAttribute("name", name);
			} else {
				out.println("<h2>" + id + "는 이미 존재하는 아이디 입니다.</h2>");
				out.println("<a href='/jspStudy//loginMyPageServlet.do'><input type='button' value='뒤로가기'></a>");
				out.println("</body>");
				out.println("</html>");
			}
		} else {
			out.println("<h2>페이지에 대한 권한이 없습니다..</h2>");
			out.println("<a href='/jspStudy//loginMyPageServlet.do'><input type='button' value='뒤로가기'></a>");
			out.println("</body>");
			out.println("</html>");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
