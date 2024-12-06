package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.kh.dev.model.UsersDAO;
import co.kh.dev.model.UsersVO;

@WebServlet("/loginCheck.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		HttpSession session = request.getSession();

		UsersDAO uDao = new UsersDAO();
		UsersVO uVo = new UsersVO(id, pass, name);
		UsersVO rUvo = uDao.selectLoginCheckDB(uVo);

		if (rUvo == null) {
			// 아이디랑 패스워드가 잘못 된 경우
		} else {
			if (id.equals("admin") && pass.equals("123456")) {
				session.setAttribute("id", id);
				session.setAttribute("pass", pass);
				session.setAttribute("pass", pass);
				response.sendRedirect("/jspStudy/loginServlet.do");

			} else {
				if (id.equals(rUvo.getId()) && pass.equals(rUvo.getPass())) {
					session.setAttribute("id", rUvo.getId());
					session.setAttribute("pass", rUvo.getPass());
					session.setAttribute("name", rUvo.getName());
					response.sendRedirect("/jspStudy/loginMyPageServlet.do");
				} else if (id != rUvo.getId()) {
					out.println("<h2 style='text-align:center'>비밀번호가 일치하지 않습니다. </h2>");
					out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
					out.println("</body>");
					out.println("</html>");
					session.invalidate();
				} else {
					out.println("<h2 style='text-align:center'>" + id + "는 존재하지 않는 아이디 입니다.</h2>");
					out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
					out.println("</body>");
					out.println("</html>");
					session.invalidate();
				}

			}
		}

//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		con = DBUtility.dbCon();
//		String SELECT_USER_ID = "SELECT ID,PASS FROM USERS WHERE ID = ?";
//
//
//		try {
//			pstmt = con.prepareStatement(SELECT_USER_ID);
//
//			pstmt.setString(1, id);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				String idValue = rs.getString("ID");
//				String passValue = rs.getString("PASS");
//				if (id.equals("admin") && pass.equals("123456")) {
//					session.setAttribute("id", id);
//					session.setAttribute("pass", pass);
//					response.sendRedirect("/jspStudy/loginServlet.do");
//
//				} else {
//					if (id.equals(idValue) && pass.equals(passValue)) {
//						session.setAttribute("id", idValue);
//						session.setAttribute("pass", passValue);
//						response.sendRedirect("/jspStudy/loginMyPageServlet.do");
//					} else if (id.equals(idValue)) {
//						out.println("<h2 style='text-align:center'>비밀번호가 일치하지 않습니다. </h2>");
//						out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
//						out.println("</body>");
//						out.println("</html>");
//						session.invalidate();
//					} /*
//						 * else if (id == null) {
//						 * out.println("<h2 style='text-align:center'>아이디가 잘못 입력 되었습니다.</h2>"); out.
//						 * println("<a href='/jspStudy/loginServlet.do' style=align=center;'><input type='button' value='뒤로가기'></a>"
//						 * ); out.println("</body>"); out.println("</html>"); session.invalidate(); }
//						 */else {
//						out.println("<h2 style='text-align:center'>" + id + "는 존재하지 않는 아이디 입니다.</h2>");
//						out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
//						out.println("</body>");
//						out.println("</html>");
//						session.invalidate();
//					}
//				}
//			}
//			if (out != null) {
//				out.close();
//			}
//
//		} catch (UnsupportedEncodingException e) {
//			System.out.println(e.toString());
//		} catch (IOException e) {
//			System.out.println(e.toString());
//		} finally {
//			DBUtility.dbClose(con, pstmt, rs);
//		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.toString());
		}
	}

}
