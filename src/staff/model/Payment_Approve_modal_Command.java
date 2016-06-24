package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.staff_Dao;

public class Payment_Approve_modal_Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		if(req.getParameter("update")!=null){
			String res_num=req.getParameter("res_num");
			staff_Dao dao=new staff_Dao();
			dao.Update_Reservation(res_num);
		}
		
		
		req.setAttribute("id",req.getParameter("id"));
		req.setAttribute("res_num", req.getParameter("res_num"));
		return "/mypage/staff/payment/modal/approve_payment_modal.jsp";
	}

}
