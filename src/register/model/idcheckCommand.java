/*
 * title : DB�� ��ϵ� ID��  �Է� ID �ߺ� ���� �˻�
 */
package register.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import move.dbcp.*;

public class idcheckCommand implements command {
	private DBconnectionMgr pool;
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public idcheckCommand() {
		pool = DBconnectionMgr.getInstance();
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		registerDto dto = new registerDto();
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("m_id");
		String pw = req.getParameter("pw");
		String m_name =req.getParameter("m_name");
		String headNum = req.getParameter("headNum");
		String midNum = req.getParameter("midNum");
		String footNum = req.getParameter("footNum");
		
		String sql = "select member_id from member where member_id= '" + id + "'";
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			String mem_id = "";
			String id_c = null;
			
			System.out.println(sql);
			
			while(rs.next()){
				mem_id = rs.getString("member_id");
			}
			boolean result = id.equalsIgnoreCase(mem_id);
			System.out.println(mem_id+"�ι�°");
			
			if(result == true){
				id_c="���Ұ�";
			}
			else if(result == false){
				id_c="��밡��";
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("id_c", id_c);
		} catch (Exception e) {
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		

		
		return "/register/idCheck.jsp";
	}
}