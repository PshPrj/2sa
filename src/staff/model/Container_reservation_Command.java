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
import staff.db.Container_Dto;
import staff.db.Containerreservation_Dto;
import staff.db.CurrenrConresrvation_Dto;
import staff.db.staff_Dao;

public class Container_reservation_Command implements Command{
	Vector<Containerreservation_Dto> list;
	Vector<CurrenrConresrvation_Dto> current;
	Date res_date;
	String con_num;
	staff_Dao dao=new staff_Dao();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String name=req.getParameter("select_name");
		
		if(name==null){
			req.setAttribute("list", null);
			req.setAttribute("list_size", 0);
		}else{
			list=dao.get_ContainerreservationData(name,1);
			req.setAttribute("list_size",list.size());
			if(list.size()!=0){				
				req.setAttribute("container_num", list.get(0).getCon_num());
				con_num=String.valueOf(req.getAttribute("container_num"));					
				Set_LastDate(1);				
			}
			current=dao.get_CurrentreservationConDto(con_num);
			Set_LastDate(2);
			req.setAttribute("current", current);
			req.setAttribute("current_size", current.size());
			req.setAttribute("list", list);
		}
	
		Vector<Container_Dto> name_list=dao.get_ContainerData(1,"");
		req.setAttribute("name_list", name_list);
		req.setAttribute("boardpage","CONTAINER_RESERVATION");
		return "mypage/staff/container/container_reservation.jsp";
	}
	
	private void Set_LastDate(int type){
		
		if(type==1){

			for(int i=0;i<list.size();i++){
				Containerreservation_Dto dto=list.get(i);					
				
				try {
					DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
					res_date=format.parse(dto.getDate());
					Calendar cal=Calendar.getInstance();
					cal.setTime(res_date);
					cal.add(Calendar.DATE, dto.getKeep_date());
					
					dto.setLast_date(format.format(cal.getTime()));				
					
				} catch (ParseException e) {						
					e.printStackTrace();
				}
			}
		}else{
			for(int i=0;i<current.size();i++){
				CurrenrConresrvation_Dto dto=current.get(i);					
				
				try {
					DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
					res_date=format.parse(dto.getDate());
					Calendar cal=Calendar.getInstance();
					cal.setTime(res_date);
					cal.add(Calendar.DATE, dto.getKeep_date());
					
					dto.setLast_date(format.format(cal.getTime()));				
					
				} catch (ParseException e) {						
					e.printStackTrace();
				}
			}
		}
		
		
	}
	

}
