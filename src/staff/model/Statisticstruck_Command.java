package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Site_info_Dto;
import staff.db.Stastistictrcuk_Dto;
import staff.db.staff_Dao;

public class Statisticstruck_Command implements Command {

	String subsql="";
	int sum=0;
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		staff_Dao dao=new staff_Dao();
		Site_info_Dto dto=dao.get_SiteinfoData();	
		

		String params=req.getParameter("params");
		String car_num=req.getParameter("car_num");
		String car_type=req.getParameter("car_type");
		String date1=req.getParameter("date1");
		String date2=req.getParameter("date2");
		String cnt=req.getParameter("cnt");
		String capacity=req.getParameter("truck_capacity");
		
		
		if(params!=null){
			
			boolean flag=false;
	
			if(!car_num.equals("")||!date1.equals("")||!date2.equals("")||!car_type.equals("")||!cnt.equals("")||!capacity.equals("0")){
				subsql+=" where ";
			}
			
			if(!car_num.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" car_num like '"+car_num+"'";
				flag=true;
			}
			if(!car_type.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" car_type like '"+car_type+"'";
				flag=true;
			}
			if(!cnt.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" cnt="+cnt;
				flag=true;
			}
			if(!capacity.equals("0")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" truck_capacity="+capacity;
				flag=true;
			}
			if(!date1.equals("")&&!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_truck >= '"+date1+"' and  regi_date_truck <= '"+date2+"'";
				flag=true;

			}else if(!date1.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_truck >= '"+date1+"'";
				flag=true;

			}else if(!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_truck <= '"+date2+"'";
				flag=true;

			}
		}
		
			
		Vector<Stastistictrcuk_Dto> list=dao.get_StastisticTruckData(subsql);
		
		for(int i=0;i<list.size();i++){
			sum+=Integer.valueOf(list.get(i).getCnt());
		}		
		
		req.setAttribute("sum", sum);
		req.setAttribute("list_size", list.size());
		req.setAttribute("list", list);
		req.setAttribute("data", dto);
		req.setAttribute("boardpage","STATISTICS_TRUCK");
		return "mypage/staff/statistics/content/truck_statistics_content.jsp";
	}

}
