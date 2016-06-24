package staff.model;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Containerreservation_Dto;
import staff.db.staff_Dao;

public class AllContainerResetvation_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String con_num=req.getParameter("con_num");
		Vector<Containerreservation_Dto> list=dao.get_ContainerreservationData(con_num,2);
		
		for(int i=0;i<list.size();i++){
			Containerreservation_Dto dto=list.get(i);				
			try {
				DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
				Date res_date=format.parse(dto.getDate());
				Calendar cal=Calendar.getInstance();
				cal.setTime(res_date);
				cal.add(Calendar.DATE, dto.getKeep_date());
				
				dto.setLast_date(format.format(cal.getTime()));				
				
			} catch (ParseException e) {						
				e.printStackTrace();
			}
		}
		
		req.setAttribute("list", list);
		req.setAttribute("list_size", list.size());
		req.setAttribute("con_num",con_num);
		return "/mypage/staff/container/modal/all_container_info.jsp";
	}

	
	
}
