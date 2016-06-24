package register.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import move.dbcp.*;
import register.model.registerDto;

public class completeCommand implements command {
	private DBconnectionMgr pool;
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public completeCommand() {
		pool = DBconnectionMgr.getInstance();
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		String sql = "insert into member (member_name, member_pw, member_tel, member_id, regi_date) values(?, ?, ?, ?, now())";
		
		System.out.println(req.getParameter("m_name"));

		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);

			stmt.setString(1, req.getParameter("m_name"));
			stmt.setString(2, req.getParameter("pw"));
			stmt.setString(3, req.getParameter("telNum"));
			stmt.setString(4, req.getParameter("m_id"));

			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("등록 실패 : " + e);
		} finally {
			pool.freeConnection(con, stmt);
		}
		return "/register/registerComplete.jsp";
	}

}
