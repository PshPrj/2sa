package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.Truck_Dto;
import staff.db.staff_Dao;

public class Truck_status_Command implements Command{

	staff_Dao dao=new staff_Dao();
	int cnt=0;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String truck_num=req.getParameter("truck_num");
		String staff_num=req.getParameter("staff_num");
		
		
		Vector<Staff_Dto> staff_list=dao.get_StaffData(" where d.dept_type=2");
		
		for(int i=0;i<staff_list.size();i++){
			if(staff_list.get(i).getNum().equals(staff_num)){
				cnt=i;
				break;
			}
		}
		
		
		Vector<Truck_Dto> truck=dao.get_TruckData(2, " where truck_num="+truck_num);
		
		req.setAttribute("truck_num", truck.get(0).getTruck_num());
		req.setAttribute("staff_list", staff_list);
		req.setAttribute("staff", staff_list.get(cnt));
		req.setAttribute("truck", truck);
		
		return "/mypage/staff/truck/modal/truck_status_modal.jsp";
	}
	

}
