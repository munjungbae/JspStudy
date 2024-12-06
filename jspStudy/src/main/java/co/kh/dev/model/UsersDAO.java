package co.kh.dev.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class UsersDAO {
	private final String SELECT_SQL = "SELECT * FROM USERS ORDER BY NO";
	private final String SELECT_BY_ID_SQL = "SELECT * FROM USERS WHERE ID = ?";
	private final String SELECT_LOGIN_CHECK_SQL = "SELECT * FROM USERS WHERE ID = ? AND PASS = ?";
	private final String INSERT_SQL = "INSERT INTO USERS VALUES((SELECT NVL(MAX(NO),0)+1 FROM USERS),?,?,?)";
	private final String DELETE_SQL = "DELETE FROM USERS WHERE ID = ?";
	private final String UPDATE_SQL = "UPDATE USERS SET ID = ?, PASS = ?, NAME = ? WHERE ID = ?";

	// 전체를 DB에서 출력
	public ArrayList<UsersVO> selectDB() {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UsersVO> uList = new ArrayList<UsersVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("NO");
				String name = rs.getString("NAME");
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				UsersVO uvo = new UsersVO(no, id, pass, name);
				uList.add(uvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uList;
	}

	// 아이디를 받아서 아이디에 맞는 레코드 출력
	public UsersVO selectByIdDB(UsersVO uvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(SELECT_BY_ID_SQL);
			pstmt.setString(1, uvo.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("NO");
				String id = rs.getString("ID");
				String pass = rs.getString("PWD");
				String name = rs.getString("NAME");
				uvo = new UsersVO(no, id, pass, name);
			} else {
				uvo = new UsersVO();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uvo;
	}

	// id, pass를받아서 맞는 레코드를 출력
	public UsersVO selectLoginCheckDB(UsersVO uvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(SELECT_LOGIN_CHECK_SQL);
			pstmt.setString(1, uvo.getId());
			pstmt.setString(2, uvo.getPass());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("NO");
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				String name = rs.getString("NAME");
				uvo = new UsersVO(no, id, pass, name);
			} else {
				uvo = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return uvo;
	}

	public Boolean insertDB(UsersVO uvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, uvo.getId());
			pstmt.setString(2, uvo.getPass());
			pstmt.setString(3, uvo.getName());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (count != 0) ? (true) : (false);
	}

	
	public Boolean deleteDB(UsersVO uvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setString(1, uvo.getId());
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (rs == 0) ? false : true;
	}

	public Boolean updateDB(UsersVO uvo) {
		Connection con = DBUtility.dbCon();
		PreparedStatement pstmt = null;
		int rs = 0;
		try {
			pstmt = con.prepareStatement(UPDATE_SQL);
			pstmt.setString(1, uvo.getId());
			pstmt.setString(2, uvo.getPass());
			pstmt.setString(3, uvo.getName());
			pstmt.setString(4, uvo.getIdValue());
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (rs == 0) ? false : true;
	}
	
	
}
