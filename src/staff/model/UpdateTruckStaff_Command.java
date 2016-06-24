package staff.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class UpdateTruckStaff_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String staff_num=req.getParameter("staff_num");
		String truck_num=req.getParameter("truck_num");
		
		Staff_Dto dto=dao.Updatetruckstaff(truck_num, staff_num);		
		
		req.setAttribute("staff", dto);	
		
		//return "staffmodal?cmd=TRUCKSTATUS&truck_num="+truck_num+"&staff_num="+staff_num;
		return "/mypage/staff/truck/content/ajax_content.jsp";
	}

}
