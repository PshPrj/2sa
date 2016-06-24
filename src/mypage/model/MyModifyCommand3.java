package mypage.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.ModifyDto;
import mypage.db.MyPageDao;

public class MyModifyCommand3 implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage", "MODIFY_PROC");
		
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		ModifyDto dto = new ModifyDto();
		
		dto.setM_pw(req.getParameter("pw"));
		dto.setM_tel(req.getParameter("tel"));
		
		dao.Update(dto);
		
		return "mypage/member/modify_success.jsp";
	}
}
