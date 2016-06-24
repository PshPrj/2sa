package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.staff_Dao;

public class Register_Staff_Command implements Command{
	
	staff_Dao dao=new staff_Dao();

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		if(req.getParameter("type")!=null)
		{
			String name=req.getParameter("name");
			String id=req.getParameter("id");
			String pw=req.getParameter("pw");
			String tel=req.getParameter("pw");
			String dept=req.getParameter("dept");
			
			dao.Insert_Staff(name, id, pw, dept, tel);
			
		}
		
		return "/mypage/staff/member/modal/register_staff.jsp";
	}

}
