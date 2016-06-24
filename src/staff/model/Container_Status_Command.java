package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Container_Dto;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class Container_Status_Command implements Command {
	staff_Dao dao=new staff_Dao();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String staff_num=req.getParameter("staff_num");
		String con_num=req.getParameter("con_num");
		Vector<Staff_Dto> list=dao.get_StaffData(" where d.dept_type=3");
		Staff_Dto dto=new Staff_Dto();
		
		for(int i=0;i<list.size();i++){
			if(list.get(i).getNum().equals(staff_num)){
				req.setAttribute("staff", list.get(i));
			}
		}
		
		if(req.getParameter("type")!=null){
			String name=req.getParameter("name");
			String capacity=req.getParameter("capacity");
						
			dao.Update_Container(" con_name='"+name+"',container_capacity="+capacity+",staff_num="+staff_num+" where container_num="+con_num);
			
		}
		
		
		req.setAttribute("list", list);
		req.setAttribute("num", con_num);
		req.setAttribute("name", req.getParameter("con_name"));
		return "/mypage/staff/container/modal/show_Container_status.jsp";
	}

}
