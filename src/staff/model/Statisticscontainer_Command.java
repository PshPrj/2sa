package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Site_info_Dto;
import staff.db.StastistictContainer_Dto;
import staff.db.staff_Dao;

public class Statisticscontainer_Command implements Command {
	
	String subsql="";
	int sum=0;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		staff_Dao dao=new staff_Dao();
		Site_info_Dto dto=dao.get_SiteinfoData();
		
		
		String params=req.getParameter("params");
		String num=req.getParameter("num");
		String name=req.getParameter("name");
		String date1=req.getParameter("date1");
		String date2=req.getParameter("date2");
		String cnt=req.getParameter("cnt");
		String capacity=req.getParameter("capacity");
		
		
		if(params!=null){
			
			boolean flag=false;
	
			if(!num.equals("")||!date1.equals("")||!date2.equals("")||!name.equals("")||!cnt.equals("")||!capacity.equals("0")){
				subsql+=" where ";
			}
			
			if(!num.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" c.container_num ="+num;
				flag=true;
			}
			if(!name.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" con_name like '"+name+"'";
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
				subsql+=" container_capacity="+capacity;
				flag=true;
			}
			if(!date1.equals("")&&!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_container >= '"+date1+"' and  regi_date_container <= '"+date2+"'";
				flag=true;

			}else if(!date1.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_container >= '"+date1+"'";
				flag=true;

			}else if(!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date_container <= '"+date2+"'";
				flag=true;

			}
		}
		
	
		
		Vector<StastistictContainer_Dto> list=dao.get_StastisticContainerData(subsql);
		
		for(int i=0;i<list.size();i++){
			sum+=list.get(i).getCnt();
		}
		
		req.setAttribute("sum", sum);
		req.setAttribute("list_size", list.size());
		req.setAttribute("list", list);
		req.setAttribute("data", dto);
		req.setAttribute("boardpage","STATISTICS_CONTAINER");
		return "mypage/staff/statistics/content/container_statistics_content.jsp";
	}

}
