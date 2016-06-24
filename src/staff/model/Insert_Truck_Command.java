package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.staff_Dao;

public class Insert_Truck_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		staff_Dao dao=new staff_Dao();

		System.out.println("dasdfjlkas");
		
		String capacity=req.getParameter("capacity");
		String car_num=req.getParameter("name");
		String car_type=req.getParameter("type");
		String staff_num=req.getParameter("staff_num");
		dao.Insert_Truck(staff_num, capacity, car_type, car_num);
		
		return "";
	}

}
