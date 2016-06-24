package register.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import move.dbcp.C3P0Mgr;
import move.dbcp.DBconnectionMgr;

public class testCommand implements command {
	private DBconnectionMgr pool;
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;

	public testCommand() {
		pool = DBconnectionMgr.getInstance();
	}
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		registerDto dto = new registerDto();
		int member_no = Integer.parseInt(req.getParameter("logw"));
		HttpSession session = req.getSession();
		
		
		String sql = "select member_id, member_num from member where member_num = " + member_no ;
		
		int member_num = 0;
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			String member_id = "";
			
			
			while(rs.next()){
				member_id = rs.getString("member_id");
				member_num = rs.getInt("member_num");
			}
				
			if(member_num > 10){
				dto.setId(member_id);
				dto.setMember_no(String.valueOf(member_num));
				session.setAttribute("member_no", member_num);
				session.setAttribute("member_id", member_id);
			}
			else if(member_num <= 10){
				dto.setStaff_no(String.valueOf(member_num));
				dto.setStaff_type("2");
				session.setAttribute("staff_no", member_num);
				session.setAttribute("staff_type", "2");
			}
			
			
		} catch (Exception err) {
			System.out.println("검색 실패 : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		
		return "/main/index.jsp";
	}

}
