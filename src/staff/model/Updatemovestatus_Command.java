package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.staff_Dao;

public class Updatemovestatus_Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	
		int type=Integer.valueOf(req.getParameter("type"));
		String pay_num=req.getParameter("pay_num");
		
		staff_Dao dao=new staff_Dao();
		
		dao.Update_Movestatus(type, pay_num);
				
		return "";
	}

}
