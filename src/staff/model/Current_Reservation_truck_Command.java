package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.CurrentTruckReservation_Dto;
import staff.db.staff_Dao;

public class Current_Reservation_truck_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	
		String truck_num=req.getParameter("truck_num");
		
		staff_Dao dao=new staff_Dao();
		
		CurrentTruckReservation_Dto list=dao.get_CurrentReservationData(truck_num, 2);
				
		req.setAttribute("list",list);
		return "/mypage/staff/truck/modal/truck_reservation_info_modal.jsp";
	}

}
