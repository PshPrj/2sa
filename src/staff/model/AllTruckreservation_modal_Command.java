package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.All_Reservation_Info_Dto;
import staff.db.Truckreservation_Dto;
import staff.db.staff_Dao;

public class AllTruckreservation_modal_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String truck_num=req.getParameter("truck_num");
		
		Vector<All_Reservation_Info_Dto> list=dao.get_All_reservationData(" where p.truck_num="+truck_num);
		
		req.setAttribute("list", list);
		return "/mypage/staff/truck/modal/all_truck_reservation_info.jsp";
	}

}
