package mypage.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;

public class MyModifyCommand2 implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage", "MODIFY");
		
		String pw = req.getParameter("pw");
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		
		boolean flag = dao.passwordChk(pw);
		
		if(flag) {
			req.setAttribute("modifyDto", dao.getModifyDto());
			return "mypage/member/modify.jsp";
		}
		
		req.setAttribute("flag", flag);
		return "mypage/member/modify_chk.jsp";
	}
}
