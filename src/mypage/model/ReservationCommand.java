package mypage.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;

public class ReservationCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage","RESERVATION");
		
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		req.setAttribute("reservationList", dao.getReservationList());
		
		return "mypage/member/reservation.jsp";
	}
}
