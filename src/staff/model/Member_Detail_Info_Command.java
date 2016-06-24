package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Member_reservation_info;
import staff.db.staff_Dao;

public class Member_Detail_Info_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String num=req.getParameter("num");
		staff_Dao dao=new staff_Dao();
		
		Vector<Member_reservation_info> list=dao.get_MemberreservationData(num);
		
		req.setAttribute("list_size", list.size());
		req.setAttribute("list", list);
		req.setAttribute("id", req.getParameter("id"));
		req.setAttribute("name", req.getParameter("name"));
		return "/mypage/staff/statistics/modal/show_memberdetail_info.jsp";
	}

}
