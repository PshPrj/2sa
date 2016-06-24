package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.model.Command;
import staff.db.Container_Dto;
import staff.db.Staff_Dto;
import staff.db.Truck_Dto;
import staff.db.staff_Dao;

public class Assign_Reservation_Command implements Command {

	staff_Dao dao=new staff_Dao();
	String subsql="";
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String pay_num=req.getParameter("pay_num");
		Vector<Staff_Dto> staff_list=dao.get_StaffData(" where d.dept_type=4");//스태프 배정
		Vector<Truck_Dto> truck=dao.get_TruckData(1, "");
		String res_num=req.getParameter("res_num");
			
		if(req.getParameter("date_cnt")!=null){
			if(!req.getParameter("date_cnt").equals("0")){
				Vector<Container_Dto> container=dao.get_ContainerData(1, "");
				req.setAttribute("container", container);
			}			
		}
	
		
		if(req.getParameter("type")!=null)
		{	
			if(req.getParameter("type").equals("1")){
				String con_num=req.getParameter("container_num");
				String truck_num=req.getParameter("truck_num");
				String staff_num=req.getParameter("staff_num");
				String member_num=req.getParameter("member_num");
				
				subsql=" container_num="+con_num+" , truck_num="+truck_num;

				dao.Update_Payment(staff_num, pay_num, subsql,res_num,member_num);
			}else{
				String truck_num=req.getParameter("truck_num");
				String staff_num=req.getParameter("staff_num");
				String member_num=req.getParameter("member_num");

				subsql="  truck_num="+truck_num;				
				dao.Update_Payment(staff_num, pay_num, subsql,res_num,member_num);
			}			
		}
		
		MyPageDao tempdao = new MyPageDao(Integer.parseInt(req.getParameter("member_num")));
		req.setAttribute("floorplanList", tempdao.getFloorplanList());
		req.setAttribute("res_num", res_num);
		req.setAttribute("truck", truck);		
		req.setAttribute("staff", staff_list);
		req.setAttribute("date_cnt", req.getParameter("date_cnt"));
		req.setAttribute("pay_num",pay_num);
		return "/mypage/staff/payment/modal/set_item_modal.jsp";
	}

}
