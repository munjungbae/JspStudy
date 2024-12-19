package co.kh.dev.tempmember.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;

public class TempMemberDAO {
	private final String SELECT_SQL = "SELECT * FROM TEMPMEMBER ORDER BY ID";

	// 전체를 DB에서 출력
	public ArrayList<TempMemberVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		
		//자동으로 ConnectionPool된 자원을 부르는 방법
//		Connection con = null;
//		try {
//            Context contect = new InitialContext(); 
//            DataSource ds = (DataSource)contect.lookup("java:comp/env/jdbc/myOracle");
//            con = ds.getConnection();
//        } catch (Exception e) {
//            e.printStackTrace(); 
//        }
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<TempMemberVO> tmList = new ArrayList<TempMemberVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String pass = rs.getString("PASSWD");
				String name = rs.getString("NAME");
				String memNum1 = rs.getString("MEM_NUM1");
				String memNum2 = rs.getString("MEM_NUM2");
				String eMail = rs.getString("E_MAIL");
				String phone = rs.getString("PHONE");
				String zipcode = rs.getString("ZIPCODE");
				String address = rs.getString("ADDRESS");
				String job = rs.getString("JOB");
				TempMemberVO tvo = new TempMemberVO(id, pass, name, memNum1, memNum2, eMail, phone, zipcode, address,
						job);
				tmList.add(tvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBUtility.dbClose(con, pstmt, rs);
			cp.dbClose(con, pstmt, rs);
		}
		return tmList;
	}

}
