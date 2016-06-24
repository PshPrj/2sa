package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Site_info_Dto;
import staff.db.Statisticsite_Dto;
import staff.db.staff_Dao;

public class Stastitics_Command implements Command{
	
	private staff_Dao dao=new staff_Dao();
	private Vector<Statisticsite_Dto> list;
	private double distance_sum=0;
	private int price_sum=0;
	private int refund_sum=0;

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String sql="";
		boolean flag=false;
		String params=(String)req.getParameter("params");
		String id=req.getParameter("id");
		String con=req.getParameter("con");
		String truck=req.getParameter("truck");
		String refund=req.getParameter("refund");
		String price1=req.getParameter("price1");
		String price2=req.getParameter("price2");
		String date1=req.getParameter("date1");
		String date2=req.getParameter("date2");

		
		if(params!=null){
						
			if(!id.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+="member_id like '%"+id+"%'";
				flag=true;
			}
			
			if(!con.equals("")){
				if(flag){
					sql+=" AND ";
				}
				
				sql+=" con_name like '%"+con+"%'";
				flag=true;
			}
			
			if(!truck.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" car_type like '%"+truck+"%'";
				flag=true;
			}
			
			if(refund!=null){
				if(flag){
					sql+=" AND ";
				}
				sql+=" is_refund=true";
				flag=true;
			}
			
			if(!price1.equals("")&&!price2.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" price between "+price1+" and "+price2;
				flag=true;
			}else if(!price1.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" price >= "+price1;
				flag=true;
			}else if(!price2.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" price <= "+price2;
				flag=true;
			}
			
			if(!date1.equals("")&&!date2.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" payment_date >= '"+date1+"' and  payment_date <= '"+date2+"'";
				flag=true;
			}else if(!date1.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" payment_date >= '"+date1+"'";
				flag=true;
			}else if(!date2.equals("")){
				if(flag){
					sql+=" AND ";
				}
				sql+=" payment_date <= '"+date2+"'";
				flag=true;
			}
			
			
		}
		
		list=dao.get_AllStatisticsite(sql);
	
		
		for(int i=0;i<list.size();i++){
			Statisticsite_Dto data=list.get(i);
			price_sum+=data.getPrice();
			distance_sum+=data.getDistance();
			if(data.getIsrefund()==1){
				refund_sum+=1;
			}
		}
		
	
	
		Site_info_Dto dto=dao.get_SiteinfoData();
		
		req.setAttribute("all_order", list.size());
		req.setAttribute("sum_move", list.size()-refund_sum);
		req.setAttribute("sum_refund", refund_sum);
		req.setAttribute("data", dto);
		req.setAttribute("list", list);
		req.setAttribute("boardpage","STATISTICS");
		req.setAttribute("sum_dist", distance_sum);
		req.setAttribute("sum_price", price_sum);
		return "mypage/staff/statistics/content/all_statistics_content.jsp";
	}
}
