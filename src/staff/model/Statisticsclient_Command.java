package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Site_info_Dto;
import staff.db.Stastisticsclient_Dto;
import staff.db.staff_Dao;

public class Statisticsclient_Command implements Command {
	
	private int sum_move=0;
	private int sum_member=0;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		staff_Dao dao=new staff_Dao();
		Site_info_Dto dto=dao.get_SiteinfoData();
		
		String subsql="";
		
		
		String params=req.getParameter("params");
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String date1=req.getParameter("date1");
		String date2=req.getParameter("date2");
		boolean flag=false;
		
		if(params!=null){
			
			if(!id.equals("")){
				
				if(flag){
					subsql+=" and ";
				}
				
				subsql+="member_id like '%"+id+"%'";
				flag=true;				
			}
			

			if(!name.equals("")){
				if(flag){
					subsql+=" and ";
				}
				
				subsql+="member_name like '%"+name+"%'";
				flag=true;	
			}
			
			if(!date1.equals("")&&!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date >= '"+date1+"' and  regi_date <= '"+date2+"'";
				flag=true;
			}else if(!date1.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date >= '"+date1+"'";
				flag=true;
			}else if(!date2.equals("")){
				if(flag){
					subsql+=" AND ";
				}
				subsql+=" regi_date <= '"+date2+"'";
				flag=true;
			}
		}
	
		Vector<Stastisticsclient_Dto> list=dao.get_ClientStastitics(subsql);
		
		sum_member=list.size();
		
		for(int i=0;i<list.size();i++){
			sum_move+=list.get(i).getMove_cnt();
		}	
		
		req.setAttribute("data", dto);
		req.setAttribute("move_sum", sum_move);
		req.setAttribute("list", list);
		req.setAttribute("member_sum", sum_member);
		req.setAttribute("boardpage","STATISTICS_CLIENT");
		return "mypage/staff/statistics/content/member_statistics_content.jsp";
	}

}
