package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.kh.dev.model.UsersDAO;
import co.kh.dev.model.UsersVO;

@WebServlet("/registerList.do")
public class RegisterList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) {

		UsersDAO uDao = new UsersDAO();
		ArrayList<UsersVO> uList = new ArrayList<UsersVO>();
		uList = uDao.selectDB();
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String SELECT_USER = "SELECT * FROM USERS ORDER BY NO ASC";

		try {
//			con = DBUtility.dbCon();
//			pstmt = con.prepareStatement(SELECT_USER);
//			rs = pstmt.executeQuery();

			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

//			while (rs.next()) {
//				int no = rs.getInt("NO");
//				String id = rs.getString("ID");
//				String pass = rs.getString("PASS");
//				String name = rs.getString("NAME");
			for (UsersVO uVo : uList) {
				out.println("<table align=center width=900 border=1>");
				out.println("<tr>");
				out.println("<th width=300 height=50>넘버</th>");
				out.println("<td width=400 align=center>" + uVo.getNo() + "</td>");
				out.println("<th width=300 height=50>아이디</th>");
				out.println("<td width=400 align=center>" + uVo.getId() + "</td>");
				out.println("<th width=300 height=50>비밀번호</th>");
				out.println("<td width=400 align=center>" + uVo.getPass() + "</td>");
				out.println("<th width=300 height=50>이름</th>");
				out.println("<td width=400 align=center>" + uVo.getName() + "</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("<p>");
			}
			out.println("<p align=center><a href=/jspStudy/loginServlet.do>뒤로</a></p>");
			out.println("</body>");
			out.println("</html>");
//			out.println("<table align=center width=900 border=1>");
//			out.println("<tr>");
//			out.println("<th width=300 height=50>넘버</th>");
//			out.println("<td width=400 align=center>" + no + "</td>");
//			out.println("<th width=300 height=50>아이디</th>");
//			out.println("<td width=400 align=center>" + id + "</td>");
//			out.println("<th width=300 height=50>비밀번호</th>");
//			out.println("<td width=400 align=center>" + pass + "</td>");
//			out.println("<th width=300 height=50>이름</th>");
//			out.println("<td width=400 align=center>" + name + "</td>");
//			out.println("</tr>");
//			out.println("</table>");
//			out.println("<p>");
//  			}
//			out.println("<p align=center><a href=/jspStudy/loginServlet.do>뒤로</a></p>");
//			out.println("</body>");
//			out.println("</html>");

		} catch (Exception e) {
			System.out.println(e.toString());
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
