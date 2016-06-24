package mypage.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;

public class PayConfirmCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		MyPageDao dao = new MyPageDao();
		int reservation_num = Integer.parseInt(req.getParameter("reservNum").toString());
		String payment_type = req.getParameter("payType");
		dao.payConfirm(reservation_num, payment_type);
		return "#";
	}
}
