/*

 	담당 : 윤초희
	최종 수정 일자 : 6/21
	main 페이지 일정 확인에 data input.

 */
package main.model;

import java.io.IOException;
import java.util.Calendar;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.google.gson.Gson;

import main.dao.Main_dao;
import main.dto.Calendar_Main_Data_Dto;
import main.dto.Calendar_Main_Dto;
import mypage.model.Command;


public class CalendarData_Main_Command implements Command {
	
	Main_dao dao=new Main_dao();
	String date,title;
	Vector<Calendar_Main_Data_Dto> data=new Vector<>();
	Gson gson=new Gson();
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	
		String json_data="";
		Vector<Calendar_Main_Dto> list=dao.get_CalendarSumData();
		System.out.println(list.size()+" 갯수");
		for(int i=0;i<list.size();i++){
			Calendar_Main_Data_Dto dto=new Calendar_Main_Data_Dto();
			dto.setTitle("예약 수 : "+list.get(i).getCnt());
			dto.setStart(list.get(i).getDate());
			System.out.println(date);
			data.add(dto);
		}
		
		json_data=gson.toJson(data);
		System.out.println(json_data+"제이슨 데이터");
		req.setAttribute("data", json_data);
		return "/main/modal/Calendar_Data.jsp";
	}

}
