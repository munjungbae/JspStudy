package co.kh.dev.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberList() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con = null;
		String MEMBER_SELECT = "SELECT * FROM MEMBER ORDER BY NAME, ID ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webuser", "123456");
			pstmt = con.prepareStatement(MEMBER_SELECT);
			rs = pstmt.executeQuery();

			// 3. 출력하기
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<html>");
			out.println("<head><title>회원가입 목록</title></head>");
			out.println("<body>");
			while (rs.next()) {
				String name = rs.getString("NAME");
				String id = rs.getString("ID");
				String pwd = rs.getString("PWD");
				String birth = rs.getString("BIRTH");
				String email = rs.getString("EMAIL");
				out.println("<table align=center width=500 border=1>");
				out.println("<tr>");
				out.println("<th width=80>이름</th>");
				out.println("<td width=400 align=center>" + name + "</td>");
				out.println("<th width=80>아이디</th>");
				out.println("<td width=400 align=center>" + id + "</td>");
				out.println("<th width=80>비밀번호</th>");
				out.println("<td width=400 align=center>" + pwd + "</td>");
				out.println("<th width=80>생년월일</th>");
				out.println("<td width=400 align=center>" + birth + "</td>");
				out.println("<th width=80>이메일</th>");
				out.println("<td width=400 align=center>" + email + "</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("<p>");
			}
			out.println("<p align=center><a href=/jspStudy/bbs/write.html>회원가입 페이지</a></p>");
			out.println("</body>");
			out.println("</html>");
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		} catch (SQLException e) {
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
}