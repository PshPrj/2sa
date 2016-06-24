package mypage.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.db.ModifyDto;

public class MyModifyCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage","MODIFY_CHK");
		
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		ModifyDto dto = dao.getModifyDto();
		
		req.setAttribute("modifyDto", dto);
		return "mypage/member/modify_chk.jsp";
	}
}
