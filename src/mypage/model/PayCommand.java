package mypage.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.db.PaymentDto;

public class PayCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage","PAY");
		int member_num = Integer.parseInt(req.getSession().getAttribute("member_num").toString());
		
		ArrayList<PaymentDto> paymentList = new MyPageDao(member_num).getPaymentList();
		req.setAttribute("paymentList", paymentList);
		return "mypage/member/pay.jsp";
	}
}
