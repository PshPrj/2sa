/*

 	담당 : 윤초희
	최종 수정 일자 : 6/21
	관리자 메뉴 예약 확인 달력에 data input

 */

package staff.model;

import java.io.IOException;
import java.util.Calendar;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.google.gson.Gson;

import mypage.model.Command;
import staff.db.Calendar_Data;
import staff.db.Calendar_Dto;
import staff.db.staff_Dao;

public class CalendarData_Command implements Command {
	
	staff_Dao dao=new staff_Dao();
	String start,end,title,url;
	Vector<Calendar_Data> data_list=new Vector<>();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		Calendar cal=Calendar.getInstance();
		Vector<Calendar_Dto> list=dao.get_CalendarData();
		String json_data="";
		
		Gson gson=new Gson();
		for(int i=0;i<list.size();i++){
			Calendar_Dto dto=list.get(i);
			int time=dto.getTime();
			int end_time=time+3;
			title=dto.getMember_name()+" / "+dto.getMember_id()+"님의 예약";
			if(time<10){
				start=dto.getRes_date()+"T0"+time+":00:00";
			}else {
				start=dto.getRes_date()+"T"+time+":00:00";
			}
			if(end_time<10){
				end=dto.getRes_date()+"T0"+end_time+":00:00";		
			}else {
				end=dto.getRes_date()+"T"+end_time+":00:00";	
			}
			
			url="../calendar?cmd=CALENDAR_INFO&res_num="
			+dto.getRes_num()+"&res_date="+dto.getRes_date()+"&member_id="+dto.getMember_id()+"&member_name="+dto.getMember_name();
				
			data_list.add(new Calendar_Data(title, start,end,url));
			
		}
		
		json_data=gson.toJson(data_list);
		
		req.setAttribute("list", list);
		req.setAttribute("data", json_data);
			
		return "mypage/staff/main/content/Calendar_Data.jsp";
	}

}
