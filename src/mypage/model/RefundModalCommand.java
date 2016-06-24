package mypage.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.db.PaymentDto;

public class RefundModalCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		int member_num = Integer.parseInt(req.getSession().getAttribute("member_num").toString());
		ArrayList<PaymentDto> paymentList = new MyPageDao(member_num).getPaymentList();
		req.setAttribute("reservNum", req.getParameter("reservNum"));
		req.setAttribute("paymentList", paymentList);
		return "mypage/member/refund_modal.jsp";
	}
}
