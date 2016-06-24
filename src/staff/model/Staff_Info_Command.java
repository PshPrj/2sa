package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.All_Reservation_Info_Dto;
import staff.db.Container_Dto;
import staff.db.Truck_Dto;
import staff.db.staff_Dao;

public class Staff_Info_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String dept_type=req.getParameter("dept_type");
		String num=req.getParameter("num");
		staff_Dao dao=new staff_Dao();
		
		
		if(dept_type.equals("3")){
			Vector<Container_Dto> list=dao.get_ContainerData(2, " where staff_num="+num);
			System.out.println(list.size());
			req.setAttribute("container", list);
			req.setAttribute("container_size", list.size());
			return "/mypage/staff/statistics/modal/show_staffdetail_info2.jsp";
		}else if(dept_type.equals("2")){
			Vector<Truck_Dto> list=dao.get_TruckData(2, " where staff_num="+num);
			System.out.println(list.size());
			req.setAttribute("truck", list);
			req.setAttribute("truck_size", list.size());
			return "/mypage/staff/statistics/modal/show_staffdetail_info1.jsp";
		}else if(dept_type.equals("4")){
			Vector<All_Reservation_Info_Dto> list=dao.get_All_reservationData(" where r.staff_num="+num);
			System.out.println(list.size());
			req.setAttribute("res", list);
			req.setAttribute("res_size", list.size());
			return "/mypage/staff/statistics/modal/show_staffdetail_info3.jsp";
		}
		
		req.setAttribute("type", dept_type);
		req.setAttribute("id", req.getParameter("id"));
		req.setAttribute("name", req.getParameter("name"));
		return "";
	}

}
