package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class Truck_Register_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		Vector<Staff_Dto> list=dao.get_StaffData(" where s.dept_type=3");
		req.setAttribute("list",list );
		return "/mypage/staff/truck/modal/register_truck.jsp";
	}

}
