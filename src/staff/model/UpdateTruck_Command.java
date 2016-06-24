package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Truck_Dto;
import staff.db.staff_Dao;

public class UpdateTruck_Command implements Command {

	staff_Dao dao=new staff_Dao();
	String subsql="";
	String car_name,car_type,capacity;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		car_name=req.getParameter("car_name");
		car_type=req.getParameter("car_type");
		capacity=req.getParameter("capacity");
		String truck_num=req.getParameter("truck_num");
	
		subsql=set_sql();
		
		Truck_Dto dto=dao.UpdateTruck(subsql, truck_num);
		
		
		req.setAttribute("truck", dto);
		return "/mypage/staff/truck/content/ajax_content.jsp";
	}

	public String set_sql(){
		String sql="";
		
		if(!car_name.equals("")||!car_type.equals("")||!capacity.equals(""))
			sql+=" where ";
		
		if(!car_name.equals("")){
			sql+=" car_num="+car_name;
		}
		
		if(!car_type.equals("")){
			sql+=" car_type="+car_type;
		}
		
		if(!capacity.equals("")){
			sql+=" capacity="+capacity;
		}
		return sql;
	}
	
	
	
	
}
