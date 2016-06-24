package staff.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.ShowProgress_Dto;
import staff.db.staff_Dao;

public class Show_progress_Command implements Command {

	staff_Dao dao=new staff_Dao();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String pay_num=req.getParameter("pay_num");
		ShowProgress_Dto dto=dao.get_Progress(pay_num);
		
		if(dto.getTime1()==null){
			dto.setStatus_num(0);
		}else if(dto.getTime2()==null){
			dto.setStatus_num(25);
		}else if(dto.getTime3()==null){
			dto.setStatus_num(50);
		}else if(dto.getTime4()==null){
			dto.setStatus_num(75);
		}else{
			dto.setStatus_num(100);
		}
		
		
		req.setAttribute("dto",dto);
		return "/mypage/staff/progress/modal/showProgress.jsp";
	}

}
