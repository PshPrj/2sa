package register.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import org.omg.CORBA.Request;

import move.dbcp.*;
import move.dbcp.DBconnectionMgr;

public class findCommand implements command {
	private DBconnectionMgr pool;
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;

	public findCommand() {
		pool = DBconnectionMgr.getInstance();
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		registerDto dto = new registerDto();
		HttpSession session = req.getSession();
		String sql = null, sql1, sql2 = "";
		
		//ID찾기 관련
		String id_name = req.getParameter("id_name");
		String telNum = req.getParameter("f_headNum") + req.getParameter("f_midNum") + req.getParameter("f_footNum");
		
		//PW찾기 관련
		String pw_name = req.getParameter("pw_name");
		String fi_id = req.getParameter("fi_id");
		
		if(id_name != "" && telNum != ""){
			//ID 찾기 SQL
			sql1 = "select member_id from member where name = '" + id_name + "' and member_tel = '" + telNum + "'";
			sql += sql1;
		}
		else if(pw_name != "" && fi_id != ""){
			//PW 찾기 SQL
			sql2 = "select member_pw from member where name = '" + pw_name + "' and member_id = '" + fi_id + "'";
			sql +=sql2;
		}
		
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(sql.equals("sql1")){
				dto.setId(rs.getString("member_id"));
			}
			else if(sql.equals("sql2")){
				dto.setPw(rs.getString("member_pw"));
				
			}
			session.setAttribute("dto", dto);
		} catch (Exception err) {
			System.out.println("검색 실패 : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}

}
