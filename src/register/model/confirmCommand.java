package register.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

public class confirmCommand implements command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		registerDto dto = new registerDto();

		dto.setId(req.getParameter("m_id"));
		dto.setName(req.getParameter("m_name"));
		dto.setHeadNum(req.getParameter("headNum"));
		dto.setMidNum(req.getParameter("midNum"));
		dto.setFootNum(req.getParameter("footNum"));
		dto.setPw(req.getParameter("pw"));
		
		HttpSession session = req.getSession();
		session.setAttribute("dto", dto);
		
		return "/register/registerConfirm.jsp";
	}

}
