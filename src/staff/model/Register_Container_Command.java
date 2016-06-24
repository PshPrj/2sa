package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class Register_Container_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		if(req.getParameter("type")!=null){
			String con_name=req.getParameter("name");
			String capacity=req.getParameter("capacity");
			String staff_num=req.getParameter("staff_num");
			dao.Insert_Container(staff_num, capacity, con_name);
		}
		
		
		Vector<Staff_Dto> list=dao.get_StaffData(" where d.dept_type=3");
		req.setAttribute("list", list);
		return "/mypage/staff/container/modal/register_container.jsp";
	}

}
