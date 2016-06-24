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

public class logCommand implements command {
	private C3P0Mgr pool;
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;

	public logCommand() {
		pool = C3P0Mgr.getInstance();
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		registerDto dto = new registerDto();
		String id = req.getParameter("r_id");
		String pw = req.getParameter("r_password");

		String sql = "select * from member where member_id = '" + id + "'";

		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			String search_id = "";
			String search_pw = "";
			int search_num = 0;

			//DB�˻� ��� ����
			while (rs.next()) {
				search_id = rs.getString("member_id");
				search_pw = rs.getString("member_pw");
				search_num = rs.getInt("member_num");
			}
			
			//���̵�-��й�ȣ Ȯ��
			if (req.getParameter("r_id").equals(search_id)) {
				if (req.getParameter("r_password").equals(search_pw)) {
					dto.setId(search_id);
					dto.setMember_no(String.valueOf(search_num));	//ȸ�� ������ȣ�� session�α��� ����
				} else {
					dto.setId("���");
				}
			}else {
				dto.setId("���̵�");
			}
			HttpSession session = req.getSession();
			session.setAttribute("dto", dto);
		} catch (Exception err) {
			System.out.println("�α��� ���� : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return "/main/logCheck.jsp";
	}
}