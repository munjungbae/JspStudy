package co.kh.dev.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet.do")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. 사용자 정보 가져오기
		//2. DB에서 조회하기
		//3. 화면을 출력해주기
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			// 1. 세션정보 가져오기 (세션객체가 있으면 세션 객체를 주고 없으면 null 값 리턴)
			HttpSession session = request.getSession(false);
			// 2. 세션 정보가 있으면 id와 password 를 읽어온다. 없다면 로그인창으로 가게 한다(sendRedirect)
			if (session != null) {
				System.out.println("세션 고유 아이디 " + session.getId()); // 세션 고유번호 , 테이블 내 id가 아님
				// 3. 사용자 정보 아이디와 패스워드 가져오기
				String id = (String) session.getAttribute("id");
				// 사용자 정보를 화면에 출력한다.
				out.println("<html>");
				out.println("<body>");
				out.println("<table align='center' border='1' width='300'>");
				out.println("<tr>");
				out.println("<td width='300' align='center'>" + id + " 님 로그인 되었습니다.</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center'>");
				out.println("<a href='/jspStudy/registerList.do'>회원정보</a>");
				out.println("<a href='/jspStudy/logout.do'>로그아웃</a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			} else { // 세션이 없을 시 로그인화면출력
				out.println("<html>");
				out.println("<body>");
				out.print("<form method='post' action='/jspStudy/loginCheck.do'>");
				out.println("<table align=\"center\" border='1' width='300'>");
				out.println("<tr>");
				out.println("<th width='100'>아이디</th>");
				out.println("<td width='200'>&nbsp;<input type='text' name='id'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th width='100'>비밀번호</th>");
				out.println("<td width='200'>&nbsp;<input type='password' name='pass'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align='center' colspan='2'>");
				out.println("<a href='/jspStudy/bbs/login.html'><input type='button' value='회원가입' align='center'></a>");
				out.println("<input type='submit' value='로그인'>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</form>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (out != null) {
				out.close();
			}
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
