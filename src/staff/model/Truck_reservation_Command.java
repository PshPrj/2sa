package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.CurrentTruckReservation_Dto;
import staff.db.Truck_Dto;
import staff.db.Truckreservation_Dto;
import staff.db.staff_Dao;

public class Truck_reservation_Command implements Command{
	String truck_num;
	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String name=req.getParameter("select_name");
		
		if(name==null){
			req.setAttribute("list", null);
			req.setAttribute("list_size",0);
		}else{
			Vector<Truckreservation_Dto> list=dao.get_TruckreservationData(name);
			req.setAttribute("list", list);
			req.setAttribute("list_size",list.size());
			if(list.size()!=0){
				req.setAttribute("truck_num", list.get(0).getTruck_num());
				truck_num=String.valueOf(req.getAttribute("truck_num"));
			}		
			CurrentTruckReservation_Dto current=dao.get_CurrentReservationData(truck_num,1);
			req.setAttribute("current", current);
		}

		
		Vector<Truck_Dto> name_list=dao.get_TruckData(1,"");
		
		
		req.setAttribute("name_list", name_list);
		req.setAttribute("boardpage","TRUCK_RESERVATION");
		return "mypage/staff/truck/truck_reservation.jsp";
	}

}
