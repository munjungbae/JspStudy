package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginCheck.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SELECT_USER_ID = "SELECT ID,PASS FROM USERS WHERE ID = ?";

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		HttpSession session = request.getSession();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webuser", "123456");
			pstmt = con.prepareStatement(SELECT_USER_ID);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			while (rs.next()) {
				String idValue = rs.getString("ID");
				String passValue = rs.getString("PASS");
				if (id.equals("admin") && pass.equals("123456")) {
					// 세션이 있으면 가져오고 없으면 생성.
					session.setAttribute("id", id);
					session.setAttribute("pass", pass);

					response.sendRedirect("/jspStudy/loginServlet.do");
				} else {
					if (id.equals(idValue) && pass.equals(passValue)) {
						session.setAttribute("id", idValue);
						session.setAttribute("pass", passValue);
						response.sendRedirect("/jspStudy/loginServlet.do");
					} else if (id.equals(idValue)) {
						out.println("<h2>비밀번호가 잘못 입력 되었습니다.</h2>");
						out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
						out.println("</body>");
						out.println("</html>");
						session.invalidate();
					} else {
						out.println("<h2>" + id + "는 존재하지 않는 아이디 입니다.</h2>");
						out.println("<a href='/jspStudy/loginServlet.do'><input type='button' value='뒤로가기'></a>");
						out.println("</body>");
						out.println("</html>");
						session.invalidate();
					}
				}
			}
			if (out != null) {
				out.close();
			}

		} catch (UnsupportedEncodingException e) {
			System.out.println(e.toString());
		} catch (IOException e) {
			System.out.println(e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.out.println(e.toString());
				}

			}
		}
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
